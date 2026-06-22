//
//  MuseumAPIService.swift
//  iOSApp3
//
//  Created by SELVARAJ THYAGARAJAN on 2026-06-19.
//

import Foundation

// This service is responsible for contacting the online API.
// It downloads JSON data and converts it into Swift models.
class MuseumAPIService {
    
    // Searches artworks using the Cleveland Museum of Art Open Access API.
    func searchArtworks(searchText: String) async throws -> [Artwork] {
        
        // Convert spaces and special characters into a safe URL format.
        let encodedSearch = searchText.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? "painting"
        
        // API URL.
        // has_image=1 requests artworks that include images.
        let urlString = "https://openaccess-api.clevelandart.org/api/artworks/?q=\(encodedSearch)&has_image=1&limit=20"
        
        guard let url = URL(string: urlString) else {
            throw URLError(.badURL)
        }
        
        // Download data from the API.
        let (data, _) = try await URLSession.shared.data(from: url)
        
        // Decode JSON into ArtworkResponse.
        let decodedResponse = try JSONDecoder().decode(ArtworkResponse.self, from: data)
        
        return decodedResponse.data
    }
}
