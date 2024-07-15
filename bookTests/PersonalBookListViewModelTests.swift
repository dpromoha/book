//
//  PersonalBookListViewModelTests.swift
//  bookTests
//
//  Created by Daria on 12.07.2024.
//

import Combine
import XCTest
@testable import book

final class PersonalBookListViewModelTests: XCTestCase {
    
    private var sut: PersonalBookListViewModel!
    private var subscriptions = Set<AnyCancellable>()

    override func setUpWithError() throws {
        sut = PersonalBookListViewModel()
        subscriptions = Set<AnyCancellable>()
    }
    
    override func tearDown() {
        sut = nil
        subscriptions.removeAll()
    }
    
    func test_listShouldntBeShown() {
        XCTAssertFalse(sut.isShowList, "List shouldn't be shown")
    }
    
}
