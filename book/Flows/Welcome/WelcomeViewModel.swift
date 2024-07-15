//
//  WelcomeViewModel.swift
//  book
//
//  Created by Daria on 29.06.2024.
//

import Combine
import SwiftUI

final class WelcomeViewModel: ObservableObject {
    
    @ObservedObject var coordinator = NavigationCoordinator()
    
    @Published var emailTextFieldText = ""
    @Published var passwordTextFieldText = ""
    
    @Published var isShowMenu = false
    @Published var isShowSignUp = false
    
    var sheetContent: Destination?
    
    var isTextFieldsDisabled: Bool {
        !Validator.isEmailValid(emailTextFieldText) || !Validator.isPasswordValid(passwordTextFieldText)
    }
    
    var isPasswordRulesApplied: Bool {
        Validator.isPasswordValid(passwordTextFieldText)
    }
    
    var isPasswordFieldEmpty: Bool {
        passwordTextFieldText.isEmpty
    }
    
    private var subscriptions = Set<AnyCancellable>()
    
    init() {
        setupBindings()
    }
    
    func showMenu() {
        coordinator.showFullScreenCover()
    }
    
    func showSignUpFlow() {
        coordinator.presentSheet()
    }
    
    private func setupBindings() {
        coordinator.$isShowingFullScreenCover
            .sink { [weak self] isShowMenu in
                self?.isShowMenu = isShowMenu
            }.store(in: &subscriptions)
        
        coordinator.$isShowingSheet
            .sink { [weak self] isShowSignUp in
                self?.isShowSignUp = isShowSignUp
            }.store(in: &subscriptions)
        
        coordinator.$sheetContent
            .compactMap { $0 }
            .sink { [weak self] sheet in
                self?.sheetContent = sheet
            }.store(in: &subscriptions)
    }
    
}
