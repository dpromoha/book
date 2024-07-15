//
//  SignUpViewModel.swift
//  book
//
//  Created by Daria on 29.06.2024.
//

import Combine
import SwiftUI

final class SignUpViewModel: ObservableObject {
    
    @ObservedObject var coordinator = NavigationCoordinator()
    
    @Published var emailTextFieldText = ""
    @Published var passwordTextFieldText = ""
    @Published var confirmedPasswordTextFieldText = ""
    
    @Published var isShowMenu = false
    
    var isTextFieldsValidated: Bool {
        Validator.isEmailValid(emailTextFieldText) && Validator.isPasswordValid(passwordTextFieldText) && Validator.isPasswordValid(confirmedPasswordTextFieldText) && passwordTextFieldText == confirmedPasswordTextFieldText
    }
    
    private var subscriptions = Set<AnyCancellable>()
    
    init() {
        setupBindings()
    }
    
    func showMenu() {
        coordinator.showFullScreenCover()
    }
    
    private func setupBindings() {
        coordinator.$isShowingFullScreenCover
            .sink { [weak self] isShowMenu in
                self?.isShowMenu = isShowMenu
            }.store(in: &subscriptions)
    }
    
}
