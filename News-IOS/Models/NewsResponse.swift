//
//  NewsResponse.swift
//  News-IOS
//
//  Created by Akshay kumar shaw on 10/11/24.
//

import Foundation

// MARK: - News
struct NewsResponse: Codable {
    let articles: [Article]
}

// MARK: - Article
struct Article: Codable, Identifiable {
    let id = UUID()
    let author: String?
    let url: String?
    let source: String?
    let title: String?
    let description: String?
    let image: String?
    let date: Date?
}

extension Article{
    static var dummy: Article{
        .init(
            author: "Hannah Rabinowitz",
            url: "https://www.cnn.com/2024/11/08/politics/doj-charges-three-iranian-plot-to-kill-donald-trump/index.html",
            source: "CNN",
            title: "DOJ announces charges in Iranian plot to kill Donald Trump - CNN",
            description: "The Justice Department on Friday announced federal charges in a thwarted Iranian plot to kill Donald Trump before the presidential election.",
            image: "https://media.cnn.com/api/v1/images/stellar/prod/ap24309752020097.jpg?c=16x9&q=w_800,c_fill",
            date: Date()
        )
    }
}


