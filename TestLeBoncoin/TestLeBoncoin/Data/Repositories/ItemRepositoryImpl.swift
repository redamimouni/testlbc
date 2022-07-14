//
//  ItemRepository.swift
//  TestLeBoncoin
//
//  Created by Reda Mimouni on 14/07/2022.
//

import Foundation

class ItemRepositoryImpl: ItemRepository {

    func fetchItemList(completion: @escaping (Result<[Item], DomainError>) -> Void) {
        let request = URLRequest.urlRequestFrom(urlString: APIEndpoints.listing.rawValue)
        let task = URLSession.shared.dataTask(with: request, cachedResponseOnError: true) { data, response, error in
            if let _ = error {
                completion(.failure(.unfoundImage))
            }
            guard let data = data else {
                completion(.failure(.unfoundImage))
                return
            }
            print("HTTP Status code: \((response as! HTTPURLResponse).statusCode)")
        }
        task.resume()
    }
}
