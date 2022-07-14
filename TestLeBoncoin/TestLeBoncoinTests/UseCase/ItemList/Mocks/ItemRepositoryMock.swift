//
//  ItemRepositoryMock.swift
//  TestLeBoncoinTests
//
//  Created by Reda Mimouni on 14/07/2022.
//

import Foundation
@testable import TestLeBoncoin

final class ItemRepositoryMock: ItemRepository {
    var mockedResult: Result<[Item], DomainError>!

    func fetchItemList(completion: @escaping (Result<[Item], DomainError>) -> Void) {
        completion(mockedResult)
    }
}

extension Item {
    static let mock = Item(
        id: 1,
        title: "title",
        description: "description",
        price: 1.2,
        isUrgent: true,
        category: Category(id: 1, name: "category"),
        image: Data(),
        creationDate: Date()
    )

    static let mock2 = Item(
        id: 2,
        title: "second title",
        description: "second description",
        price: 4,
        isUrgent: false,
        category: Category(id: 2, name: "second category"),
        image: Data(),
        creationDate: Date()
    )

    static let mocks = [mock, mock2]
}
