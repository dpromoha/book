//
//  BackButtonModifier.swift
//  book
//
//  Created by Daria on 21.06.2024.
//

import SwiftUI

struct BackButtonModifier: ViewModifier {
    
    func body(content: Content) -> some View {
        GeometryReader { geometry in
            content
                .position(
                    x: geometry.size.width - (UIScreen.main.bounds.width - 30.0),
                    y: geometry.size.height - (UIScreen.main.bounds.height - 140.0) // need to fix by proportion
                )
        }.ignoresSafeArea(.all)
    }
    
}

struct NavigationBackButtonModifier: ViewModifier {
    
    func body(content: Content) -> some View {
        GeometryReader { geometry in
            content
                .position(
                    x: geometry.size.width - (UIScreen.main.bounds.width - 30.0),
                    y: geometry.size.height - (UIScreen.main.bounds.height - 140.0) // need to fix by proportion
                )
        }.ignoresSafeArea(.all)
    }
    
}
