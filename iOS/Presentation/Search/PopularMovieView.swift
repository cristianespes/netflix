//
//  PopularMovieView.swift
//  Netflix
//
//  Created by Cristian Espes on 26/3/21.
//

import SwiftUI
import Kingfisher

struct PopularMovieView: View {
    
    let movie: Movie
    
    @Binding var movieDetailToShow: Movie?
    
    var body: some View {
        GeometryReader { proxy in
            HStack(spacing: 16) {
                KFImage(movie.thumbnailURL)
                    .resizable()
                    .frame(width: proxy.size.width / 3)
                    .padding(.leading, 4)
                
                Text(movie.name)
                    .fontWeight(.bold)
                    .foregroundColor(Color.white.opacity(0.9))
                
                Spacer()
                
                Button(action: {
                    // play movie
                }, label: {
                    Image(systemName: "arrowtriangle.right.fill")
                })
                .padding(.trailing, 20)
            }
        }
        .foregroundColor(.white)
        .onTapGesture {
            movieDetailToShow = movie
        }
    }
}

#if DEBUG
struct PopularMovieView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            
            PopularMovieView(movie: exampleMovie1, movieDetailToShow: .constant(nil))
                .frame(height: 75)
        }
    }
}
#endif
