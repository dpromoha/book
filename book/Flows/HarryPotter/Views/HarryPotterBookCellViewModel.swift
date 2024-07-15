//
//  HarryPotterBookCellViewModel.swift
//  book
//
//  Created by Daria on 02.07.2024.
//

import SwiftUI

struct HarryPotterBookCellViewModel {
    
    let imageURL: URL?
    let title: String
    
    init(
        imageURL: URL? = nil,
        title: String
    ) {
        self.imageURL = imageURL
        self.title = title
    }
    
}
