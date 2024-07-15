//
//  BookDetailsResponseHandler.swift
//  book
//
//  Created by Daria on 08.07.2024.
//

import Foundation
import Combine

struct BookDetailsCodable: Codable {
    
    let title: String?
    let authorName: [String]?
    let imageURL: [String]?
    let publisher: [String]?
    let firstPublishYear: Int
    let description: [String]?

    enum CodingKeys: String, CodingKey {
        
        case title
        case authorName = "author_name"
        case imageURL = "author_key"
        case publisher
        case firstPublishYear = "first_publish_year"
        case description = "first_sentence"
        
    }
    
}

struct BookDetailsResponse: Codable {
    
    let docs: [BookDetailsCodable]
    
}

final class BookDetailsResponseHandler: ResponseHandler {
    
    typealias Value = BookDetails

    func handleResponse(_ data: Data) -> AnyPublisher<BookDetails, Error> {
        do {
            let searchResponse = try JSONDecoder().decode(BookDetailsResponse.self, from: data)
            if let description = searchResponse.docs.first {
                // bad response handling, but it is a free API and there is no guarantee to have results from it
                // get the first element in the array just to simulate book details query
                let bookDetails = BookDetails(
                    author: description.authorName?.first ?? "Test author",
                    bookTitle: description.title ?? "Test title",
                    imageURL: description.imageURL?.first ?? "OL7115219A",
                    publisher: description.publisher?.first ?? "Publisher",
                    firstPublishYear: String(description.firstPublishYear),
                    description: description.description?.first ?? "Description"
                )
                
                return Just(bookDetails)
                    .setFailureType(to: Error.self)
                    .eraseToAnyPublisher()
            } else {
                
                return Fail(error: NetworkError.serializationFault(description: "No book details found"))
                    .eraseToAnyPublisher()
            }
        } catch {
            
            return Fail(error: NetworkError.serializationFault(description: error.localizedDescription))
                .eraseToAnyPublisher()
        }
    }
    
}
