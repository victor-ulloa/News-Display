//
//  ViewModel.swift
//  NewsDisplay
//
//  Created by Victor Ulloa on 2024-08-14.
//

import Foundation

final class ViewModel: ObservableObject {
    
    @Published var recommendations: [Recommendation] = []
    @Published var errorMessage: String?

    init() {
        loadRecommendations()
    }
    
    func loadRecommendations() {
        NetworkManager.shared.fetchRecommendations { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let recommendationsResponse):
                    self?.recommendations = recommendationsResponse.recommendations ?? []
                case .failure(let error):
                    self?.errorMessage = error.localizedDescription
                }
            }
        }
    }
}
