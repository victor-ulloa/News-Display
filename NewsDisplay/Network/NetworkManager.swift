//
//  NetworkManager.swift
//  NewsDisplay
//
//  Created by Victor Ulloa on 2024-08-14.
//

import Foundation

class NetworkManager {
    static let shared = NetworkManager()
    private let baseURL = "https://d2c9087llvttmg.cloudfront.net"
    
    private func buildURL(for path: String, queryItems: [URLQueryItem] = []) -> URL? {
        var components = URLComponents(string: baseURL)
        components?.path = path
        if !queryItems.isEmpty {
            components?.queryItems = queryItems
        }
        return components?.url
    }
    
    func fetchRecommendations(completion: @escaping (Result<RecommendationResponse, Error>) -> Void) {
        guard let url = buildURL(for: "/trending_and_sophi/recommendations.json") else {
            completion(.failure(NSError(domain: "Invalid URL", code: 0, userInfo: nil)))
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                completion(.failure(NSError(domain: "No data", code: 0, userInfo: nil)))
                return
            }
            
            do {
                let recommendations = try JSONDecoder().decode(RecommendationResponse.self, from: data)
                completion(.success(recommendations))
            } catch let decodingError {
                completion(.failure(decodingError))
            }
        }.resume()
    }
}
