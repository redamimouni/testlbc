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
        let task = URLSession.shared.dataTask(with: request, cachedResponseOnError: true) { [weak self] data, response, error in
            if let _ = error {
                completion(.failure(.unfoundImage))
            }
            guard let data = data else {
                completion(.failure(.unfoundImage))
                return
            }
            print("HTTP Status code: \((response as! HTTPURLResponse).statusCode)")
            self?.decodeEntityFromData(data: data, completion: completion)
        }
        task.resume()
    }

    private func decodeEntityFromData(data: Data, completion: @escaping (Result<[Item], DomainError>) -> Void) {
        do {
            let jsonFromData = try JSONDecoder().decode(ItemListDTO.self, from: data)
            completion(.success(jsonFromData.toDomain()))
        } catch {
            print("Error took place\(error)")
            completion(.failure(.unfoundImage))
        }
    }
}
