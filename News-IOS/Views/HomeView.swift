//
//  HomeView.swift
//  News-IOS
//
//  Created by Akshay kumar shaw on 10/11/24.
//

import SwiftUI

struct HomeView: View {
    
    @Environment(\.openURL) var openUrl
    @StateObject var viewmodel = NewsViewModelImpl(newsService: NewsServiceImpl())
    
    var body: some View {
        Group {
            switch viewmodel.state {
            case .loading:
                ProgressView()
            case .failure(error: let error):
                ErrorView(error: error){
                    viewmodel.getArticles()
                }
            case .success(content: let articles):
                NavigationView {
                    List(articles) { article in
                        ArticleView(article: article)
                            .onTapGesture {
                                load(url: article.url)
                            }
                    }
                    .navigationTitle("News")
                }
            }
        }.onAppear {
            viewmodel.getArticles()
        }
    }
    
    func load(url: String?){
        guard let link = url,
            let url = URL(string: link) else { return }
        
        openUrl(url)
    }
}

#Preview {
    HomeView()
}
