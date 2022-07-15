//
//  ItemRepositoryMock.swift
//  TestLeBoncoinTests
//
//  Created by Reda Mimouni on 14/07/2022.
//

import Foundation
@testable import TestLeBoncoin

final class ItemRepositoryMock: ItemRepository {
    var mockedResult: Result<[ItemDTO], NetworkError>!

    func fetchItemList(completion: @escaping (Result<[ItemDTO], NetworkError>) -> Void) {
        completion(mockedResult)
    }
}

extension ItemDTO {
    static let mock = ItemDTO(
        id: 1,
        categoryID: 1,
        title: "title",
        iDescription: "description",
        price: 1.2,
        imagesURL: ImagesURL(small: "smallUrl", thumb: "thumbUrl"),
        creationDate: "10/10/2019",
        isUrgent: true,
        siret: "siret"
    )

    static let mock2 =  ItemDTO(
        id: 2,
        categoryID: 1,
        title: "second title",
        iDescription: "second description",
        price: 14,
        imagesURL: ImagesURL(small: "smallUrl", thumb: "thumbUrl"),
        creationDate: "19/10/2021",
        isUrgent: false,
        siret: "siret"
    )

    static let mocks = [mock, mock2]
}

extension Item {
    static let mock = Item(
        id: 1,
        title: "title",
        description: "description",
        price: 1.2,
        isUrgent: true,
        category: Category.unknown,
        image: Data(),
        creationDate: "10/10/2019",
        siret: "siret"
    )

    static let mock2 = Item(
        id: 2,
        title: "second title",
        description: "second description",
        price: 14,
        isUrgent: false,
        category: Category.unknown,
        image: Data(),
        creationDate: "19/10/2021",
        siret: "siret"
    )

    static let mocks = [mock, mock2]
}
