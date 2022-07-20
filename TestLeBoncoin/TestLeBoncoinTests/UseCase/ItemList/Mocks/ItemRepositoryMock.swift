//
//  ItemRepositoryMock.swift
//  TestLeBoncoinTests
//
//  Created by Reda Mimouni on 14/07/2022.
//

import Foundation
@testable import TestLeBoncoin

final class ItemRepositoryMock: ItemRepository {
    var mockedResult: Result<ItemListDTO, NetworkError>!

    func fetchItemList(completion: @escaping (Result<ItemListDTO, NetworkError>) -> Void) {
        completion(mockedResult)
    }
}
