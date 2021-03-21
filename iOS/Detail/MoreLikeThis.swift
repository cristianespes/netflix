//
//  MoreLikeThis.swift
//  Netflix
//
//  Created by Cristian Espes on 21/3/21.
//

import SwiftUI

struct MoreLikeThis: View {
    
    let movies: [Movie]
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        LazyVGrid(columns: columns) {
            ForEach(0..<movies.count) { index in
                Button(action: {
                    // action
                }, label: {
                    StandardHomeMovie(movie: movies[index])
                })
            }
        }
    }
}

#if DEBUG
struct MoreLikeThis_Previews: PreviewProvider {
    static var previews: some View {
        MoreLikeThis(movies: exampleMovies)
    }
}
#endif
