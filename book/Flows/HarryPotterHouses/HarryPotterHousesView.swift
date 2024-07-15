//
//  HarryPotterHousesView.swift
//  book
//
//  Created by Daria on 04.07.2024.
//

import SwiftUI

struct HarryPotterHousesView: View {
    
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var settings: AppSettings
    
    @ObservedObject var viewModel = HarryPotterHousesViewModel()
    
    @State private var emojiOffset: CGFloat = -500.0
    @State private var isShowAnimation = false
    @State private var resetTimer: Timer? = nil
    @State private var emoji = String()
    
    var body: some View {
        NavigationStack {
            ZStack {
                settings.backgroundColor
                    .edgesIgnoringSafeArea(.all)
                
                if viewModel.isLoading {
                    ProgressView()
                        .progressViewStyle(.circular)
                        .frame(width: 200.0, height: 200.0, alignment: .center)
                        .accessibilityIdentifier("harryPotterHousesProgressView")
                }
                
                VStack {
                    Spacer()
                    HStack {
                        BackButton(action: {
                            dismiss()
                        })
                        .accessibilityIdentifier("harryPotterHousesBackButton")
                        
                        Spacer()
                    }
                    Spacer()
                }
                
                VStack {
                    LazyVGrid(columns: [GridItem(.adaptive(minimum: 150.0))], spacing: 20.0) {
                        ForEach(viewModel.houses.indices, id: \.self) { item in
                            HarryPotterHouseCell(
                                viewModel: HarryPotterHouseCellViewModel(
                                    title: viewModel.houses[item].house.description,
                                    founder: viewModel.houses[item].founder,
                                    animal: viewModel.houses[item].animal,
                                    house: viewModel.houses[item].house,
                                    isActionDisabled: isShowAnimation,
                                    action: {
                                        emoji = viewModel.houses[item].emoji
                                        withAnimation {
                                            isShowAnimation = true
                                            withAnimation() {
                                                emojiOffset = 500.0
                                            }
                                            startResetTimer()
                                        }
                                        changeBackgroundColor(house: viewModel.houses[item].house)
                                    }
                                )
                            )
                            .frame(maxWidth: 200.0, maxHeight: 200.0)
                        }
                    }
                    .accessibilityIdentifier("harryPotterHousesGrid")
                    .padding(.horizontal, 10.0)
                }
                
                VStack {
                    GeometryReader { geometry in
                        VStack {
                            Spacer()
                            
                            if isShowAnimation {
                                VStack(spacing: 20.0) {
                                    generateAnimationView(emoji)
                                }
                                .frame(width: geometry.size.width, height: geometry.size.height)
                            }
                        }
                    }
                    .frame(maxHeight: .infinity)
                }
                .edgesIgnoringSafeArea(.bottom)
                
                if viewModel.isShowError {
                    ErrorView()
                        .transition(.opacity)
                        .zIndex(2.0)
                        .animation(.easeInOut, value: 1.0)
                        .accessibilityIdentifier("harryPotterHousesErrorView")
                }
            }
        }
        
    }
    
    private func startResetTimer() {
        resetTimer?.invalidate()
        resetTimer = Timer.scheduledTimer(withTimeInterval: 3.0, repeats: false) { _ in
            resetAnimation()
        }
    }
    
    private func resetAnimation() {
        withAnimation {
            emojiOffset = -500.0
            isShowAnimation = false
        }
    }
    
    @ViewBuilder
    private func generateAnimationView(_ emoji: String) -> some View {
        VStack {
            ForEach(0..<36, id: \.self) { row in
                generateEmojiRow(emoji, row: row)
            }
        }
    }
    
    
    @ViewBuilder
    private func generateEmojiRow(_ emoji: String, row: Int) -> some View {
        HStack(spacing: 20.0) {
            ForEach(0..<7, id: \.self) { _ in
                Text(emoji)
                    .font(.largeTitle)
            }
        }
        .offset(y: emojiOffset + CGFloat(row * 10))
        .animation(.linear(duration: 4.0), value: emojiOffset)
    }
    
    private func changeBackgroundColor(house: House) {
        settings.backgroundColor = house.foregroundColor
    }
    
}
