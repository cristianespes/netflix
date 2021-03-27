//
//  SearchResultGrid.swift
//  Netflix
//
//  Created by Cristian Espes on 27/3/21.
//

import SwiftUI

struct SearchResultGrid: View {
    
    let movies: [Movie]
    
    @Binding var movieDetailToShow: Movie?
    
    private let columns: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        LazyVGrid(columns: columns, spacing: 10) {
            ForEach(movies, id: \.id) { movie in
                StandardHomeMovie(movie: movie)
                    .frame(height: 160)
                    .clipped()
                    .onTapGesture {
                        movieDetailToShow = movie
                    }
            }
        }
    }
}

struct SearchResultGrid_Previews: PreviewProvider {
    static var previews: some View {
        SearchResultGrid(movies: generateMovies(20), movieDetailToShow: .constant(nil))
    }
}
