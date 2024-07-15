//
//  BookDetailsCustomNavigationBar.swift
//  book
//
//  Created by Daria on 27.06.2024.
//

import SwiftUI

struct BookDetailsCustomNavigationBar: View {
    
    var title: String
    
    @Environment(\.dismiss) var dismiss
    @State private var isShowAlert = false
    
    @ObservedObject var viewModel: BookDetailsViewModel
    
    let action: () -> Void
    
    var body: some View {
        HStack {
            NavigationBackButton {
                dismiss()
            }

            Spacer()
            Text("Details".localized)
                .fontWeight(.bold)
            Spacer()
            Button(action: {
                isShowAlert = true
            }) {
                Image(systemName: "plus")
                    .resizable()
                    .foregroundStyle(.black)
                    .frame(width: 20.0, height: 20.0)
            }
            .alert(isPresented: $isShowAlert) {
                Alert(
                    title: Text("Save book to your collection?".localized),
                    message: Text("All stored books will be kept in the Book collection".localized),
                    primaryButton: .default(Text("OK"), action: {
                        viewModel.saveBook()
                        action()
                    }),
                    secondaryButton: .cancel()
                )
            }
        }
        .padding()
    }
    
}
