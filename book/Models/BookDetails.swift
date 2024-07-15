//
//  BookDetails.swift
//  book
//
//  Created by Daria on 27.06.2024.
//

import Foundation

struct BookDetails: Identifiable {
    
    let id = UUID()
    let author: String
    let bookTitle: String
    let imageURL: String
    let publisher: String
    let firstPublishYear: String
    let description: String
    
    init(
        author: String,
        bookTitle: String,
        imageURL: String,
        publisher: String,
        firstPublishYear: String,
        description: String
    ) {
        self.author = author
        self.bookTitle = bookTitle
        self.imageURL = imageURL
        self.publisher = publisher
        self.firstPublishYear = firstPublishYear
        self.description = description
    }
    
    static func empty() -> Self {
        .init(
            author: "",
            bookTitle: "",
            imageURL: "",
            publisher: "",
            firstPublishYear: "",
            description: ""
        )
    }
    
}
