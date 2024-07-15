//
//  HarryPotterBookCell.swift
//  book
//
//  Created by Daria on 02.07.2024.
//

import SwiftUI

struct HarryPotterBookCell: View {
    
    var viewModel: HarryPotterBookCellViewModel
    
    var body: some View {
        VStack {
            AsyncImage(
                url: viewModel.imageURL
            ) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            } placeholder: {
                Image(uiImage: .dogPlaceholder)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
            .frame(width: 100.0, height: 200.0, alignment: .center)
            
            Text(viewModel.title)
                .foregroundStyle(.black)
                .frame(width: 100.0, height: 120.0, alignment: .topLeading)
        }
    }
    
}
