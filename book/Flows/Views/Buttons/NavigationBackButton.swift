//
//  NavigationBackButton.swift
//  book
//
//  Created by Daria on 24.06.2024.
//

import SwiftUI

struct NavigationBackButton: View {
    
    var action: () -> Void
    
    var body: some View {
        HStack {
            Button(action: action) {
                Image(uiImage: .arrowBack)
            }
        }
    }
    
}
