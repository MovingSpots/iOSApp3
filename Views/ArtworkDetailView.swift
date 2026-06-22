//
//  ArtworkDetailView.swift
//  iOSApp3
//
//  Created by SELVARAJ THYAGARAJAN on 2026-06-19.
//

import SwiftUI

struct ArtworkDetailView: View {
    
    let artwork: Artwork
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 18) {
                
                if let imageURL = artwork.images?.web?.url,
                   let url = URL(string: imageURL) {
                    
                    AsyncImage(url: url) { image in
                        image
                            .resizable()
                            .scaledToFit()
                    } placeholder: {
                        ProgressView()
                    }
                    .cornerRadius(14)
                }
                
                Text(artwork.title ?? "Untitled Artwork")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                if let creators = artwork.creators, !creators.isEmpty {
                    Text("Creator")
                        .font(.headline)
                    
                    ForEach(creators) { creator in
                        Text(creator.description ?? "Unknown creator")
                            .foregroundColor(.secondary)
                    }
                }
                
                DetailRow(title: "Date", value: artwork.creationDate ?? "Unknown")
                DetailRow(title: "Type", value: artwork.type ?? "Unknown")
                DetailRow(title: "Technique", value: artwork.technique ?? "Unknown")
                
                if let culture = artwork.culture, !culture.isEmpty {
                    DetailRow(title: "Culture", value: culture.joined(separator: ", "))
                }
                
                Text("Description")
                    .font(.headline)
                
                Text(artwork.wallDescription ?? "No description available.")
                    .font(.body)
            }
            .padding()
        }
        .navigationTitle("Artwork Details")
        .navigationBarTitleDisplayMode(.inline)
    }
}

// Small reusable row for detail information.
struct DetailRow: View {
    let title: String
    let value: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(title)
                .font(.headline)
            
            Text(value)
                .foregroundColor(.secondary)
        }
    }
}

#Preview {
    ArtworkDetailView(
        artwork: Artwork(
            id: 1,
            title: "Sample Artwork",
            creationDate: "1900",
            culture: ["American"],
            technique: "Oil on canvas",
            type: "Painting",
            wallDescription: "This is a sample artwork description.",
            images: nil,
            creators: nil
        )
    )
}
