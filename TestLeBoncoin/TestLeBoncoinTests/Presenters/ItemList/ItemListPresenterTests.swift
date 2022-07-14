//
//  ItemListPresenterTests.swift
//  TestLeBoncoinTests
//
//  Created by Reda Mimouni on 13/07/2022.
//

import XCTest
@testable import TestLeBoncoin

class ItemListPresenterTests: XCTestCase {

    lazy var presenter: ItemListPresenter = {
        return ItemListPresenter(useCase: useCase)
    }()

    var useCase = FetchItemListUseCaseMock()

    let expectation: XCTestExpectation = XCTestExpectation(description: "itemPresenterExpectation")
    var message: String = ""

    func test_fetchItemList_shouldSuccess() {
        // Given
        var result: [ItemViewModel] = []
        useCase.mockedResult = .success([Item.mock])
        let testParameter = Expectation(
            expectation: expectation) {
                result = $0
            }
        let view = ItemListMock(testParameter: testParameter)
        presenter.delegate = view

        // When
        presenter.fetchItemList()
        wait(for: [expectation], timeout: 2)

        // Then
        XCTAssertEqual(result, [ItemViewModel(title: "title", price: "1.2 €", image: UIImage())])
    }

    func test_fetchItemList_shouldFailWithTitleMessage() {
        //Given
        useCase.mockedResult = .failure(.unfoundTitle)
        let testParameter = Expectation(
            expectation: expectation) {
                self.message = $0
            }
        let view = ItemListMock(testParameter: testParameter)
        presenter.delegate = view

        // When
        presenter.fetchItemList()
        wait(for: [expectation], timeout: 2)

        // Then
        XCTAssertEqual(message, "Domain rule: some title is missing")
    }

    func test_fetchItemList_shouldFailWithImageMessage() {
        //Given
        useCase.mockedResult = .failure(.unfoundImage)
        let testParameter = Expectation(
            expectation: expectation) {
                self.message = $0
            }
        let view = ItemListMock(testParameter: testParameter)
        presenter.delegate = view

        // When
        presenter.fetchItemList()
        wait(for: [expectation], timeout: 2)

        // Then
        XCTAssertEqual(message, "Domain rule: some image is missing")
    }

    func test_fetchItemList_shouldFailWithPriceMessage() {
        //Given
        useCase.mockedResult = .failure(.unfoundPrice)
        let testParameter = Expectation(
            expectation: expectation) {
                self.message = $0
            }
        let view = ItemListMock(testParameter: testParameter)
        presenter.delegate = view

        // When
        presenter.fetchItemList()
        wait(for: [expectation], timeout: 2)

        // Then
        XCTAssertEqual(message, "Domain rule: some price is missing")
    }

    func test_fetchItemList_shouldFailWithCategoryMessage() {
        //Given
        useCase.mockedResult = .failure(.unfoundCategory)
        let testParameter = Expectation(
            expectation: expectation) {
                self.message = $0
            }
        let view = ItemListMock(testParameter: testParameter)
        presenter.delegate = view

        // When
        presenter.fetchItemList()
        wait(for: [expectation], timeout: 2)

        // Then
        XCTAssertEqual(message, "Domain rule: some category is missing")
    }
}

extension Item {
    static let mock = Item(
        id: 1,
        title: "title",
        description: "description",
        price: 1.2,
        isUrgent: true,
        category: Category(id: 1, name: "fdsfs"),
        image: Data()
    )
}
