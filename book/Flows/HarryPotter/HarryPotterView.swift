//
//  HarryPotterView.swift
//  book
//
//  Created by Daria on 02.07.2024.
//

import SwiftUI

struct HarryPotterView: View {
    
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var settings: AppSettings
    
    @ObservedObject var viewModel = HarryPotterViewModel()
    
    var body: some View {
        NavigationStack(path: $viewModel.coordinator.path) {
            ZStack {
                settings.backgroundColor
                    .edgesIgnoringSafeArea(.all)
                
                if viewModel.isLoading {
                    ProgressView()
                        .progressViewStyle(.circular)
                        .frame(width: 200.0, height: 200.0, alignment: .center)
                        .accessibilityIdentifier("harryPotterProgressView")
                }
                
                VStack {
                    Image(uiImage: .harryPotterBackground)
                        .resizable()
                        .frame(height: 200.0)
                        .cornerRadius(10.0)
                        .padding(.top, 20.0)
                        .accessibilityIdentifier("harryPotterBackground")
                    
                    Text("Books:".localized)
                        .font(.title)
                        .padding(.top, 10.0)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .accessibilityIdentifier("harryPotterBooksTitle")
                    
                    ScrollView(.horizontal) {
                        LazyHGrid(rows: [GridItem(.adaptive(minimum: 200.0))], content: {
                            ForEach(Array(viewModel.books.indices), id: \.self) { item in
                                HarryPotterBookCell(viewModel: .init(
                                    imageURL: URL(string: viewModel.books[item].cover),
                                    title: viewModel.books[item].title)
                                )
                            }
                        })
                        .frame(height: 310.0)
                    }
                    .accessibilityIdentifier("harryPotterScrollView")
                    
                    Button(action: {
                        viewModel.showHouseChoosing()
                    }) {
                        Text("Choose your house".localized)
                            .underline()
                    }
                    .accessibilityIdentifier("chooseHouseButton")
                    .padding(.top, 24.0)
                        .sheet(
                            isPresented: $viewModel.isShowHousesDetails
                        ) {
                            if viewModel.sheetContent != nil {
                                HarryPotterHousesView()
                                    .environmentObject(viewModel.coordinator)
                            }
                        }
                        .font(.title)
                        .frame(alignment: .center)
                        .padding(.top, 50.0)
                        .padding(.bottom, 30.0)
                    
                    Spacer()
                }
                .padding()
                
                if viewModel.isShowError {
                    ErrorView()
                        .transition(.opacity)
                        .zIndex(2.0)
                        .animation(.easeInOut, value: 1.0)
                        .accessibilityIdentifier("harryPotterErrorView")
                }
            }
        }
        .navigationTitle("HP world".localized)
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(
            leading:
                NavigationBackButton(action: {
                    dismiss()
                })
                .accessibilityIdentifier("harryPotterBackButton")
        )
    }
    
}
