//
//  RecommendationsListItem.swift
//  NewsDisplay
//
//  Created by Victor Ulloa on 2024-08-14.
//

import SwiftUI

struct RecommendationsListItem: View {
    
    let recommendation: Recommendation
    let imageSize: CGFloat = 120
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .top, spacing: 20) {
                if let protectionProduct = recommendation.protectionProduct, !protectionProduct.isEmpty  {
                    Text(recommendation.title ?? "")
                        .font(.custom("Times New Roman", size: 24))
                        .fontWeight(.bold)
                    + Text(" ")
                    + Text(Image(systemName: "x.circle"))
                        .foregroundColor(.red)
                } else {
                    Text(recommendation.title ?? "")
                        .font(.custom("Times New Roman", size: 24))
                        .fontWeight(.bold)
                }
                
                Spacer()
                
                if let imageURL = URL(string: recommendation.images?.urls?.width220 ?? "") {
                    AsyncImage(url: imageURL) { phase in
                        switch phase {
                        case .empty:
                            ProgressView()
                        case .success(let image):
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                        case .failure:
                            Image(systemName: "exclamationmark.triangle")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                        @unknown default:
                            EmptyView()
                        }
                    }
                    .frame(width: imageSize) // Set the frame size if needed
                }
            }
            if let authors = recommendation.byline {
                Text(String.formatAuthors(authors))
                    .font(.callout)
                    .foregroundStyle(Color.black.opacity(0.7))
            }
        }
    }
}

#Preview {
    RecommendationsListItem(
        recommendation:
            Recommendation(
                title: "Memo to Jasper: Do not become another Lytton",
                byline: ["Gary Mason"],
                images: Images(
                    urls:
                        ImageURLs(
                            width200: "https://www.theglobeandmail.com/resizer/v2/CXO5XEVIKBBJVAT6CAEKOODPHU.jpg?auth=0b4ac683d504bb899bee61c87148eb91bf197ae7a09f58e8f0303fda9827e874&width=200&quality=80",
                            width220: "https://www.theglobeandmail.com/resizer/v2/CXO5XEVIKBBJVAT6CAEKOODPHU.jpg?auth=0b4ac683d504bb899bee61c87148eb91bf197ae7a09f58e8f0303fda9827e874&width=220&quality=80",
                            width650: "https://www.theglobeandmail.com/resizer/v2/CXO5XEVIKBBJVAT6CAEKOODPHU.jpg?auth=0b4ac683d504bb899bee61c87148eb91bf197ae7a09f58e8f0303fda9827e874&width=650&quality=80",
                            width900: "https://www.theglobeandmail.com/resizer/v2/CXO5XEVIKBBJVAT6CAEKOODPHU.jpg?auth=0b4ac683d504bb899bee61c87148eb91bf197ae7a09f58e8f0303fda9827e874&width=900&quality=80",
                            width1200: "https://www.theglobeandmail.com/resizer/v2/CXO5XEVIKBBJVAT6CAEKOODPHU.jpg?auth=0b4ac683d504bb899bee61c87148eb91bf197ae7a09f58e8f0303fda9827e874&width=1200&quality=80",
                            resizeUrl: "/resizer/py-DcaxXbHE1S7ZZ40CVNoy9wOA=/300x0/arc-anglerfish-tgam-prod-tgam/public/CXO5XEVIKBBJVAT6CAEKOODPHU.jpg",
                            original: "https://cloudfront-us-east-1.images.arcpublishing.com/tgam/CXO5XEVIKBBJVAT6CAEKOODPHU.jpg"
                        ),
                    caption: "FILE - Damage is seen after a wildfire in Jasper, Alberta, Friday July 26, 2024. (Amber Bracken/The Canadian Press via AP, File)"
                ),
                protectionProduct: "red")
    )
}
