//
//  WelcomeView.swift
//  book
//
//  Created by Daria on 19.06.2024.
//

import SwiftUI

struct WelcomeView: View {
    
    @ObservedObject var viewModel = WelcomeViewModel()
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .center, spacing: 20.0) {
                Text("Welcome!".localized)
                    .padding(.bottom, 20.0)
                    .font(.largeTitle)
                    .accessibilityIdentifier("welcomeLabel")
                
                TextField(
                    "Enter email".localized,
                    text: $viewModel.emailTextFieldText
                )
                .keyboardType(.emailAddress)
                .padding(.horizontal, 24.0)
                .font(.title2)
                .accessibilityIdentifier("signInEmailTextField")
                
                PasswordTextField(
                    placeholder: "Enter password".localized,
                    text: $viewModel.passwordTextFieldText
                )
                .accessibilityIdentifier("signInPasswordTextField")
                .padding(.bottom, 16.0)
                
                Button("Login".localized) {
                    viewModel.showMenu()
                }
                .modifier(MainButtonModifier())
                .disabled(viewModel.isTextFieldsDisabled)
                .opacity(viewModel.isTextFieldsDisabled ? 0.5 : 1.0)
                .accessibilityIdentifier("loginButton")
                .fullScreenCover(isPresented: $viewModel.isShowMenu) {
                    MenuView()
                        .environmentObject(viewModel.coordinator)
                }
                
                Group {
                    Button(
                        action: {
                            viewModel.showSignUpFlow()
                        }) {
                            Text("Sign Up".localized)
                                .underline()
                        }
                        .accessibilityIdentifier("toSignUpButton")
                        .padding(.top, 24.0)
                        .sheet(isPresented: $viewModel.isShowSignUp) {
                            if viewModel.sheetContent != nil {
                                SignUpView()
                                    .environmentObject(viewModel.coordinator)
                            }
                        }
                    
                    Button(
                        action: {
                            viewModel.showMenu()
                        }) {
                            Text("Boss button".localized)
                                .underline()
                        }
                        .accessibilityIdentifier("bossButton")
                        .fullScreenCover(isPresented: $viewModel.isShowMenu) {
                            MenuView()
                                .environmentObject(viewModel.coordinator)
                        }
                }
                .foregroundStyle(.black)
                .font(.title3)
            }
        }
    }
    
}
