//
//  CheckmarkView.swift
//  book
//
//  Created by Daria on 27.06.2024.
//

import SwiftUI

struct CheckmarkView: View {
    
    var body: some View {
        VStack {
            Image(.checkmark)
                .resizable()
                .frame(width: 100.0, height: 100.0)
                .foregroundColor(.green)
        }
        .frame(width: 150.0, height: 150.0)
        .shadow(color: .black, radius: 3.0)
        .background(Color.white)
        .cornerRadius(10.0)
    }
    
}
