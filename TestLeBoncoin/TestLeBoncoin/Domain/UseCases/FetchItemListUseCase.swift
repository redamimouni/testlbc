//
//  FetchItemListUseCase.swift
//  TestLeBoncoin
//
//  Created by Reda Mimouni on 14/07/2022.
//

import Foundation

protocol FetchItemListUseCase {
    func execute(completion: @escaping (Result<[Item], DomainError>) -> Void)
}

final class FetchItemListUseCaseImpl: FetchItemListUseCase {
    private let repository: ItemRepository

    init(repository: ItemRepository) {
        self.repository = repository
    }

    func execute(completion: @escaping (Result<[Item], DomainError>) -> Void) {
        repository.fetchItemList { result in
            switch result {
            case .success(let items):
                completion(.success(items))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
