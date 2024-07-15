//
//  HarryPotterHousesViewUITests.swift
//  bookUITests
//
//  Created by Daria on 12.07.2024.
//

import XCTest
@testable import book

final class HarryPotterHousesViewUITests: XCTestCase {
    
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
        
        let button = app.buttons["chooseHouseButton"]
        button.tap()
    }
    
    override func tearDown() {
        app = nil
    }
    
    func test_gridShouldExists() {
        let grid = app.otherElements["harryPotterHousesGrid"]
        
        XCTAssertTrue(grid.exists, "Grid should exists")
    }
    
    func test_numberOfCells() {
        let grid = app.otherElements["harryPotterHousesGrid"]
        
        XCTAssertEqual(grid.buttons.count, 4, "Number of cells should equal to 4")
    }
    
    func test_gryffindorCellExists() {
        let grid = app.otherElements["harryPotterHousesGrid"]
        let cell = grid.staticTexts["houseCellTitle: Gryffindor"]
        
        XCTAssertTrue(cell.exists, "Cell should exists")
    }
    
    func test_hufflepuffCellExists() {
        let grid = app.otherElements["harryPotterHousesGrid"]
        let cell = grid.staticTexts["houseCellTitle: Hufflepuff"]
        
        XCTAssertTrue(cell.exists, "Cell should exists")
    }
    
    func test_ravenclawCellExists() {
        let grid = app.otherElements["harryPotterHousesGrid"]
        let cell = grid.staticTexts["houseCellTitle: Ravenclaw"]
        
        XCTAssertTrue(cell.exists, "Cell should exists")
    }
    
    func test_slytherinCellExists() {
        let grid = app.otherElements["harryPotterHousesGrid"]
        let cell = grid.staticTexts["houseCellTitle: Slytherin"]
        
        XCTAssertTrue(cell.exists, "Cell should exists")
    }
    
    func test_slytherinCellExists222() {
        let grid = app.otherElements["harryPotterHousesGrid"]
        let cell = grid.staticTexts["houseCellTitle: Slytherin"]
        
        XCTAssertTrue(cell.exists, "Cell should exists")
    }
    
    
}
