//
//  Artwork.swift
//  iOSApp3
//
//  Created by SELVARAJ THYAGARAJAN on 2026-06-19.
//

import Foundation

// Main API response.
// The Cleveland Museum API returns artwork records inside a "data" array.
struct ArtworkResponse: Codable {
    let data: [Artwork]
}

// Artwork model.
// Codable allows Swift to decode JSON into this structure.
// Identifiable allows this model to work inside SwiftUI List.
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

// Image object from the API.
struct ArtworkImages: Codable {
    let web: ImageInfo?
}

// Web image information.
struct ImageInfo: Codable {
    let url: String?
}

// Artist / creator information.
struct Creator: Codable, Identifiable {
    var id: String {
        description ?? UUID().uuidString
    }
    
    let description: String?
}
