//
//  SearchView.swift
//  book
//
//  Created by Daria on 21.06.2024.
//

import SwiftUI

struct SearchView: View {
    
    @Environment(\.dismiss) var dismiss
    @ObservedObject var viewModel = SearchViewModel()
    
    var body: some View {
        NavigationStack(path: $viewModel.coordinator.path) {
            ZStack {
                if viewModel.isLoading {
                    ProgressView()
                        .progressViewStyle(.circular)
                        .frame(width: 200.0, height: 200.0, alignment: .center)
                        .accessibilityIdentifier("searchProgressView")
                }
                
                VStack {
                    GeometryReader(content: { geometry in
                        SearchTextField(text: $viewModel.searchQuery)
                            .padding()
                            .frame(height: 76.0)
                            .position(x: geometry.size.width / 2.0, y: geometry.safeAreaInsets.top - 56.0)
                            .accessibilityIdentifier("searchTextField")
                        
                    })
                    .frame(height: 76.0)
                    
                    ZStack {
                        List(viewModel.books) { title in
                            Button(action: {
                                viewModel.showDetails()
                            }) {
                                SearchCellView(author: title)
                            }
                        }
                        .accessibilityIdentifier("searchList")
                        .sheet(
                            isPresented: $viewModel.isBookSelected
                        ) {
                                if viewModel.sheetContent != nil {
                                    BookDetailsView(title: viewModel.searchQuery)
                                        .environmentObject(viewModel.coordinator)
                                }
                            }
                            .opacity(viewModel.books.isEmpty && !viewModel.isLoading ? 0.0 : 1.0)
                            .listStyle(.plain)
                            .zIndex(-1.0)
                        
                        Text("Please, search books".localized)
                            .font(.title2)
                            .frame(alignment: .center)
                            .opacity(viewModel.books.isEmpty && !viewModel.isLoading ? 1.0 : 0.0)
                            .zIndex(-3.0)
                            .accessibilityIdentifier("searchBooksLabel")
                    }
                }
                if viewModel.isShowError {
                    ErrorView()
                        .transition(.opacity)
                        .zIndex(2.0)
                        .animation(.easeInOut, value: 1.0)
                        .accessibilityIdentifier("searchErrorView")
                }
            }
        }
        .navigationTitle("Search".localized)
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(
            leading:
                NavigationBackButton(action: {
                    dismiss()
                })
                .accessibilityIdentifier("searchBackButton")
        )
    }
    
}
