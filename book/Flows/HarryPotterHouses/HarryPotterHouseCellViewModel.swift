//
//  HarryPotterHouseCellViewModel.swift
//  book
//
//  Created by Daria on 04.07.2024.
//

import Foundation

struct HarryPotterHouseCellViewModel {
    
    let title: String
    let founder: String
    let animal: String
    let house: House
    let isActionDisabled: Bool
    let action: () -> Void
    
    init(
        title: String,
        founder: String,
        animal: String,
        house: House,
        isActionDisabled: Bool,
        action: @escaping () -> Void
    ) {
        self.title = title
        self.founder = founder
        self.animal = animal
        self.house = house
        self.isActionDisabled = isActionDisabled
        self.action = action
    }
    
}
