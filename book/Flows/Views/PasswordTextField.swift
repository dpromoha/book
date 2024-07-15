//
//  PasswordTextField.swift
//  book
//
//  Created by Daria on 29.06.2024.
//

import SwiftUI

struct PasswordTextField: View {
    
    var placeholder: String
    
    var isPasswordRulesApplied: Bool {
        Validator.isPasswordValid(text)
    }
    
    var isPasswordFieldEmpty: Bool {
        text.isEmpty
    }
    
    @Binding var text: String
    
    var body: some View {
        SecureField(placeholder, text: $text)
            .padding(.horizontal, 24.0)
            .font(.title2)
            .overlay(
                Text("Password should contains at least 10 symbols")
                    .font(.caption)
                    .foregroundColor(.red)
                    .opacity(isPasswordRulesApplied || isPasswordFieldEmpty ? 0.0 : 1.0)
                    .padding(.horizontal, 24.0)
                    .padding(.top, 36.0),
                alignment: .topLeading
            )
    }
    
}
