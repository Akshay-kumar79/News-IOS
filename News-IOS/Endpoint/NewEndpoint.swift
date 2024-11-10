//
//  NewEndpoint.swift
//  News-IOS
//
//  Created by Akshay kumar shaw on 10/11/24.
//

import Foundation

protocol APIBuilder {
    var urlRequest: URLRequest { get }
    var baseURL: URL { get }
    var path: String { get }
}

enum NewsAPI{
    case getNews
}

extension NewsAPI: APIBuilder{
    
    var baseURL: URL {
        switch self {
        case .getNews:
            return URL(string: "https://api.lil.software")!
        }
    }
    
    var path: String {
        switch self {
        case .getNews:
            return "/news"
        }
    }
    
    var urlRequest: URLRequest {
        var request = URLRequest(url: baseURL.appendingPathComponent(path))
        request.httpMethod = "GET"
        return request
    } 
}
