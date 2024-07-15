//
//  BooksResponseHandler.swift
//  book
//
//  Created by Daria on 08.07.2024.
//

import Foundation
import Combine

struct BookSearch: Codable {
    
    let title: String?
    let authorName: [String]?

    enum CodingKeys: String, CodingKey {
        
        case title
        case authorName = "author_name"
        
    }
    
}

struct SearchBookResponse: Codable {
    
    let docs: [BookSearch]
    
}

final class BooksResponseHandler: ResponseHandler {
    
    typealias Value = [Book]
    
    func handleResponse(_ data: Data) -> AnyPublisher<[Book], Error> {
        do {
            let searchBookResponse = try JSONDecoder().decode(SearchBookResponse.self, from: data)
            let books = searchBookResponse.docs.compactMap {
                // bad response handling, but it is a free API and there is no guarantee to have results from it
                Book(
                    name: $0.authorName?.first ?? "Test author",
                    bookTitle: $0.title ?? "Test title"
                )
            }
            
            return Just(books)
                .setFailureType(to: Error.self)
                .eraseToAnyPublisher()
        } catch {
            
            return Fail(error: NetworkError.serializationFault(description: error.localizedDescription))
                .eraseToAnyPublisher()
        }
    }
    
}
