//
//  MuseumAPIService.swift
//  iOSApp3
//
//  Created by SELVARAJ THYAGARAJAN on 2026-06-19.
//

import Foundation

// This service handles the API request.
// It downloads museum artwork data from the internet.
class MuseumAPIService {
    
    func searchArtworks(searchText: String) async throws -> [Artwork] {
        
        // Encode search text safely for URL use.
        let encodedSearch = searchText.addingPercentEncoding(
            withAllowedCharacters: .urlQueryAllowed
        ) ?? "painting"
        
        // Cleveland Museum of Art Open Access API.
        let urlString = "https://openaccess-api.clevelandart.org/api/artworks/?q=\(encodedSearch)&has_image=1&limit=30"
        
        guard let url = URL(string: urlString) else {
            throw URLError(.badURL)
        }
        
        // Download data from API.
        let (data, response) = try await URLSession.shared.data(from: url)
        
        // Check HTTP response.
        if let httpResponse = response as? HTTPURLResponse,
           httpResponse.statusCode != 200 {
            throw URLError(.badServerResponse)
        }
        
        // Convert JSON into Swift model.
        let decodedResponse = try JSONDecoder().decode(ArtworkResponse.self, from: data)
        
        return decodedResponse.data
    }
}
