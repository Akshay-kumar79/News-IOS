//
//  APIErrors.swift
//  News-IOS
//
//  Created by Akshay kumar shaw on 10/11/24.
//

import Foundation

enum APIError: Error {
    case decodingError
    case errorCode(Int)
    case unknown
}

extension APIError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .decodingError:
            return "Error decoding data"
        case .errorCode(let code):
            return "Somwthing went wrong: \(code)"
        case .unknown:
            return "Unknown error"
        }
    }
}
