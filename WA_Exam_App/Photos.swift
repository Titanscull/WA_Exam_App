//
//  Photos.swift
//  WA_Exam_App
//
//  Created by Blashko Maksim on 08.03.2021.
//

import Foundation

// MARK: - CuratedPhotos
struct CuratedPhotos: Codable {
    let page, perPage: Int
    let photos: [Photo]
    let nextPage: String

    enum CodingKeys: String, CodingKey {
        case page
        case perPage = "per_page"
        case photos
        case nextPage = "next_page"
    }
}

// MARK: - Photo
struct Photo: Codable {
    let id, width, height: Int
    let url: String
    let photographer: String
    let photographerURL: String
    let photographerID: Int
    let avgColor: String
    let src: Src
    let liked: Bool

    enum CodingKeys: String, CodingKey {
        case id, width, height, url, photographer
        case photographerURL = "photographer_url"
        case photographerID = "photographer_id"
        case avgColor = "avg_color"
        case src, liked
    }
}

// MARK: - Src
struct Src: Codable {
    let original, large2X, large, medium: String
    let small, portrait, landscape, tiny: String

    enum CodingKeys: String, CodingKey {
        case original
        case large2X = "large2x"
        case large, medium, small, portrait, landscape, tiny
    }
}
