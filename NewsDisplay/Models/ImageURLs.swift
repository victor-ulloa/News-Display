//
//  ImageURLs.swift
//  NewsDisplay
//
//  Created by Victor Ulloa on 2024-08-14.
//

import Foundation

struct ImageURLs: Codable {
    
    let width200: String?
    let width220: String?
    let width650: String?
    let width900: String?
    let width1200: String?
    let resizeUrl: String?
    let original: String?

    enum CodingKeys: String, CodingKey {
        case width200 = "200"
        case width220 = "220"
        case width650 = "650"
        case width900 = "900"
        case width1200 = "1200"
        case resizeUrl = "resize_url"
        case original
    }
    
}
