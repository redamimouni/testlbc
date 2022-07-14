//
//  FetchItemListRepository.swift
//  TestLeBoncoin
//
//  Created by Reda Mimouni on 14/07/2022.
//

import Foundation

protocol ItemRepository {
    func fetchItemList(completion: @escaping(Result<[Item], DomainError>) -> Void)
}
