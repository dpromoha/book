//
//  HarryPotterHouseCell.swift
//  book
//
//  Created by Daria on 04.07.2024.
//

import SwiftUI

enum House: String, Codable {
    
    case gryffindor = "Gryffindor"
    case hufflepuff = "Hufflepuff"
    case ravenclaw = "Ravenclaw"
    case slytherin = "Slytherin"
    
    var description: String {
        return self.rawValue
    }
    
    var backgroundColor: Color {
        switch self {
        case .gryffindor:
            return .gryffindorRed
            
        case .hufflepuff:
            return .hufflepuffBlack
            
        case .ravenclaw:
            return .ravenclawBlue
            
        case .slytherin:
            return .slytherinGreen
        }
    }
    
    var foregroundColor: Color {
        switch self {
        case .gryffindor:
            return .gryffindorGold
            
        case .hufflepuff:
            return .hufflepuffYellow
        
        case .ravenclaw:
            return .ravenclawYellow
        
        case .slytherin:
            return .slytherinSilver
        }
    }
    
}

struct HarryPotterHouseCell: View {
    
    var viewModel: HarryPotterHouseCellViewModel
    
    var body: some View {
        ZStack {
            viewModel.house.backgroundColor
                .ignoresSafeArea(.all)
            
            VStack {
                Text(viewModel.title)
                    .font(.title)
                    .bold()
                    .frame(alignment: .center)
                    .padding(.top, 10.0)
                    .foregroundStyle(viewModel.house.foregroundColor)
                    .accessibilityIdentifier("houseCellTitle: \(viewModel.house.description)")
                
                Group {
                    Text("Founder: ".localized)
                        .bold() +
                    Text(viewModel.founder)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal, 8.0)
                .padding(.top, 16.0)
                .font(.subheadline)
                .lineLimit(1)
                .foregroundStyle(viewModel.house.foregroundColor)
                
                Group {
                    Text("Animal: ".localized)
                        .bold() +
                    Text(viewModel.animal)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal, 8.0)
                .font(.subheadline)
                .foregroundStyle(viewModel.house.foregroundColor)
                
                Button(action: {
                    viewModel.action()
                }, label: {
                    Text("I am from \(viewModel.house.description)")
                        .foregroundStyle(viewModel.house.foregroundColor)
                        .font(.subheadline)
                        .lineLimit(2)
                        .underline()
                })
                .padding(.top, 16.0)
                .padding(.bottom, 16.0)
                .disabled(viewModel.isActionDisabled)

            }
        }
        .cornerRadius(10.0)
    }
    
}
