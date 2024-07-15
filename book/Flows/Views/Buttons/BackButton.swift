//
//  BackButton.swift
//  book
//
//  Created by Daria on 21.06.2024.
//

import SwiftUI

struct BackButton: View {
    
    var action: () -> Void
    
    var body: some View {
        HStack {
            Button(action: action) {
                Image(uiImage: .arrowBack)
            }.modifier(BackButtonModifier())
        }
    }
    
}
