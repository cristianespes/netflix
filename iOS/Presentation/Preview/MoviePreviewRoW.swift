//
//  MoviePreviewRoW.swift
//  Netflix
//
//  Created by Cristian Espes on 28/3/21.
//

import SwiftUI

struct MoviePreviewRoW: View {
    
    let movies: [Movie]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Previews") // TODO: Localizable
                .font(.title3)
                .fontWeight(.bold)
                .foregroundColor(.white)
                .padding(.horizontal, 8)
            
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack(spacing: 16) {
                    ForEach(0..<movies.count) { movieIndex in
                        let movie = movies[movieIndex]
                        MoviePreviewCell(movie: movie)
                            .frame(width: 120, height: 120)
                    }
                }
                .padding(.horizontal, 8)
            }
        }
        .frame(height: 185)
    }
}

#if DEBUG
struct MoviePreviewRoW_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            
            MoviePreviewRoW(movies: exampleMovies)
                
        }
    }
}
#endif
