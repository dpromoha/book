//
//  MenuView.swift
//  book
//
//  Created by Daria on 20.06.2024.
//

import SwiftUI

struct MenuView: View {
    
    @ObservedObject private var viewModel = MenuViewModel()
        
    var body: some View {
        NavigationStack(path: $viewModel.coordinator.path) {
            VStack {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 150.0))], spacing: 20.0) {
                    ForEach(viewModel.cellViewModels.indices, id: \.self) { item in
                        NavigationLink(destination: menuView(for: item)) {
                            MenuCell(viewModel: viewModel.cellViewModels[item])
                        }
                        .buttonStyle(.plain)
                    }
                }
                .accessibilityIdentifier("menuGrid")
            }
        }
    }
    
    @ViewBuilder
    private func menuView(for index: Int) -> some View {
        switch index {
        case 0:
            SearchView()
            
        case 1:
            PersonalBookListView()
            
        case 2:
            HarryPotterView()
            
        default:
            SearchView()
        }
    }
    
}
