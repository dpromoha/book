//
//  ErrorView.swift
//  book
//
//  Created by Daria on 08.07.2024.
//

import SwiftUI

struct ErrorView: View {
    
    @State var isShowAnimation = false
    
    var body: some View {
        VStack {
            Image(.warning)
                .resizable()
                .frame(width: 100.0, height: 100.0)
                .foregroundColor(.green)
            Text("Something went wrong".localized)
                .font(.caption)
        }
        .frame(width: 150.0, height: 150.0)
        .background(Color.white)
        .cornerRadius(10.0)
        .shadow(color: .black, radius: 3.0)
        .opacity(isShowAnimation ? 1.0 : 0.0)
        .onAppear {
            showAndHideView()
        }
    }
    
    private func showAndHideView() {
        isShowAnimation = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            withAnimation {
                isShowAnimation = false
            }
        }
    }
    
}
