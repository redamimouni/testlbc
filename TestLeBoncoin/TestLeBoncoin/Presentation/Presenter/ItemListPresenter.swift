//
//  ItemListPresenter.swift
//  TestLeBoncoin
//
//  Created by Reda Mimouni on 13/07/2022.
//

import Foundation

protocol ItemListDelegate: NSObjectProtocol {
    func displayItemList(items: [ItemViewModel])
    func displayError()
}

class ItemListPresenter {
    private let useCase: FetchItemListUseCase

    weak var delegate: ItemListDelegate?

    init(useCase: FetchItemListUseCase) {
        self.useCase = useCase
    }

    func fetchItemList() {
        useCase.execute { [weak self] result in
            switch result {
            case .success(let itemList):
                self?.delegate?.displayItemList(items: itemList.map({
                    $0.toViewModel()
                }))
            case .failure(_):
                self?.delegate?.displayError()
            }
        }
    }
}
