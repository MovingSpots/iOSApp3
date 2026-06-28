//
//  ArtworkViewModel.swift
//  iOSApp3
//
//  Created by SELVARAJ THYAGARAJAN on 2026-06-19.
//

import Foundation
import SwiftUI
import Combine

// ViewModel connects API data with SwiftUI screens.
// @MainActor keeps UI updates on the main thread.
@MainActor
class ArtworkViewModel: ObservableObject {
    
    // Artworks displayed in the app.
    @Published var artworks: [Artwork] = []
    
    // Search word entered by user.
    @Published var searchText: String = "painting"
    
    // Loading and error states.
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?
    
    private let apiService = MuseumAPIService()
    
    // Loads artworks from the API.
    func loadArtworks() async {
        isLoading = true
        errorMessage = nil
        
        do {
            artworks = try await apiService.searchArtworks(searchText: searchText)
            
            if artworks.isEmpty {
                errorMessage = "No artworks found. Try another search word."
            }
            
        } catch {
            errorMessage = "Unable to load museum data. Please check your internet connection."
            print("API Error: \(error.localizedDescription)")
        }
        
        isLoading = false
    }
    
    // Clears search and returns to default result.
    func resetSearch() async {
        searchText = "painting"
        await loadArtworks()
    }
}
