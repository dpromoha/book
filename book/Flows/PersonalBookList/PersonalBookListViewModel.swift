//
//  PersonalBookListViewModel.swift
//  book
//
//  Created by Daria on 27.06.2024.
//

import SwiftUI

final class PersonalBookListViewModel: ObservableObject {
    
    @ObservedObject var coordinator = NavigationCoordinator()

    @Published var books: [BookModel] = []
    
    private var dataManager = CoreDataManager.shared
    
    var isShowList: Bool {
        !books.isEmpty
    }
    
    init() {
        fetchBookList()
    }
    
    func addBookToFavorites(book: BookModel) {
        dataManager.changeBookFavoriteState(for: book)
    }
    
    func deleteBook(title: String) {
        dataManager.deleteBook(title)
    }
    
    private func fetchBookList() {
        books = dataManager.fetchBooks()
    }
    
}
