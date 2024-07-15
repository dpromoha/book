//
//  HarryPotterBooksResponseHandler.swift
//  book
//
//  Created by Daria on 08.07.2024.
//

import Foundation
import Combine

struct HarryPotterBooksResponse: Codable {
    
    let title: String
    let cover: String
    
}

struct HarryPotterBook: Identifiable {
    
    let id = UUID()
    let title: String
    let cover: String
    
}

final class HarryPotterBooksResponseHandler: ResponseHandler {
    
    typealias Value = [HarryPotterBook]
    
    func handleResponse(_ data: Data) -> AnyPublisher<[HarryPotterBook], any Error> {
        do {
            let booksResponse = try JSONDecoder().decode([HarryPotterBooksResponse].self, from: data)
            let books = booksResponse.compactMap { book in
                HarryPotterBook(title: book.title, cover: book.cover)
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
