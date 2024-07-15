//
//  SignUpViewModelTests.swift
//  bookTests
//
//  Created by Daria on 09.07.2024.
//

import XCTest
import Combine
@testable import book

final class SignUpViewModelTests: XCTestCase {
    
    private var sut: SignUpViewModel!
    private var subscriptions = Set<AnyCancellable>()

    override func setUpWithError() throws {
        sut = SignUpViewModel()
        subscriptions = Set<AnyCancellable>()
    }
    
    override func tearDown() {
        sut = nil
        subscriptions.removeAll()
    }
    
    func test_textFieldsShouldBeValid() {
        sut.emailTextFieldText = "email@example.com"
        sut.passwordTextFieldText = "1234567890M"
        sut.confirmedPasswordTextFieldText = "1234567890M"
        
        XCTAssertTrue(sut.isTextFieldsValidated, "Text fields should be valid")
    }
    
    func test_textFieldsPasswordsArentEqual() {
        sut.emailTextFieldText = "email@example.com"
        sut.passwordTextFieldText = "1234567890M"
        sut.confirmedPasswordTextFieldText = "111111111M"
        
        XCTAssertFalse(sut.isTextFieldsValidated, "Text fields shouldn't be valid")
    }
    
    func test_textFieldsEmailShouldntBeValid() {
        sut.emailTextFieldText = "email@examplecom"
        sut.passwordTextFieldText = "1234567890M"
        sut.confirmedPasswordTextFieldText = "1234567890M"
        
        XCTAssertFalse(sut.isTextFieldsValidated, "Text fields shouldn't be valid")
    }
    
    func test_menuShouldBeShown() {
        let expectation = XCTestExpectation()
        XCTAssertFalse(sut.isShowMenu, "Menu shouldn't be shown")
        
        sut.showMenu()
        
        sut.coordinator.$isShowingFullScreenCover
            .filter { $0 }
            .sink { _ in                
                XCTAssertTrue(self.sut.isShowMenu, "Menu should be shown")
                expectation.fulfill()
            }.store(in: &subscriptions)
        
        wait(for: [expectation], timeout: 1.0)
    }
    
}
