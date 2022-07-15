//
//  CategoryRepositoryImpl.swift
//  TestLeBoncoin
//
//  Created by Reda Mimouni on 15/07/2022.
//

import Foundation

class CategoryRepositoryImpl: CategoryRepository {
    func fetchCategoryList(completion: @escaping (Result<[CategoryDTO], NetworkError>) -> Void) {
        let request = URLRequest.urlRequestFrom(urlString: APIEndpoints.categories.rawValue)
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

    private func decodeEntityFromData(data: Data, completion: @escaping (Result<[CategoryDTO], NetworkError>) -> Void) {
        do {
            let jsonFromData = try JSONDecoder().decode(CategoryListDTO.self, from: data)
            completion(.success(jsonFromData))
        } catch {
            print("Error took place\(error)")
            completion(.failure(.parsingError))
        }
    }
}
