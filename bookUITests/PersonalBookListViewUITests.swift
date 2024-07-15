//
//  PersonalBookListViewUITests.swift
//  bookUITests
//
//  Created by Daria on 12.07.2024.
//

import XCTest
@testable import book

final class PersonalBookListViewUITests: XCTestCase {
    
    private var app: XCUIApplication!
    
    override func setUpWithError() throws {
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
        
        // to navigate to sut
        let bossButton = app.buttons["bossButton"]
        bossButton.tap()
        
        let menuGrid = app.otherElements["menuGrid"]
        
        let cell = menuGrid.images["menuCellImage - 1"]
        cell.tap()
    }
    
    override func tearDown() {
        app = nil
    }
    
    func test_backButtonShouldExists() {
        let backButton = app.buttons["bookListBackButton"]
        
        XCTAssertTrue(backButton.exists, "Back button should exists")
    }
    
    func test_emptyStateTextShouldExists() {
        let text = app.staticTexts["bookListEmptyStateText"]
        
        XCTAssertTrue(text.exists, "Empty state should exists")
    }
    
}
