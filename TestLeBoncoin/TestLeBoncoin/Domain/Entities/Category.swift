//
//  Category.swift
//  TestLeBoncoin
//
//  Created by Reda Mimouni on 14/07/2022.
//

import Foundation

struct Category: Equatable {
    let id: Int
    let name: String

    static var unknown: Category {
        return Category(id: 9999, name: "Unknown")
    }
}
