//
//  ArtworkViewModel.swift
//  iOSApp3
//
//  Created by SELVARAJ THYAGARAJAN on 2026-06-19.
//

import Foundation
import SwiftUI
import Combine

// ViewModel connects the API service to the SwiftUI screen.
// @MainActor ensures UI updates happen safely on the main thread.
@MainActor
class ArtworkViewModel: ObservableObject {
    
    // List of artworks shown in the app.
    @Published var artworks: [Artwork] = []
    
    // Search text typed by the user.
    @Published var searchText: String = "painting"
    
    // Loading and error states.
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?
    
    private let apiService = MuseumAPIService()
    
    // Loads artworks from the online API.
    func loadArtworks() async {
        isLoading = true
        errorMessage = nil
        
        do {
            artworks = try await apiService.searchArtworks(searchText: searchText)
        } catch {
            errorMessage = "Unable to load museum data. Please check internet connection or API URL."
            print("API Error: \(error.localizedDescription)")
        }
        
        isLoading = false
    }
}
