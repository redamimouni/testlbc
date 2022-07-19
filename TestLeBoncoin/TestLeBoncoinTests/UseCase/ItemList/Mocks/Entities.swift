//
//  Entities.swift
//  TestLeBoncoinTests
//
//  Created by Reda Mimouni on 17/07/2022.
//

import Foundation
@testable import TestLeBoncoin

extension ItemCategory {
    static let mock = ItemCategory(id: 1, name: "animals")
    static let mock2 = ItemCategory(id: 2, name: "cars")
}

extension Item {
    static let mock = Item(
        id: 1,
        title: "title",
        description: "description",
        price: 1.2,
        isUrgent: true,
        category: ItemCategory.mock,
        imageUrl: "smallUrl",
        creationDate: "10/10/2019",
        siret: "siret"
    )

    static let mock2 = Item(
        id: 2,
        title: "second title",
        description: "second description",
        price: 14,
        isUrgent: false,
        category: ItemCategory.mock2,
        imageUrl: "smallUrl",
        creationDate: "19/10/2021",
        siret: "siret"
    )

    static let mocks = [mock, mock2]
}
