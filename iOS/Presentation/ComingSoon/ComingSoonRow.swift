//
//  ComingSoonRow.swift
//  Netflix
//
//  Created by Cristian Espes on 27/3/21.
//

import SwiftUI
import Kingfisher
import AVKit

struct ComingSoonRow: View {
    
    let movie: Movie
    
    @Binding var movieDetailToShow: Movie?
    
    private var player: AVPlayer {
        AVPlayer(url: exampleVideoURL)
    }
    
    private let screen = UIScreen.main.bounds
        
    var body: some View {
        GeometryReader { proxy in
            VStack {
                VideoPlayer(player: player)
                    .frame(height: 200)
                
                VStack {
                    HStack {
                        KFImage(movie.thumbnailURL)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: proxy.size.width / 3, height: 75)
                            .clipped()
                        
                        Spacer()
                        
                        Button(action: {
                            // Remind me
                        }, label: {
                            VStack(spacing: 6) {
                                Image(systemName: "bell")
                                    .font(.title3)
                                
                                Text("Remind me") // TODO: Localizable
                            }
                        })
                        .padding(.horizontal)
                        
                        Button(action: {
                            movieDetailToShow = movie
                        }, label: {
                            VStack(spacing: 6) {
                                Image(systemName: "info.circle")
                                    .font(.title3)
                                
                                Text("Info") // TODO: Localizable
                            }
                        })
                        .padding(.trailing, 24)
                    }
                    .font(.caption)
                    
                    HStack {
                        VStack(alignment: .leading) {
                            Text(movie.name)
                                .font(.title2)
                                .fontWeight(.bold)
                            
                            Text(movie.episodeDescriptionDisplay)
                                .foregroundColor(.gray)
                                .font(.headline)
                                //.fixedSize(horizontal: false, vertical: true)
                        }
                        
                        Spacer(minLength: 0)
                    }
                }
                .foregroundColor(.white)
                .padding(.horizontal)
            }
        }
    }
}

#if DEBUG
struct ComingSoonRow_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            
            ComingSoonRow(movie: exampleMovie1, movieDetailToShow: .constant(nil))
        }
    }
}
#endif
