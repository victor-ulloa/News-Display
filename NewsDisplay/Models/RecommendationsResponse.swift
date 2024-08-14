//
//  RecommendationsResponse.swift
//  NewsDisplay
//
//  Created by Victor Ulloa on 2024-08-14.
//

import Foundation

struct RecommendationResponse: Codable {
    
    let recommendations: [Recommendation]?
    let requestID: String?
    let widget_id: String?
    
    enum CodingKeys: String, CodingKey {
        case recommendations
        case requestID = "request_id"
        case widget_id = "widget_id"
    }

}
