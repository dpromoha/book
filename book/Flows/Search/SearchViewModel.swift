//
//  SearchViewModel.swift
//  book
//
//  Created by Daria on 22.06.2024.
//

import Combine
import SwiftUI

final class SearchViewModel: ObservableObject {
    
    @ObservedObject var coordinator = NavigationCoordinator()
    
    @Published var searchQuery: String = ""
    @Published var isLoading = false
    @Published var books: [Book] = []
    @Published var isShowError = false
    
    @Published var isBookSelected = false
    
    var sheetContent: Destination?
    
    private var subscriptions = Set<AnyCancellable>()
    
    private let service = BookService()
    
    init() {
        setupBindings()
    }
    
    func showDetails() {
        coordinator.presentSheetDetails()
    }
    
    private func setupBindings() {
        $searchQuery
            .sink { [weak self] query in
                guard let self = self else { return }
                
                if query.count >= 2 {
                    self.performSearch()
                } else if query.count == 0 {
                    self.books = []
                }
            }.store(in: &subscriptions)
        
        coordinator.$isShowingDetailsSheet
            .sink { [weak self] isBookSelected in
                self?.isBookSelected = isBookSelected
            }.store(in: &subscriptions)
        
        coordinator.$sheetContent
            .compactMap { $0 }
            .sink { [weak self] sheet in
                self?.sheetContent = sheet
            }.store(in: &subscriptions)
    }
    
    private func performSearch() {
        isLoading = true

        service.fetchBooksByTitle(searchQuery)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { [weak self] completion in
                guard let self = self else { return }
                
                switch completion {
                case .finished:
                    break
                    
                case .failure:
                    self.isLoading = false
                    self.books = []
                    self.isShowError = true
                }
            }, receiveValue: { [weak self] books in
                guard let self = self else { return }

                self.books = books
                self.isLoading = false
                self.isShowError = false
            })
            .store(in: &subscriptions)
    }
    
}
