//
//  HarryPotterService.swift
//  book
//
//  Created by Daria on 08.07.2024.
//

import Foundation
import Combine

final class HarryPotterService {

    private var subscriptions = Set<AnyCancellable>()
    private let networkService = NetworkService()
    
    deinit {
        subscriptions.removeAll()
    }
    
    func fetchHarryPotterBooks() -> AnyPublisher<[HarryPotterBook], NetworkError> {
        guard let url = URL(string: SharedLinks.Books.harryPotterBooks.url) else {
            
            return Fail(error: NetworkError.serializationFault(description: "Invalid URL"))
                .eraseToAnyPublisher()
        }
        
        let responseHandler = HarryPotterBooksResponseHandler()
        
        return networkService.executeRequest(withURL: url, responseHandler: responseHandler)
    }
    
    func fetchHarryPotterHouses() -> AnyPublisher<[HarryPotterHouse], NetworkError> {
        guard let url = URL(string: SharedLinks.Books.harryPotterHouses.url) else {
            
            return Fail(error: NetworkError.serializationFault(description: "Invalid URL"))
                .eraseToAnyPublisher()
        }
        
        let responseHandler = HarryPotterHousesResponseHandler()
        
        return networkService.executeRequest(withURL: url, responseHandler: responseHandler)
    }
    
}
