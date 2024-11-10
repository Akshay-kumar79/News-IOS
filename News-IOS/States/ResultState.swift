//
//  ResultState.swift
//  News-IOS
//
//  Created by Akshay kumar shaw on 10/11/24.
//

import Foundation

enum ResultState {
    case loading
    case success(content: [Article])
    case failure(error: Error)
}

