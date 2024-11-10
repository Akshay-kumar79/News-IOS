//
//  NewsViewModel.swift
//  News-IOS
//
//  Created by Akshay kumar shaw on 10/11/24.
//

import Foundation
import Combine

protocol NewsViewModel {
    var articles: [Article] { get }
    var state: ResultState { get }
    func getArticles()
}

class NewsViewModelImpl: ObservableObject, NewsViewModel {
    
    private let newsService: NewsService

    @Published internal var articles: [Article] = []
    @Published internal var state: ResultState = .loading
    
    private var cancellables: Set<AnyCancellable> = []
    
    init (newsService: NewsService) {
        self.newsService = newsService
    }
    
    func getArticles() {
        self.state = .loading
        newsService.request(from: .getNews)
            .sink { [weak self] res in
                guard let self else { return }
                switch res {
                    case .finished:
                        self.state = .success(content: self.articles)
                    case .failure(let error):
                        self.state = .failure(error: error)
                }
            } receiveValue: { [weak self] (response) in
                self?.articles = response.articles
            }
            .store(in: &self.cancellables)
    }
}

