//
//  MenuCellViewModel.swift
//  book
//
//  Created by Daria on 21.06.2024.
//

import SwiftUI

struct MenuCellViewModel {
    
    let image: Image
    let title: String
    let index: Int // need for testing
    
    init(
        image: Image,
        title: String,
        index: Int
    ) {
        self.image = image
        self.title = title
        self.index = index
    }
    
}
