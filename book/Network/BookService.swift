//
//  BookService.swift
//  book
//
//  Created by Daria on 08.07.2024.
//

import Foundation
import Combine

final class BookService {

    private var subscriptions = Set<AnyCancellable>()
    private let networkService = NetworkService()
    
    deinit {
        subscriptions.removeAll()
    }
    
    func fetchBooksByTitle(_ title: String) -> AnyPublisher<[Book], NetworkError> {
        guard let url = URL(string: SharedLinks.Books.booksTitles(title).url) else {
            
            return Fail(error: NetworkError.serializationFault(description: "Invalid URL"))
                .eraseToAnyPublisher()
        }
        
        let responseHandler = BooksResponseHandler()
        
        return networkService.executeRequest(withURL: url, responseHandler: responseHandler)
    }
    
    func fetchBookDetails(title: String) -> AnyPublisher<BookDetails, NetworkError> {
        guard let url = URL(string: SharedLinks.Books.bookDetails(title).url) else {
            
            return Fail(error: NetworkError.serializationFault(description: "Invalid URL"))
                .eraseToAnyPublisher()
        }

        let responseHandler = BookDetailsResponseHandler()
        
        return networkService.executeRequest(withURL: url, responseHandler: responseHandler)
    }
    
}
