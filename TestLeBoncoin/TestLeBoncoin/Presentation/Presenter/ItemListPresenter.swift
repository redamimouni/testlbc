//
//  ItemListPresenter.swift
//  TestLeBoncoin
//
//  Created by Reda Mimouni on 13/07/2022.
//

import Foundation

protocol ItemListDelegate: NSObjectProtocol {
    func displayItemList(items: [ItemViewModel], categories: [String])
    func displayError(message: String)
}

final class ItemListPresenter {
    private let useCase: FetchItemListUseCase

    weak var delegate: ItemListDelegate?

    init(useCase: FetchItemListUseCase) {
        self.useCase = useCase
    }

    func fetchItemList() {
        useCase.execute { [weak self] result in
            switch result {
            case .success(let itemList):
                let itemList = itemList.map({ $0.toViewModel()})
                self?.delegate?.displayItemList(
                    items: itemList,
                    categories: Array(
                        Set(itemList.compactMap({
                            $0.categoryName
                        }))
                    ))
            case .failure(let error):
                self?.delegate?.displayError(message: error.rawValue)
            }
        }
    }

    func loadImage(with url: String, completion: @escaping(Data?) -> Void) {
        useCase.loadImage(with: url, completion: completion)
    }
}
