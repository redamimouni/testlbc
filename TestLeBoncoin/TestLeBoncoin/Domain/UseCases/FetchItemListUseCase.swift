//
//  FetchItemListUseCase.swift
//  TestLeBoncoin
//
//  Created by Reda Mimouni on 14/07/2022.
//

import Foundation

protocol FetchItemListUseCase {
    func execute(completion: @escaping (Result<[Item], Error>) -> Void)
}

final class FetchItemListUseCaseImpl: FetchItemListUseCase {
    func execute(completion: @escaping (Result<[Item], Error>) -> Void) {
        completion(.success([
            Item(id: 1, title: "fdsfds", description: "fsdfds", price: 1.0, isUrgent: true, category: Category(id: 1, name: "fdsfs"), image: Data())
        ]))
    }
}
