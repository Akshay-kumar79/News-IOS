//
//  ArticleView.swift
//  News-IOS
//
//  Created by Akshay kumar shaw on 10/11/24.
//

import SwiftUI
import URLImage

struct ArticleView: View {
    
    let article: Article
    
    var body: some View {
        HStack {
            if let imageUrl = article.image,
               let url = URL(string: imageUrl) {
                URLImage(
                    url,
                    failure: { error, retry in
                        // Display error and retry button
                        PlaceholderImageView()
                    }
                ){ image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                }
                .environment(\.urlImageOptions, URLImageOptions(
                    maxPixelSize: CGSize(width: 100, height: 100)
                ))
                .frame(width: 100,height: 100)
                .cornerRadius(10)
            } else {
                PlaceholderImageView()
            }
            
            VStack(alignment: .leading, spacing: 8) {
                Text(article.title ?? "")
                    .foregroundColor(.black)
                    .font(.system(size: 18, weight: .semibold))
                
                Text(article.source ?? "")
                    .foregroundColor(.gray)
                    .font(.footnote)
            }
        }
    }
}

struct PlaceholderImageView: View {
    var body: some View {
        Image(systemName: "photo.fill")
            .foregroundColor(.white)
            .background(Color.gray)
            .frame(width: 100,height: 100)
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    ArticleView(article: Article.dummy)
}
