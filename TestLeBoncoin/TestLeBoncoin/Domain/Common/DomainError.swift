//
//  DomainError.swift
//  TestLeBoncoin
//
//  Created by Reda Mimouni on 14/07/2022.
//

import Foundation

enum DomainError: String, Error {
    case unfoundTitle = "Domain rule: some title is missing"
    case unfoundCategory = "Domain rule: some category is missing"
    case unfoundImage = "Domain rule: some image is missing"
    case unfoundPrice = "Domain rule: some price is missing"
}
