//
//  MainButtonModifier.swift
//  book
//
//  Created by Daria on 29.06.2024.
//

import SwiftUI

struct MainButtonModifier: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .padding(10.0)
            .frame(maxWidth: UIScreen.main.bounds.width / 4.0)
            .foregroundColor(Color.white)
            .background(Color.blue)
            .font(.title3)
            .clipShape(RoundedRectangle(cornerRadius: 10.0, style: .continuous))
    }
    
}
