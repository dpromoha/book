//
//  BookDetailsView.swift
//  book
//
//  Created by Daria on 26.06.2024.
//

import SwiftUI

struct BookDetailsView: View {
    
    var title: String
    
    @State private var isShowCheckmarkAnimation = false
    @ObservedObject var viewModel: BookDetailsViewModel
    
    var body: some View {
        NavigationStack {
            ZStack {
                VStack(spacing: 0) {
                    BookDetailsCustomNavigationBar(
                        title: title,
                        viewModel: viewModel,
                        action: {
                            showCheckmarkView()
                        }
                    )
                    Spacer()
                    
                    if viewModel.isLoading {
                        ProgressView()
                            .progressViewStyle(.circular)
                            .frame(width: 200.0, height: 200.0, alignment: .center)
                        Spacer()
                    } else {
                        VStack {
                            AsyncImage(
                                url: URL(string: SharedLinks.Books.bookCover(viewModel.details.imageURL).url)
                            ) { image in
                                image
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                            } placeholder: {
                                Image(uiImage: .dogPlaceholder)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                            }
                            .frame(width: 250.0, height: 200.0)
                            Text(viewModel.details.author)
                                .frame(alignment: .center)
                                .lineLimit(2)
                                .padding(.horizontal, 24.0)
                                .font(.title2)
                                .padding(.bottom, 24.0)
                            Text(viewModel.details.bookTitle)
                                .frame(alignment: .center)
                                .lineLimit(2)
                                .font(.title)
                                .padding(.horizontal, 24.0)
                                .padding(.bottom, 40.0)
                            
                            Group {
                                Text("Description: ".localized)
                                    .bold() +
                                Text(viewModel.details.description)
                            }
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.horizontal, 24.0)
                            
                            Group {
                                Text("Publisher: ".localized)
                                    .bold() +
                                Text(viewModel.details.publisher)
                            }
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.horizontal, 24.0)
                            
                            Group {
                                Text("Year: ".localized)
                                    .bold() +
                                Text(viewModel.details.firstPublishYear)
                            }
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.horizontal, 24.0)
                        }
                        Spacer()
                    }
                }
                
                if isShowCheckmarkAnimation {
                    CheckmarkView()
                        .transition(.opacity)
                        .zIndex(2.0)
                }
                
                if viewModel.isShowError {
                    ErrorView()
                        .transition(.opacity)
                        .zIndex(2.0)
                        .animation(.easeInOut, value: 1.0)
                }
            }
            .background(Color.white)
            .edgesIgnoringSafeArea(.top)
        }
    }
    
    init(title: String) {
        self.title = title
        self.viewModel = BookDetailsViewModel(title: title)
    }
    
    private func showCheckmarkView() {
        withAnimation {
            isShowCheckmarkAnimation = true
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            withAnimation {
                isShowCheckmarkAnimation = false
            }
        }
    }
    
}
