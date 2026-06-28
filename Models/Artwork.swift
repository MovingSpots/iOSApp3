//
//  Artwork.swift
//  iOSApp3
//
//  Created by SELVARAJ THYAGARAJAN on 2026-06-19.
//

import Foundation

// This model represents the full API response.
// The Cleveland Museum API returns artwork records inside "data".
struct ArtworkResponse: Codable {
    let data: [Artwork]
}

// This model represents one artwork item.
// Codable decodes JSON.
// Identifiable allows SwiftUI List to display each artwork.
struct Artwork: Codable, Identifiable {
    let id: Int
    let title: String?
    let creationDate: String?
    let culture: [String]?
    let technique: String?
    let type: String?
    let wallDescription: String?
    let images: ArtworkImages?
    let creators: [Creator]?
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case creationDate = "creation_date"
        case culture
        case technique
        case type
        case wallDescription = "wall_description"
        case images
        case creators
    }
}

// Image data from API.
struct ArtworkImages: Codable {
    let web: ImageInfo?
}

// Web image URL.
struct ImageInfo: Codable {
    let url: String?
}

// Creator / artist data.
struct Creator: Codable, Identifiable {
    var id: String {
        description ?? UUID().uuidString
    }
    
    let description: String?
}
