//
//  FetchItemListUseCaseMock.swift
//  TestLeBoncoinTests
//
//  Created by Reda Mimouni on 14/07/2022.
//

import Foundation
@testable import TestLeBoncoin

final class FetchItemListUseCaseMock: FetchItemListUseCase {
    var mockedResult: Result<[Item], DomainError>!

    func execute(completion: @escaping (Result<[Item], DomainError>) -> Void) {
        completion(mockedResult)
    }
}
