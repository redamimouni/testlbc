//
//  ItemListPresenter.swift
//  TestLeBoncoin
//
//  Created by Reda Mimouni on 13/07/2022.
//

import Foundation

protocol ItemListDelegate: NSObjectProtocol {
    func displayItemList(items: [ItemViewModel])
}

class ItemListPresenter {
    weak var delegate: ItemListDelegate?

    func fetchItemList() {
        delegate?.displayItemList(items: [
            ItemViewModel(
                title: "Statue homme noir assis en plâtre polychrome",
                price: "15 €",
                image: Data()
            ),
            ItemViewModel(
                title: "Statue homme noir assis en plâtre polychrome",
                price: "15 €",
                image: Data()
            ),
            ItemViewModel(
                title: "Statue homme noir assis en plâtre polychrome",
                price: "15 €",
                image: Data()
            ),
            ItemViewModel(
                title: "Statue homme noir assis en plâtre polychrome",
                price: "15 €",
                image: Data()
            ),
            ItemViewModel(
                title: "Statue homme noir assis en plâtre polychrome",
                price: "15 €",
                image: Data()
            )
        ])
    }
}
