//
//  SearchViewUITests.swift
//  bookUITests
//
//  Created by Daria on 11.07.2024.
//

import XCTest
@testable import book

final class SearchViewUITests: XCTestCase {
    
    private var app: XCUIApplication!
    
    override func setUpWithError() throws {
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
        
        // to navigate to sut
        let bossButton = app.buttons["bossButton"]
        bossButton.tap()
        
        let menuGrid = app.otherElements["menuGrid"]
        
        let cell = menuGrid.images["menuCellImage - 0"]
        cell.tap()
    }
    
    override func tearDown() {
        app = nil
    }
         
    func test_searchTextFieldExists() {
        let searchTextField = app.textFields["searchTextField"]
        
        XCTAssertTrue(searchTextField.exists, "SearchTextField should exist")
    }
    
    func test_backButtonExists() {
        let backButton = app.buttons["searchBackButton"]
        
        XCTAssertTrue(backButton.exists, "SearchBackButton should exist")
    }
    
    func test_defaultSearchTextShouldExists() {
        let searchBooksLabel = app.staticTexts["searchBooksLabel"]
        
        XCTAssertTrue(searchBooksLabel.exists, "SearchBooksLabel should exist")
    }
    
    func test_searchViewElementsExist() {
        let searchTextField = app.textFields["searchTextField"]
        XCTAssertTrue(searchTextField.exists, "Search text field should exist")
        
        searchTextField.tap()
        searchTextField.typeText("Harry Potter")
        
        XCTAssertEqual(searchTextField.value as? String, "Harry Potter", "Search text field should contain the entered text")
    }
    
    // todo: deal with the problem of not getting List

}
