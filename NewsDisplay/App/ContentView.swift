//
//  ContentView.swift
//  NewsDisplay
//
//  Created by Victor Ulloa on 2024-08-13.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var viewModel = ViewModel()
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(viewModel.recommendations) { recommendation in
                    RecommendationsListItem(recommendation: recommendation)
                }
            }
            .listStyle(.plain)
            .navigationTitle("Recommendations")
        }
    }
}

#Preview {
    ContentView()
}
