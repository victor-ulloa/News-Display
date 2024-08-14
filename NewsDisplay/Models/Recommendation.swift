//
//  Recommendation.swift
//  NewsDisplay
//
//  Created by Victor Ulloa on 2024-08-14.
//

import Foundation

struct Recommendation: Codable, Identifiable {
    let id: String
    let title: String
    let description: String
    let imageURL: URL

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case title = "title"
        case description = "description"
        case imageURL = "image_url"
    }
}
