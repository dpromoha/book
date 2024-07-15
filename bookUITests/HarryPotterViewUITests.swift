//
//  HarryPotterViewUITests.swift
//  bookUITests
//
//  Created by Daria on 12.07.2024.
//

import XCTest
@testable import book

final class HarryPotterViewUITests: XCTestCase {
    
    private var app: XCUIApplication!
    
    override func setUpWithError() throws {
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
        
        // to navigate to sut
        let bossButton = app.buttons["bossButton"]
        bossButton.tap()
        
        let menuGrid = app.otherElements["menuGrid"]
        
        let cell = menuGrid.images["menuCellImage - 2"]
        cell.tap()
    }
    
    override func tearDown() {
        app = nil
    }
    
    func test_backgroundViewShouldExists() {
        let backgroundView = app.images["harryPotterBackground"]
        
        XCTAssertTrue(backgroundView.exists, "Background view should exists")
    }
    
    func test_chooseButtonShouldBeTapped() {
        let button = app.buttons["chooseHouseButton"]
        XCTAssertTrue(button.exists, "Button should exists")
        
        button.tap()
        
        let backButton = app.buttons["harryPotterHousesBackButton"]
        
        XCTAssertTrue(backButton.exists, "Back button should exists")
    }
    
    func test_scrollViewShouldExists() {
        XCTAssertTrue(app.scrollViews["harryPotterScrollView"].exists, "Scroll view should exists")
    }
    
}
