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
        HStack(spacing: 14) {
            
            // Loads image from online URL.
            if let imageURL = artwork.images?.web?.url,
               let url = URL(string: imageURL) {
                
                AsyncImage(url: url) { phase in
                    switch phase {
                    case .empty:
                        ProgressView()
                            .frame(width: 85, height: 85)
                        
                    case .success(let image):
                        image
                            .resizable()
                            .scaledToFill()
                            .frame(width: 85, height: 85)
                            .clipShape(RoundedRectangle(cornerRadius: 12))
                        
                    case .failure:
                        Image(systemName: "photo")
                            .font(.largeTitle)
                            .frame(width: 85, height: 85)
                        
                    @unknown default:
                        EmptyView()
                    }
                }
            } else {
                Image(systemName: "photo")
                    .font(.largeTitle)
                    .frame(width: 85, height: 85)
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
