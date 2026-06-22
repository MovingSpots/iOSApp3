//
//  ArtworkListView.swift
//  iOSApp3
//
//  Created by SELVARAJ THYAGARAJAN on 2026-06-19.
//

import SwiftUI

struct ArtworkListView: View {
    
    // StateObject keeps the ViewModel alive while this screen is active.
    @StateObject private var viewModel = ArtworkViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                
                // Search box.
                HStack {
                    TextField("Search artworks", text: $viewModel.searchText)
                        .textFieldStyle(.roundedBorder)
                    
                    Button("Search") {
                        Task {
                            await viewModel.loadArtworks()
                        }
                    }
                    .buttonStyle(.borderedProminent)
                }
                .padding()
                
                // Loading indicator.
                if viewModel.isLoading {
                    ProgressView("Loading museum data...")
                        .padding()
                }
                
                // Error message.
                if let errorMessage = viewModel.errorMessage {
                    Text(errorMessage)
                        .foregroundColor(.red)
                        .padding()
                }
                
                // Artwork list.
                List(viewModel.artworks) { artwork in
                    NavigationLink {
                        ArtworkDetailView(artwork: artwork)
                    } label: {
                        ArtworkRowView(artwork: artwork)
                    }
                }
            }
            .navigationTitle("Museum Navigator")
            .task {
                await viewModel.loadArtworks()
            }
        }
    }
}

#Preview {
    ArtworkListView()
}
