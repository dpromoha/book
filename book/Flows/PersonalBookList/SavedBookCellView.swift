//
//  SavedBookCellView.swift
//  book
//
//  Created by Daria on 27.06.2024.
//

import SwiftUI

struct SavedBookCellView: View {
    
    @ObservedObject var book: BookModel
    let action: () -> Void
    
    var body: some View {
        ZStack {
            HStack {
                VStack(alignment: .leading) {
                    Text(book.title ?? "")
                        .fontWeight(.bold)
                        .lineLimit(1)
                    Text(book.author ?? "")
                        .lineLimit(1)
                }
                Spacer()
                
                Button(action: {
                    action()
                }) {
                    Image(systemName: book.isFavorite ? "star.fill" : "star")
                        .resizable()
                        .foregroundStyle(.yellow)
                        .frame(width: 20.0, height: 20.0)
                        .foregroundStyle(.yellow)
                }
            }
        }
    }
    
}
