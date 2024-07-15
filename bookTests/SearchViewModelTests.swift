//
//  SearchViewModelTests.swift
//  bookTests
//
//  Created by Daria on 09.07.2024.
//

import Combine
import XCTest
@testable import book

final class SearchViewModelTests: XCTestCase {
    
    private var sut: SearchViewModel!
    private var subscriptions = Set<AnyCancellable>()

    override func setUpWithError() throws {
        sut = SearchViewModel()
        subscriptions = Set<AnyCancellable>()
    }
    
    override func tearDown() {
        sut = nil
        subscriptions.removeAll()
    }
    
    func test_detailsShouldBeShown() {
        let expectation = XCTestExpectation()
        XCTAssertFalse(sut.isBookSelected, "Book details shouldn't be shown")
        
        sut.showDetails()
        
        sut.coordinator.$isShowingDetailsSheet
            .filter { $0 }
            .sink { _ in
                XCTAssertTrue(self.sut.isBookSelected, "Book details should be shown")
                expectation.fulfill()
            }.store(in: &subscriptions)
        
        wait(for: [expectation], timeout: 1.0)
    }
    
    func test_sheetShouldntBeNil() {
        let expectation = XCTestExpectation()
        XCTAssertNil(sut.sheetContent)

        sut.showDetails()
        
        sut.coordinator.$isShowingSheet
            .sink { _ in
                XCTAssertNotNil(self.sut.sheetContent, "Sheet shouldn't be nil")
                expectation.fulfill()
            }.store(in: &subscriptions)
        
        wait(for: [expectation], timeout: 1.0)
    }
    
    func test_loadingShouldStarted() {
        let expectation = XCTestExpectation()
        
        XCTAssertFalse(sut.isLoading, "Loading shouldn't started")
        
        sut.$searchQuery
            .sink { _ in
                expectation.fulfill()
            }.store(in: &subscriptions)
        wait(for: [expectation], timeout: 1.0)
    
        sut.searchQuery = "search"
        XCTAssertTrue(sut.isLoading, "Loading should started")
    }
    
    func test_bookArrayShouldBeEmpty() {
        let expectation = XCTestExpectation()
                
        sut.$searchQuery
            .sink {_ in
                expectation.fulfill()
            }.store(in: &subscriptions)
        wait(for: [expectation], timeout: 1.0)
    
        sut.searchQuery = ""
        XCTAssertTrue(sut.books.isEmpty, "Book array should be empty")
    }
    
    func test_bookArrayShouldntBeEmpty() {
        let expectation = XCTestExpectation()
        sut.books = [Book(name: "name", bookTitle: "title")]
        
        sut.$searchQuery
            .sink { _ in
                expectation.fulfill()
            }.store(in: &subscriptions)
        
        wait(for: [expectation], timeout: 1.0)
        
        sut.searchQuery = "search"
        XCTAssertFalse(sut.books.isEmpty, "Book array shouldn't be empty")
    }
    
    func test_searchQueryChanges() {
        var searchQuery = ""
        let expectation = XCTestExpectation()
        
        sut.$searchQuery
            .sink { query in
                searchQuery = query
                expectation.fulfill()
            }
            .store(in: &subscriptions)
        wait(for: [expectation], timeout: 1.0)
        
        sut.searchQuery = "test"
        XCTAssertEqual(searchQuery, "test")
    }
    
}
