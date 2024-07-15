//
//  MenuViewModelTests.swift
//  bookTests
//
//  Created by Daria on 11.07.2024.
//

import XCTest
@testable import book

final class MenuViewModelTests: XCTestCase {
    
    func test_cellViewModelsCount() {
        let sut = MenuViewModel()
        
        XCTAssertEqual(sut.cellViewModels.count, 3, "Number of cellViewModels should equal to 3")
    }
    
    func test_cellViewModelProperties() {
        let viewModel = MenuViewModel()
        
        for i in 0..<viewModel.cellViewModels.count {
            let cellViewModel = viewModel.cellViewModels[i]
            XCTAssertEqual(cellViewModel.index, i, "Index should match the position in the array")
        }
    }
    
    func test_titlesShouldBeEqual() {
        let viewModel = MenuViewModel()
        
        let firstCellViewModel = viewModel.cellViewModels[0]
        XCTAssertEqual(firstCellViewModel.title, "Book search".localized)
        
        let secondCellViewModel = viewModel.cellViewModels[1]
        XCTAssertEqual(secondCellViewModel.title, "Your book collection".localized)
        
        let thirdCellViewModel = viewModel.cellViewModels[2]
        XCTAssertEqual(thirdCellViewModel.title, "HP world".localized)
    }
    
}
