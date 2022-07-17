//
//  ItemListViewMock.swift
//  TestLeBoncoinTests
//
//  Created by Reda Mimouni on 14/07/2022.
//

import XCTest
@testable import TestLeBoncoin

final class ItemListMock<T>: NSObject, ItemListDelegate {
    private let testParameter: Expectation<T>

    init(testParameter: Expectation<T>) {
        self.testParameter = testParameter
        super.init()
    }

    func displayItemList(items: ItemListViewModel) {
        testParameter.result(items as! T)
        testParameter.expectation.fulfill()
    }

    func displayError(message: String) {
        testParameter.result(message as! T)
        testParameter.expectation.fulfill()
    }
}
