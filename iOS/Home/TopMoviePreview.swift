//
//  TopMoviePreview.swift
//  Netflix
//
//  Created by Cristian Espes on 20/3/21.
//

import SwiftUI
import Kingfisher

struct TopMoviePreview: View {
    var movie: Movie
    
    var body: some View {
        ZStack {
            KFImage(movie.thumbnailURL)
                .resizable()
                .scaledToFill()
                .clipped()
            
            VStack(spacing: 16) {
                Spacer()
                
                HStack {
                    ForEach(movie.categories, id: \.self) { category in
                        HStack {
                            Text(category)
                                .font(.footnote)
                            
                            if isLastCategory(category) == false {
                                Image(systemName: "circle.fill")
                                    .foregroundColor(.green)
                                    .font(.system(size: 3))
                            }
                        }
                    }
                }
                
                HStack {
                    Spacer()
                    
                    SmallVerticalButton(text: "My List", // TODO: Localizable
                                        isOnImage: "checkmark",
                                        isOffImage: "plus",
                                        isOn: true,
                                        action: {  })
                    
                    Spacer()
                    
                    WhiteButton(text: "Play", // TODO: Localizable
                                imageName: "play.fill",
                                action: {  })
                        .frame(width: 120)
                    
                    Spacer()
                    
                    SmallVerticalButton(text: "Info", // TODO: Localizable
                                        isOnImage: "info.circle",
                                        isOffImage: "info.circle",
                                        isOn: true,
                                        action: {  })
                    
                    Spacer()
                }
            }
            .background(
                LinearGradient.blackOpacityGradient
                    .padding(.top, 250)
            )
        }
        .foregroundColor(.white)
    }
    
    private func isLastCategory(_ category: String) -> Bool {
        let categoryCount = movie.categories.count
        
        if let index = movie.categories.firstIndex(of: category) {
            if index + 1 != categoryCount {
                return false
            }
        }
        
        return true
    }
}

#if DEBUG
struct TopMoviePreview_Previews: PreviewProvider {
    static var previews: some View {
        TopMoviePreview(movie: exampleMovie1)
    }
}
#endif
