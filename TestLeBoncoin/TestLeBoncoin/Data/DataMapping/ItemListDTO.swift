//
//  ItemListDTO.swift
//  TestLeBoncoin
//
//  Created by Reda Mimouni on 15/07/2022.
//

import Foundation

// MARK: - ItemDTO
struct ItemDTO: Codable {
    let id, categoryID: Int
    let title, welcomeDescription: String
    let price: Double
    let imagesURL: ImagesURL
    let creationDate: String
    let isUrgent: Bool
    let siret: String?

    enum CodingKeys: String, CodingKey {
        case id
        case categoryID = "category_id"
        case title
        case welcomeDescription = "description"
        case price
        case imagesURL = "images_url"
        case creationDate = "creation_date"
        case isUrgent = "is_urgent"
        case siret
    }
}

// MARK: - ImagesURL
struct ImagesURL: Codable {
    let small, thumb: String?
}

typealias ItemListDTO = [ItemDTO]

extension ItemListDTO {
    func toDomain() -> [Item] {
        return map {
            Item(
                id: $0.id,
                title: $0.title,
                description: $0.welcomeDescription,
                price: $0.price,
                isUrgent: $0.isUrgent,
                category: Category(id: $0.categoryID, name: ""),
                image: Data(),
                creationDate: $0.creationDate,
                siret: $0.siret
            )
        }
    }
}
