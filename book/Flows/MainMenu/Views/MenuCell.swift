//
//  MenuCell.swift
//  book
//
//  Created by Daria on 21.06.2024.
//

import SwiftUI

struct MenuCell: View {
    
    var viewModel: MenuCellViewModel
    
    var body: some View {
        VStack {
            viewModel.image
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 200.0, height: 150.0)
                .cornerRadius(10.0)
                .accessibilityIdentifier("menuCellImage - \(viewModel.index)")
            
            Text(viewModel.title)
                .font(.title)
                .foregroundStyle(.cyan)
                .accessibilityIdentifier("menuCellTitle")
        }
    }
    
}
