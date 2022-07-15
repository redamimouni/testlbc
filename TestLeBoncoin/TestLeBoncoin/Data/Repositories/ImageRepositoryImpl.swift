//
//  ImageRepositoryImpl.swift
//  TestLeBoncoin
//
//  Created by Reda Mimouni on 15/07/2022.
//

import Foundation

class ImageRepositoryImpl: ImageRepository {
    func fetchImage(with imagePath: String, completion: @escaping (Result<Data, NetworkError>) -> Void) {
        let request = URLRequest.urlRequestFrom(urlString: imagePath)
        let task = URLSession.shared.dataTask(with: request, cachedResponse: true) { data, response, error in
            if let _ = error {
                completion(.failure(.httpRequestError))
            }
            guard let data = data else {
                completion(.failure(.errorDataFetch))
                return
            }
            print("HTTP Status code: \((response as! HTTPURLResponse).statusCode)")
            completion(.success(data))
        }
        task.resume()
    }

}
