//
//  SharedLinks.swift
//  book
//
//  Created by Daria on 27.06.2024.
//

import Foundation

public struct SharedLinks {
    
    public enum Books {
        
        case booksTitles(String)
        case bookDetails(String)
        case bookCover(String)
        case harryPotterHouses
        case harryPotterBooks
        
        public var url: String {
            switch self {
            case .booksTitles(let title):
                return "https://openlibrary.org/search.json?title=\(title)"
                
            case .bookDetails(let title):
                return "https://openlibrary.org/search.json?title=\(title)&limit=1"
                
            case .bookCover(let cover):
                return "https://covers.openlibrary.org/a/olid/\(cover)-M.jpg"
                
            case .harryPotterHouses:
                return "https://potterapi-fedeperin.vercel.app/en/houses"
                
            case .harryPotterBooks:
                return "https://potterapi-fedeperin.vercel.app/en/books"
            }
        }
        
    }
    
}
