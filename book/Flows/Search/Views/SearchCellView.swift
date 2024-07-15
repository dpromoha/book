//
//  SearchCellView.swift
//  book
//
//  Created by Daria on 24.06.2024.
//

import SwiftUI

struct SearchCellView: View {
    
    let author: Book
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(author.bookTitle)
                .fontWeight(.bold)
                .lineLimit(1)
            Text(author.name)
                .lineLimit(1)
        }
    }
    
}
