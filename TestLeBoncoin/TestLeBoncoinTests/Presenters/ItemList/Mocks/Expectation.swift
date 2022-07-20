//
//  Expectation.swift
//  TestLeBoncoinTests
//
//  Created by Reda Mimouni on 14/07/2022.
//

import XCTest
@testable import TestLeBoncoin

struct Expectation<T> {
    var expectation: XCTestExpectation
    var result: (T) -> Void
}
