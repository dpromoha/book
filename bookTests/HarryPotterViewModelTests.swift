//
//  HarryPotterViewModelTests.swift
//  bookTests
//
//  Created by Daria on 12.07.2024.
//

import Combine
import XCTest
@testable import book

final class HarryPotterViewModelTests: XCTestCase {
    
    private var sut: HarryPotterViewModel!
    private var subscriptions = Set<AnyCancellable>()

    override func setUpWithError() throws {
        sut = HarryPotterViewModel()
        subscriptions = Set<AnyCancellable>()
    }
    
    override func tearDown() {
        sut = nil
        subscriptions.removeAll()
    }
    
    func test_housesChoiceShouldBeShown() {
        let expectation = XCTestExpectation()
        XCTAssertFalse(sut.isShowHousesDetails, "Houses details shouldn't be shown")
        
        sut.showHouseChoosing()
        
        sut.coordinator.$isShowingHPHousesSheet
            .filter { $0 }
            .sink { _ in
                XCTAssertTrue(self.sut.isShowHousesDetails, "Houses details should be shown")
                expectation.fulfill()
            }.store(in: &subscriptions)
        
        wait(for: [expectation], timeout: 1.0)
    }
    
    func test_sheetShouldntBeNil() {
        let expectation = XCTestExpectation()
        XCTAssertNil(sut.sheetContent)

        sut.showHouseChoosing()
        
        sut.coordinator.$isShowingSheet
            .sink { [weak self] _ in
                guard let self = self else { return }

                XCTAssertNotNil(self.sut.sheetContent, "Sheet shouldn't be nil")
                expectation.fulfill()
            }.store(in: &subscriptions)
        
        wait(for: [expectation], timeout: 1.0)
    }
    
}
