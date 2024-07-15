//
//  SignUpViewUITests.swift
//  bookUITests
//
//  Created by Daria on 10.07.2024.
//

import XCTest
@testable import book

final class SignUpViewUITests: XCTestCase {
    
    var app: XCUIApplication!
    
    override func setUpWithError() throws {
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
        
        // to navigate to sut
        let toSignUpButton = app.buttons["toSignUpButton"]
        toSignUpButton.tap()
    }
    
    override func tearDown() {
        app = nil
    }
    
    func test_backButtonShouldExists() {
        let backButton = app.buttons["signUpBackButton"]
        
        XCTAssertTrue(backButton.exists, "Back button should exists")
    }
    
    func test_signUpButtonShouldBeDisabledDueToNotValidEmail() {
        let emailTextField = app.textFields["signUpEmailTextField"]
        let passwordTextField = app.secureTextFields["signUpPasswordTextField"]
        let confirmPasswordTextField = app.secureTextFields["signUpConfirmPasswordTextField"]
        let signUpButton = app.buttons["signUpButton"]
        
        emailTextField.tap()
        emailTextField.typeText("testexample.com")
        
        passwordTextField.tap()
        passwordTextField.typeText("1234567890M")
        
        confirmPasswordTextField.tap()
        confirmPasswordTextField.typeText("1234567890M")
        
        XCTAssertTrue(signUpButton.exists, "Sign up button should exists")
        XCTAssertFalse(signUpButton.isEnabled, "Sign up button should be disabled")
    }
    
    func test_signUpButtonShouldBeDisabledDueToNotEqualPasswords() {
        let emailTextField = app.textFields["signUpEmailTextField"]
        let passwordTextField = app.secureTextFields["signUpPasswordTextField"]
        let confirmPasswordTextField = app.secureTextFields["signUpConfirmPasswordTextField"]
        let signUpButton = app.buttons["signUpButton"]
        
        emailTextField.tap()
        emailTextField.typeText("test@example.com")
        
        passwordTextField.tap()
        passwordTextField.typeText("1234567890M")
        
        confirmPasswordTextField.tap()
        confirmPasswordTextField.typeText("M1234567890M")
        
        XCTAssertTrue(signUpButton.exists, "Sign up button should exists")
        XCTAssertFalse(signUpButton.isEnabled, "Sign up button should be disabled")
    }
    
    func test_signUpButtonShouldBeDisabledDueToNotValidPassword() {
        let emailTextField = app.textFields["signUpEmailTextField"]
        let passwordTextField = app.secureTextFields["signUpPasswordTextField"]
        let confirmPasswordTextField = app.secureTextFields["signUpConfirmPasswordTextField"]
        let signUpButton = app.buttons["signUpButton"]
        
        emailTextField.tap()
        emailTextField.typeText("test@example.com")
        
        passwordTextField.tap()
        passwordTextField.typeText("4567890M")
        
        confirmPasswordTextField.tap()
        confirmPasswordTextField.typeText("4567890M")
        
        XCTAssertTrue(signUpButton.exists, "Sign up button should exists")
        XCTAssertFalse(signUpButton.isEnabled, "Sign up button should be disabled")
    }
    
    func test_signUpButtonShouldBeEnabled() {
        let emailTextField = app.textFields["signUpEmailTextField"]
        let passwordTextField = app.secureTextFields["signUpPasswordTextField"]
        let confirmPasswordTextField = app.secureTextFields["signUpConfirmPasswordTextField"]
        let signUpButton = app.buttons["signUpButton"]
        
        emailTextField.tap()
        emailTextField.typeText("test@example.com")
        
        passwordTextField.tap()
        passwordTextField.typeText("1234567890M")
        
        confirmPasswordTextField.tap()
        confirmPasswordTextField.typeText("1234567890M")
        
        XCTAssertTrue(signUpButton.exists, "Sign up button should exists")
        XCTAssertTrue(signUpButton.isEnabled, "Sign up button should be enabled")
    }
    
}
