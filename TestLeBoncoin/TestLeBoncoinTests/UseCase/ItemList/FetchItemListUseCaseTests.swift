//
//  ItemList.swift
//  TestLeBoncoinTests
//
//  Created by Reda Mimouni on 14/07/2022.
//

import XCTest
@testable import TestLeBoncoin

final class FetchItemListUseCaseTests: XCTestCase {

    private lazy var useCase: FetchItemListUseCase = {
        return FetchItemListUseCaseImpl(repository: repository)
    }()

    var repository = ItemRepositoryMock()

    func test_execute_shouldReturnSuccess() {
        // Given
        repository.mockedResult = .success(Item.mocks)

        // When
        useCase.execute { result in
            // Then
            switch result {
            case .success(let items):
                XCTAssertEqual(items, Item.mocks)
            case .failure(let error):
                XCTFail("Result should be success but got \(error)")
            }
        }
    }

    func test_execute_shouldReturnFailure() {
        // Given
        repository.mockedResult = .failure(.unfoundCategory)

        // When
        useCase.execute { result in
            // Then
            switch result {
            case .success(_):
                XCTFail()
            case .failure(let error):
                XCTAssertEqual(error, .unfoundCategory)
            }
        }
    }
}
