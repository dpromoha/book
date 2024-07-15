//
//  HarryPotterHousesViewModel.swift
//  book
//
//  Created by Daria on 04.07.2024.
//

import Combine
import SwiftUI

final class HarryPotterHousesViewModel: ObservableObject {
    
    @Published var isLoading = false
    @Published var isShowError = false
    @Published var houses: [HarryPotterHouse] = []
    
    private var subscriptions = Set<AnyCancellable>()
    private let service = HarryPotterService()
    
    init() {
        fetchHarryPotterHouses()
    }
    
    private func fetchHarryPotterHouses() {
        isLoading = true
        
        service.fetchHarryPotterHouses()
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { [weak self] completion in
                guard let self = self else { return }
                
                switch completion {
                case .finished:
                    break
                    
                case .failure:
                    self.isLoading = false
                    self.houses = []
                    self.isShowError = true
                }
            }, receiveValue: { [weak self] houses in
                guard let self = self else { return }

                self.houses = houses
                self.isLoading = false
                self.isShowError = false
            })
            .store(in: &subscriptions)
    }
    
}
