//
//  Item.swift
//  TestLeBoncoin
//
//  Created by Reda Mimouni on 14/07/2022.
//

import Foundation

struct Item: Equatable {
    let id: Int
    let title: String
    let description: String
    let price: Double
    let isUrgent: Bool
    let category: ItemCategory
    let imageUrl: String
    let creationDate: String
    let siret: String?
}
