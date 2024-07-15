//
//  MenuViewUITests.swift
//  bookUITests
//
//  Created by Daria on 11.07.2024.
//

import XCTest
@testable import book

final class MenuViewUITests: XCTestCase {
    
    var app: XCUIApplication!
    
    override func setUpWithError() throws {
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
        
        // to navigate to sut
        let bossButton = app.buttons["bossButton"]
        bossButton.tap()
    }
    
    override func tearDown() {
        app = nil
    }
    
    func test_menuGridShouldExists() {
        let menuGrid = app.otherElements["menuGrid"]
        
        XCTAssertTrue(menuGrid.exists, "The menu grid should exists in MenuView")
    }
    
    func test_menuGridsShoudExists() {
        let menuGrid = app.otherElements["menuGrid"]
        
        XCTAssertTrue(menuGrid.exists, "The menu grid should exists in MenuView")

        XCTAssertTrue(menuGrid.images["menuCellImage - 0"].exists)
        
        XCTAssertEqual(menuGrid.staticTexts.count, 3, "Number of menu grids should equals to 3")
    }
    
    func test_navigateToSearchView() {
        let menuGrid = app.otherElements["menuGrid"]
  
        let cell = menuGrid.images["menuCellImage - 0"]
        cell.tap()
        
        XCTAssertTrue(app.textFields["searchTextField"].exists, "Should be navigated to SearchView")
    }
    
    func test_navigateToBookListView() {
        let menuGrid = app.otherElements["menuGrid"]
  
        let cell = menuGrid.images["menuCellImage - 1"]
        cell.tap()
        
        XCTAssertTrue(app.staticTexts["emptyStateText"].exists, "Should be navigated to BookListView")
    }
    
    func test_navigateToHarryPotterView() {
        let menuGrid = app.otherElements["menuGrid"]
  
        let cell = menuGrid.images["menuCellImage - 2"]
        cell.tap()
        
        XCTAssertTrue(app.images["harryPotterBackground"].exists, "Should be navigated to HarryPotterView")
    }
    
}
