//
//  SignUpView.swift
//  book
//
//  Created by Daria on 20.06.2024.
//

import SwiftUI

struct SignUpView: View {
    
    @Environment(\.dismiss) var dismiss
    
    @ObservedObject var viewModel = SignUpViewModel()
    
    var body: some View {
        ZStack {
            VStack {
                Spacer()
                HStack {
                    BackButton(action: {
                        dismiss()
                    })
                    .accessibilityIdentifier("signUpBackButton")
                    
                    Spacer()
                }
                Spacer()
            }
            
            VStack(alignment: .center, spacing: 20.0) {
                TextField("Enter email".localized, text: $viewModel.emailTextFieldText)
                    .accessibilityIdentifier("signUpEmailTextField")
                    .keyboardType(.emailAddress)
                    .padding(.horizontal, 24.0)
                    .font(.title2)
                
                PasswordTextField(
                    placeholder: "Enter password".localized,
                    text: $viewModel.passwordTextFieldText
                )
                .accessibilityIdentifier("signUpPasswordTextField")
                .textContentType(.newPassword)
                .padding(.top, 8.0)
                
                PasswordTextField(
                    placeholder:"Confirm a new password".localized,
                    text: $viewModel.confirmedPasswordTextFieldText
                )
                .padding(.top, 8.0)
                .padding(.bottom, 24.0)
                .textContentType(.newPassword)
                .accessibilityIdentifier("signUpConfirmPasswordTextField")
                
                Button("Sign Up".localized) {
                    viewModel.showMenu()
                }
                .accessibilityIdentifier("signUpButton")
                .modifier(MainButtonModifier())
                .disabled(!viewModel.isTextFieldsValidated)
                .opacity(viewModel.isTextFieldsValidated ? 1.0 : 0.5)
                .fullScreenCover(isPresented: $viewModel.isShowMenu) {
                    MenuView()
                        .environmentObject(viewModel.coordinator)
                }
            }
        }
    }
    
}
