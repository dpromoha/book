//
//  PersonalBookListView.swift
//  book
//
//  Created by Daria on 27.06.2024.
//

import SwiftUI

struct PersonalBookListView: View {
    
    @Environment(\.dismiss) var dismiss
    @ObservedObject var viewModel = PersonalBookListViewModel()
    
    var body: some View {
        NavigationStack(path: $viewModel.coordinator.path) {
            if viewModel.isShowList {
                List {
                    ForEach(viewModel.books) { book in
                        SavedBookCellView(
                            book: book,
                            action: {
                                viewModel.addBookToFavorites(book: book)
                            }
                        )
                    }.onDelete { indexSet in
                        for index in indexSet {
                            let book = viewModel.books[index]
                            viewModel.deleteBook(title: book.title ?? "")
                        }
                    }
                }
                .accessibilityIdentifier("bookList")
                
            } else {
                VStack {
                    Text("You can add book from Search".localized)
                        .font(.title2)
                        .accessibilityIdentifier("bookListEmptyStateText")
                }
                .frame(alignment: .center)
            }
        }.navigationTitle("Your saved books".localized)
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(
                leading:
                    NavigationBackButton(action: {
                        dismiss()
                    })
                    .accessibilityIdentifier("bookListBackButton")
            )
    }
    
}
