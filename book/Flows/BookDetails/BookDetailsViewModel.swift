//
//  BookDetailsViewModel.swift
//  book
//
//  Created by Daria on 26.06.2024.
//

import Combine
import SwiftUI

final class BookDetailsViewModel: ObservableObject {
    
    @Published var isLoading = false
    @Published var details = BookDetails.empty()
    @Published var title: String
    @Published var isShowError = false
    
    private var subscriptions = Set<AnyCancellable>()
    private var dataManager = CoreDataManager.shared

    private let service = BookService()
    
    init(title: String) {
        self.title = title
        
        fetchDetails()
    }
    
    func saveBook() {
        dataManager.addBook(title: details.bookTitle, author: details.author)
    }
    
    private func fetchDetails() {
        isLoading = true
        
        service.fetchBookDetails(title: title)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { [weak self] completion in
                guard let self = self else { return }

                switch completion {
                case .finished:
                    break
                    
                case .failure:
                    self.isLoading = false
                    self.isShowError = true
                }
            }, receiveValue: { [weak self] bookDetails in
                guard let self = self else { return }

                self.details = bookDetails
                self.isLoading = false
                self.isShowError = false
            })
            .store(in: &subscriptions)
    }
    
}
