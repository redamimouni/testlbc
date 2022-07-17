//
//  ItemRepository.swift
//  TestLeBoncoin
//
//  Created by Reda Mimouni on 14/07/2022.
//

import Foundation

class ItemRepositoryImpl: ItemRepository {
    func fetchItemList(completion: @escaping (Result<[ItemDTO], NetworkError>) -> Void) {
        guard let request = URLRequest.urlRequestFrom(urlString: APIEndpoints.listing.rawValue) else {
            completion(.failure(.wrongUrlError))
            return
        }
        let task = URLSession.shared.dataTask(with: request, cachedResponse: true) { [weak self] data, response, error in
            if let _ = error {
                completion(.failure(.httpRequestError))
            }
            guard let data = data else {
                completion(.failure(.errorDataFetch))
                return
            }
            print("HTTP Status code: \((response as! HTTPURLResponse).statusCode)")
            self?.decodeEntityFromData(data: data, completion: completion)
        }
        task.resume()
    }

    private func decodeEntityFromData(data: Data, completion: @escaping (Result<[ItemDTO], NetworkError>) -> Void) {
        do {
            let jsonFromData = try JSONDecoder().decode(ItemListDTO.self, from: data)
            completion(.success(jsonFromData))
        } catch {
            print("Error took place\(error)")
            completion(.failure(.parsingError))
        }
    }
}
