//
//  NavigationCoordinator.swift
//  book
//
//  Created by Daria on 29.06.2024.
//

import Foundation

enum Destination: Hashable {
    
    case detail(UUID)
    
}

final class NavigationCoordinator: ObservableObject {
    
    @Published var isShowingDetailsSheet: Bool = false
    @Published var isShowingFullScreenCover = false
    @Published var isShowingHPHousesSheet = false
    
    
    @Published var path: [Destination] = []
    @Published var isShowingSheet: Bool = false
    
    @Published var sheetContent: Destination?

    func presentSheet() {
        sheetContent = nil
        isShowingSheet = true
        sheetContent = .detail(UUID())
    }
    
    func showFullScreenCover() {
        isShowingFullScreenCover = true
    }
    
    func presentSheetDetails() {
        sheetContent = nil
        isShowingDetailsSheet = true
        sheetContent = .detail(UUID())
    }

    func presentSheetHPHouses() {
        sheetContent = nil
        isShowingHPHousesSheet = true
        sheetContent = .detail(UUID())
    }
    
}
