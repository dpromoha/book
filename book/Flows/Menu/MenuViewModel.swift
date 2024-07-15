//
//  MenuViewModel.swift
//  book
//
//  Created by Daria on 22.06.2024.
//

import SwiftUI

final class MenuViewModel: ObservableObject {
    
    @ObservedObject var coordinator = NavigationCoordinator()
    
    private(set) var cellViewModels = [
        MenuCellViewModel(
            image: Image(uiImage: .search),
            title: "Book search".localized, 
            index: 0
        ),
        MenuCellViewModel(
            image: Image(uiImage: .bookmark),
            title: "Your book collection".localized,
            index: 1
        ),
        MenuCellViewModel(
            image: Image(uiImage: .hp),
            title: "HP world".localized,
            index: 2
        )
    ]
    
    init() {}
    
}
