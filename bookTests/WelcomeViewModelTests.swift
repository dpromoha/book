//
//  WelcomeViewModelTests.swift
//  bookTests
//
//  Created by Daria on 09.07.2024.
//

import XCTest
import Combine
@testable import book

final class WelcomeViewModelTests: XCTestCase {
    
    private var sut: WelcomeViewModel!
    private var subscriptions = Set<AnyCancellable>()

    override func setUpWithError() throws {
        sut = WelcomeViewModel()
        subscriptions = Set<AnyCancellable>()
    }
    
    override func tearDown() {
        sut = nil
        subscriptions.removeAll()
    }
    
    func test_textFieldsDisabledWithInvalidPassword() {
        sut.emailTextFieldText = "test@example.com"
        sut.passwordTextFieldText = "12345678M"
        
        let isDisabled = sut.isTextFieldsDisabled
                
        XCTAssertTrue(isDisabled, "Text field should be disabled")
    }
    
    func test_textFieldsDisabledWithNotValidEmail() {
        sut.emailTextFieldText = "testexample.com"
        sut.passwordTextFieldText = "1234567890M"
        
        let isDisabled = sut.isTextFieldsDisabled
                
        XCTAssertTrue(isDisabled, "Text field should be disabled")
    }
    
    func test_textFieldsShouldBeEnabled() {
        sut.emailTextFieldText = "test@example.com"
        sut.passwordTextFieldText = "1234567890M"
        
        let isDisabled = sut.isTextFieldsDisabled
                
        XCTAssertFalse(isDisabled, "Text field should be enabled")
    }
    
    func test_passwordTextFieldShouldBeEmpty() {
        sut.passwordTextFieldText = ""
                        
        XCTAssertTrue(sut.isPasswordFieldEmpty, "Password text field should be empty")
    }
    
    func test_passwordShouldBeValid() {
        sut.passwordTextFieldText = "1234T5678999999"
                        
        XCTAssertTrue(sut.isPasswordRulesApplied, "Password text field should be valid")
    }
    
    func test_passwordShouldBeNotValid() {
        sut.passwordTextFieldText = "123456789098765432"
                        
        XCTAssertFalse(sut.isPasswordRulesApplied, "Password text field shouldn't be valid")
    }
    
    func test_fullScreenCoverShouldBeShown() {
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
    
    func test_sheetShouldBeShown() {
        let expectation = XCTestExpectation()
        XCTAssertFalse(sut.isShowSignUp, "Sign up shouldn't be shown")
        
        sut.showSignUpFlow()
        
        sut.coordinator.$isShowingSheet
            .filter { $0 }
            .sink { _ in
                XCTAssertTrue(self.sut.isShowSignUp, "Menu should be shown")
                expectation.fulfill()
            }.store(in: &subscriptions)
        
        wait(for: [expectation], timeout: 1.0)
    }
    
    func test_sheetShouldntBeNil() {
        let expectation = XCTestExpectation()
        XCTAssertNil(sut.sheetContent)

        sut.showSignUpFlow()
        
        sut.coordinator.$isShowingSheet
            .filter { $0 }
            .sink { _ in
                XCTAssertNotNil(self.sut.sheetContent, "Sheet shouldn't be nil")
                expectation.fulfill()
            }.store(in: &subscriptions)
        
        wait(for: [expectation], timeout: 1.0)
    }
    
}
