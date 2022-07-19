//
//  Category.swift
//  TestLeBoncoin
//
//  Created by Reda Mimouni on 14/07/2022.
//

import Foundation

struct ItemCategory: Equatable {
    let id: Int
    let name: String

    static var unknown: ItemCategory {
        return ItemCategory(id: 9999, name: "Unknown")
    }
}
