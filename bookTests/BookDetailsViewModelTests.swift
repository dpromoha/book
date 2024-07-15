//
//  BookDetailsViewModelTests.swift
//  bookTests
//
//  Created by Daria on 09.07.2024.
//

import Combine
import XCTest
@testable import book

final class BookDetailsViewModelTests: XCTestCase {
        
    func test_titlesShouldBeEqual() {
        let title = "title"
        let sut = BookDetailsViewModel(title: title)
        
        XCTAssertEqual(title, sut.title, "Titles should be equal")
    }
    
    func test_loadingShouldStarted() {
        let sut = BookDetailsViewModel(title: "title")

        XCTAssertTrue(sut.isLoading, "Loading should started")
    }
    
    func test_errorShouldntBeShown() {
        let sut = BookDetailsViewModel(title: "title")

        XCTAssertFalse(sut.isShowError, "Error shouldn't be shown")
    }
        
}
