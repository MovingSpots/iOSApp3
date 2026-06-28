//
//  ArtworkListView.swift
//  iOSApp3
//
//  Created by SELVARAJ THYAGARAJAN on 2026-06-19.
//

import SwiftUI

struct ArtworkListView: View {
    
    // ViewModel stores API data and search state.
    @StateObject private var viewModel = ArtworkViewModel()
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 10) {
                
                // Search section.
                HStack {
                    TextField("Search artwork, artist, culture...", text: $viewModel.searchText)
                        .textFieldStyle(.roundedBorder)
                    
                    Button("Search") {
                        Task {
                            await viewModel.loadArtworks()
                        }
                    }
                    .buttonStyle(.borderedProminent)
                }
                .padding(.horizontal)
                .padding(.top)
                
                // Reset button.
                Button("Reset to Paintings") {
                    Task {
                        await viewModel.resetSearch()
                    }
                }
                .font(.caption)
                
                // Loading indicator.
                if viewModel.isLoading {
                    ProgressView("Loading museum artworks...")
                        .padding()
                }
                
                // Error message.
                if let errorMessage = viewModel.errorMessage {
                    Text(errorMessage)
                        .foregroundColor(.red)
                        .font(.subheadline)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)
                }
                
                // Main artwork list.
                List(viewModel.artworks) { artwork in
                    NavigationLink {
                        ArtworkDetailView(artwork: artwork)
                    } label: {
                        ArtworkRowView(artwork: artwork)
                    }
                }
                .listStyle(.plain)
            }
            .navigationTitle("Museum Navigator")
            .toolbar {
                NavigationLink {
                    AboutMuseumView()
                } label: {
                    Image(systemName: "info.circle")
                }
            }
            .task {
                await viewModel.loadArtworks()
            }
        }
    }
}

#Preview {
    ArtworkListView()
}
