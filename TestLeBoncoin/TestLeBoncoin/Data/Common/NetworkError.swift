//
//  NetworkError.swift
//  TestLeBoncoin
//
//  Created by Reda Mimouni on 15/07/2022.
//

import Foundation

enum NetworkError: Error {
    case httpRequestError
    case errorDataFetch
    case parsingError
}
