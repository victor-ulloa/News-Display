//
//  Recommendation.swift
//  NewsDisplay
//
//  Created by Victor Ulloa on 2024-08-14.
//

import Foundation

struct Recommendation: Codable, Identifiable {
    
    let id = UUID()
    let title: String?
    let byline: [String]?
    let images: Images?
    let protectionProduct: String?

    enum CodingKeys: String, CodingKey {
        case title
        case byline
        case images = "promo_image"
        case protectionProduct = "protection_product"
    }
}
