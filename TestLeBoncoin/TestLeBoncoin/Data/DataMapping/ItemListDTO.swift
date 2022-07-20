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
    let title, iDescription: String
    let price: Double
    let imagesURL: ImagesURL
    let creationDate: String
    let isUrgent: Bool
    let siret: String?

    enum CodingKeys: String, CodingKey {
        case id
        case categoryID = "category_id"
        case title
        case iDescription = "description"
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

// MARK: - ItemListDTO

typealias ItemListDTO = [ItemDTO]
