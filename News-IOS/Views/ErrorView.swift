//
//  ErrorView.swift
//  News-IOS
//
//  Created by Akshay kumar shaw on 10/11/24.
//

import SwiftUI

struct ErrorView: View {
    
    let error: Error
    let onRetry: () -> Void
    
    var body: some View {
        VStack {
            Image(systemName: "exclamationmark.icloud.fill")
                .foregroundColor(.gray)
                .font(.system(size: 50, weight: .heavy))
                .padding(.bottom, 4)
            Text("Ooopss")
                .foregroundColor(.black)
                .font(.system(size: 30, weight: .heavy))
                .multilineTextAlignment(.center)
            Text(error.localizedDescription)
                .foregroundStyle(.gray)
                .font(.system(size: 15, weight: .medium))
                .multilineTextAlignment(.center)
            
            Button("Try Again") {
                onRetry()
            }.padding(.vertical, 12)
                .padding(.horizontal, 30)
                .background(Color.blue)
                .foregroundColor(.white)
                .font(.system(size: 15, weight: .heavy))
                .cornerRadius(10)
                .padding(.top, 4)
        }
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    ErrorView(error: APIError.decodingError){}
}
