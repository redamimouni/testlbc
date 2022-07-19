//
//  FetchItemListUseCase.swift
//  TestLeBoncoin
//
//  Created by Reda Mimouni on 14/07/2022.
//

import Foundation

protocol FetchItemListUseCase {
    func execute(completion: @escaping (Result<[Item], DomainError>) -> Void)
    func loadImage(with urlPath: String, completion: @escaping (Data?) -> Void)
}

final class FetchItemListUseCaseImpl: FetchItemListUseCase {
    private let itemRepository: ItemRepository
    private let imageRepository: ImageRepository
    private let categoryRepository: CategoryRepository

    private var categoryList: CategoryListDTO?

    init(
        itemRepository: ItemRepository,
        imageRepository: ImageRepository,
        categoryRepository: CategoryRepository
    ) {
        self.itemRepository = itemRepository
        self.imageRepository = imageRepository
        self.categoryRepository = categoryRepository
    }

    func execute(completion: @escaping (Result<[Item], DomainError>) -> Void) {
        loadCategories { [weak self] result in
            switch result {
            case .success(let categories):
                self?.categoryList = categories
                self?.loadItems(completion: completion)
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }

    func loadImage(with urlPath: String, completion: @escaping (Data?) -> Void) {
        imageRepository.fetchImage(with: urlPath) { result in
            switch result {
            case .success(let data):
                completion(data)
            default:
                completion(nil)
            }
        }
    }

    private func convertItemToDomain(item: ItemDTO) -> Item {
        return Item(
            id: item.id,
            title: item.title,
            description: item.iDescription,
            price: item.price,
            isUrgent: item.isUrgent,
            category: categoryList?.first(where: { $0.id == item.categoryID })?.toDomain() ?? ItemCategory.unknown,
            imageUrl: item.imagesURL.small ?? "",
            creationDate: item.creationDate,
            siret: item.siret
        )
    }

    private func loadItems(completion: @escaping (Result<[Item], DomainError>) -> Void) {
        itemRepository.fetchItemList { result in
            switch result {
            case .success(let items):
                completion(.success(items.map { [weak self] item in
                    (self?.convertItemToDomain(item: item))!
                }))
            case .failure(_):
                completion(.failure(.networkError))
            }
        }
    }

    private func loadCategories(completion: @escaping (Result<CategoryListDTO, DomainError>) -> Void) {
        categoryRepository.fetchCategoryList { result in
            switch result {
            case .success(let categoryList):
                completion(.success(categoryList))
            case .failure(_):
                completion(.failure(.networkError))
            }
        }
    }
}
