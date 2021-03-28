//
//  StandardHomeMovie.swift
//  Netflix
//
//  Created by Cristian Espes on 20/3/21.
//

import SwiftUI
import Kingfisher

struct StandardHomeMovie: View {
    let movie: Movie
    
    var body: some View {
        GeometryReader { proxy in
            KFImage(movie.thumbnailURL)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: proxy.size.width, height: proxy.size.height)
                .clipped()
        }
    }
}

#if DEBUG
struct StandardHomeMovie_Previews: PreviewProvider {
    static var previews: some View {
        StandardHomeMovie(movie: exampleMovie1)
            .frame(width: 200, height: 300)
    }
}
#endif
