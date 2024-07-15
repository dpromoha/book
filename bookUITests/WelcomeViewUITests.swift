//
//  WelcomeViewUITests.swift
//  bookTests
//
//  Created by Daria on 09.07.2024.
//

import XCTest
@testable import book

final class WelcomeViewUITests: XCTestCase {
    
    func test_loginButtonShouldBeEnabled() {
        let app = XCUIApplication()
        app.launch()
        
        let emailTextField = app.textFields["signInEmailTextField"]
        let passwordTextField = app.secureTextFields["signInPasswordTextField"]
        let loginButton = app.buttons["loginButton"]
        
        emailTextField.tap()
        emailTextField.typeText("test@example.com")
        
        passwordTextField.tap()
        passwordTextField.typeText("1234567890M")
        
        XCTAssertTrue(loginButton.isEnabled, "Login button should be enabled")
    }
    
    func test_loginButtonShouldBeDisabled() {
        let app = XCUIApplication()
        app.launch()
        
        let emailTextField = app.textFields["signInEmailTextField"]
        let passwordTextField = app.secureTextFields["signInPasswordTextField"]
        let loginButton = app.buttons["loginButton"]
        
        emailTextField.tap()
        emailTextField.typeText("testexample.com")
        
        passwordTextField.tap()
        passwordTextField.typeText("1234567890M")
        
        XCTAssertFalse(loginButton.isEnabled, "Login button shouldn't be enabled")
    }

    func test_menuViewShouldBeShown() {
        let app = XCUIApplication()
        app.launch()
                
        let bossButton = app.buttons["bossButton"]
        
        bossButton.tap()
        
        let menuView = app.otherElements["menuGrid"]
        
        XCTAssertTrue(menuView.exists, "Menu view should exists")
    }
    
    func test_signUpViewShouldBeShown() {
        let app = XCUIApplication()
        app.launch()
        
        let signUpButton = app.buttons["toSignUpButton"]
        XCTAssertTrue(signUpButton.exists, "Sign Up button should exist")
        
        signUpButton.tap()
        
        let signUpEmailTextField = app.textFields["signUpEmailTextField"]
        
        XCTAssertTrue(signUpEmailTextField.exists, "Sign Up email text field should exists")
        
        signUpEmailTextField.tap()
    }
    
}
