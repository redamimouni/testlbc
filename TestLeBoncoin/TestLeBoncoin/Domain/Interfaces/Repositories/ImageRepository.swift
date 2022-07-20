//
//  ImageRepository.swift
//  TestLeBoncoin
//
//  Created by Reda Mimouni on 15/07/2022.
//

import Foundation

protocol ImageRepository {
    func fetchImage(with imagePath: String, completion: @escaping (Result<Data, NetworkError>) -> Void)
}
