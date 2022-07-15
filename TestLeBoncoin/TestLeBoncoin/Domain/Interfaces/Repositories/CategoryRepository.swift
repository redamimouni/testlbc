//
//  CategoryRepository.swift
//  TestLeBoncoin
//
//  Created by Reda Mimouni on 15/07/2022.
//

import Foundation

protocol CategoryRepository {
    func fetchCategoryList(completion: @escaping(Result<[CategoryDTO], NetworkError>) -> Void)
}
