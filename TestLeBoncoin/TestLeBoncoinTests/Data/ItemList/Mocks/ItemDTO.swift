//
//  ItemDTO.swift
//  TestLeBoncoinTests
//
//  Created by Reda Mimouni on 17/07/2022.
//

import Foundation
@testable import TestLeBoncoin

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
