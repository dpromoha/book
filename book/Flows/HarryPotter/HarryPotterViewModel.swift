//
//  HarryPotterViewModel.swift
//  book
//
//  Created by Daria on 02.07.2024.
//

import Combine
import SwiftUI

final class HarryPotterViewModel: ObservableObject {
    
    @ObservedObject var coordinator = NavigationCoordinator()
    
    @Published var isLoading = false
    @Published var books = [HarryPotterBook]()
    @Published var isShowHousesDetails = false
    @Published var isShowError = false
    
    var sheetContent: Destination?
    
    private var subscriptions = Set<AnyCancellable>()
    private let service = HarryPotterService()
    
    init() {
        fetchHarryPotterBooks()
        setupBindings()
    }
    
    func showHouseChoosing() {
        coordinator.presentSheetHPHouses()
    }
    
    private func setupBindings() {
        coordinator.$isShowingHPHousesSheet
            .sink { [weak self] isShowHousesDetails in
                self?.isLoading = true
                self?.isShowHousesDetails = isShowHousesDetails
            }.store(in: &subscriptions)
        
        coordinator.$sheetContent
            .compactMap { $0 }
            .sink { [weak self] sheet in
                self?.sheetContent = sheet
            }.store(in: &subscriptions)
    }
    
    private func fetchHarryPotterBooks() {
        service.fetchHarryPotterBooks()
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
            })
            .store(in: &subscriptions)
    }
    
}
