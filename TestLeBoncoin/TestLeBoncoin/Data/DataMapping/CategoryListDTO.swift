//
//  CategoryListDTO.swift
//  TestLeBoncoin
//
//  Created by Reda Mimouni on 15/07/2022.
//

import Foundation

// MARK: - WelcomeElement
struct CategoryDTO: Codable {
    let id: Int?
    let name: String?
}

typealias CategoryListDTO = [CategoryDTO]

extension CategoryDTO {
    func toDomain() -> ItemCategory {
        guard let categoryId = id, let categoryName = name else {
            return ItemCategory.unknown
        }
        return ItemCategory(id: categoryId, name: categoryName)
    }
}
