//
//  HarryPotterHousesViewModelTests.swift
//  bookTests
//
//  Created by Daria on 12.07.2024.
//

import Combine
import XCTest
@testable import book

final class HarryPotterHousesViewModelTests: XCTestCase {
    
    private var sut: HarryPotterHousesViewModel!
    private var subscriptions = Set<AnyCancellable>()

    override func setUpWithError() throws {
        sut = HarryPotterHousesViewModel()
        subscriptions = Set<AnyCancellable>()
    }
    
    override func tearDown() {
        sut = nil
        subscriptions.removeAll()
    }
    
    func test_loadingShouldStarted() {
        XCTAssertTrue(sut.isLoading, "Loading should started")
    }
    
    func test_errorShouldntBeShown() {
        XCTAssertFalse(sut.isShowError, "Error shouldn't be shown")
    }
    
}
