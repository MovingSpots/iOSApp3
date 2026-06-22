//
//  ArtworkRowView.swift
//  iOSApp3
//
//  Created by SELVARAJ THYAGARAJAN on 2026-06-19.
//

import SwiftUI

struct ArtworkRowView: View {
    
    let artwork: Artwork
    
    var body: some View {
        HStack(spacing: 12) {
            
            // AsyncImage loads an image from a web URL.
            if let imageURL = artwork.images?.web?.url,
               let url = URL(string: imageURL) {
                
                AsyncImage(url: url) { image in
                    image
                        .resizable()
                        .scaledToFill()
                } placeholder: {
                    ProgressView()
                }
                .frame(width: 80, height: 80)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                
            } else {
                Image(systemName: "photo")
                    .font(.largeTitle)
                    .frame(width: 80, height: 80)
            }
            
            VStack(alignment: .leading, spacing: 6) {
                Text(artwork.title ?? "Untitled Artwork")
                    .font(.headline)
                    .lineLimit(2)
                
                Text(artwork.creationDate ?? "Date unknown")
                    .font(.caption)
                    .foregroundColor(.secondary)
                
                Text(artwork.type ?? "Artwork")
                    .font(.caption)
                    .foregroundColor(.blue)
            }
        }
        .padding(.vertical, 6)
    }
}

#Preview {
    ArtworkRowView(
        artwork: Artwork(
            id: 1,
            title: "Sample Artwork",
            creationDate: "1900",
            culture: ["American"],
            technique: "Oil on canvas",
            type: "Painting",
            wallDescription: "Sample description",
            images: nil,
            creators: nil
        )
    )
}
