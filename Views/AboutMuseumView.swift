//
//  AboutMuseumView.swift
//  iOSApp3
//
//  Created by SELVARAJ THYAGARAJAN on 2026-06-28.
//

import SwiftUI

struct AboutMuseumView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 18) {
                
                Image(systemName: "building.columns.fill")
                    .font(.system(size: 80))
                    .foregroundColor(.blue)
                    .frame(maxWidth: .infinity)
                    .padding(.top)
                
                Text("Cleveland Museum Navigator")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                Text("About This App")
                    .font(.headline)
                
                Text("This app allows visitors to search artworks from the Cleveland Museum of Art Open Access collection. Users can search for artworks, view images, read artwork details, and explore museum information.")
                
                Text("Features")
                    .font(.headline)
                
                VStack(alignment: .leading, spacing: 8) {
                    Text("• Online API data loading")
                    Text("• Search by keyword")
                    Text("• Artwork image display")
                    Text("• Artwork detail screen")
                    Text("• Loading and error handling")
                    Text("• SwiftUI navigation")
                }
                
                Text("API Used")
                    .font(.headline)
                
                Text("Cleveland Museum of Art Open Access API")
                    .foregroundColor(.secondary)
                
                Spacer()
            }
            .padding()
        }
        .navigationTitle("About")
    }
}

#Preview {
    AboutMuseumView()
}
