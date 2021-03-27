//
//  MovieDetail.swift
//  Netflix
//
//  Created by Cristian Espes on 20/3/21.
//

import SwiftUI

struct MovieDetail: View {
    
    var movie: Movie
    
    @Binding var movieDetailToShow: Movie?
    
    @State private var showSeasonPicker: Bool = false
    @State private var selectedSeason: Int = 1
    
    private let screen = UIScreen.main.bounds
    
    var body: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            
            ZStack(alignment: .topTrailing) {
                ScrollView(.vertical, showsIndicators: false) {
                    VStack(spacing: 16) {
                        
                        StandardHomeMovie(movie: movie)
                            .frame(width: screen.width / 2.5)
                            .padding(.top, 20)
                            
                        MovieInfoSubheadline(movie: movie)
                        
                        if let promotionHeadline = movie.promotionHeadline {
                            Text(promotionHeadline)
                                .fontWeight(.bold)
                                .font(.headline)
                        }
                        
                        PlayButton(text: "Play", // TODO: Localizable
                                   imageName: "play.fill",
                                   backgroundColor: .red,
                                   action: {  })
                        
                        CurrentEpisodeInformation(movie: movie)
                        
                        
                        CastInfo(movie: movie)
                        
                        HStack(spacing: 60) {
                            SmallVerticalButton(text: "My List", // TODO: Localizable
                                                isOnImage: "checkmark",
                                                isOffImage: "plus",
                                                isOn: true,
                                                action: {  })
                            
                            SmallVerticalButton(text: "Rate", // TODO: Localizable
                                                isOnImage: "hand.thumbsup.fill",
                                                isOffImage: "hand.thumbsup",
                                                isOn: true,
                                                action: {  })
                            
                            SmallVerticalButton(text: "Share", // TODO: Localizable
                                                isOnImage: "square.and.arrow.up",
                                                isOffImage: "square.and.arrow.up",
                                                isOn: true,
                                                action: {  })
                            
                            Spacer()
                        }
                        .padding(.horizontal, 20)
                        
                        CustomTabSwitcher(tabs: [.episodes, .trailers, .more], movie: movie, showSeasonPicker: $showSeasonPicker, selectedSeason: $selectedSeason)
                            .animation(.none)
                    }
                    .padding(.horizontal, 10)
                }
                
                HStack {
                    Spacer()
                    
                    Button(action: {
                        movieDetailToShow = nil
                    }, label: {
                        Image(systemName: "xmark.circle")
                            .font(.system(size: 28))
                    })
                    .buttonStyle(PlainButtonStyle())
                }
                .padding(.horizontal, 22)
            }
            .foregroundColor(.white)
            
            if showSeasonPicker == true {
                Group {
                    Color.black.opacity(0.9)
                    
                    VStack(spacing: 40) {
                        Spacer()
                        
                        ForEach(0..<(movie.numberOfSeasons ?? 0)) { season in
                            Button(action: {
                                selectedSeason = season + 1
                                showSeasonPicker = false
                            }, label: {
                                Text("Season \(season + 1)")
                                    .foregroundColor(selectedSeason == season + 1 ? .white : .gray)
                                    .font(selectedSeason == season + 1 ? .title : .title2)
                                    .fontWeight(.bold)
                            })
                        }
                        
                        Spacer()
                        
                        Button(action: {
                            showSeasonPicker = false
                        }, label: {
                            Image(systemName: "x.circle.fill")
                                .foregroundColor(.white)
                                .font(.system(size: 40))
                                .scaleEffect(x: 1.1)
                        })
                        .padding(.bottom, 30)
                    }
                }
                .edgesIgnoringSafeArea(.all)
            }
        }
    }
}

#if DEBUG
struct MovieDetail_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetail(movie: exampleMovie1, movieDetailToShow: .constant(exampleMovie1))
    }
}
#endif

struct MovieInfoSubheadline: View {
    
    let movie: Movie
    
    var body: some View {
        HStack(spacing: 20) {
            Image(systemName: "hand.thumbsup.fill")
                .foregroundColor(.white)
            
            Text(String(movie.year))
            
            RatingView(rating: movie.rating)
            
            if movie.numberOfSeasons != nil {
                Text(movie.numberOfSeasonsDisplay)
            }
        }
        .foregroundColor(.gray)
        .padding(.vertical, 6)
    }
}

struct RatingView: View {
    let rating: String
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.gray)
            
            Text(rating)
                .foregroundColor(.white)
                .font(.system(size: 12))
                .fontWeight(.bold)
        }
        .frame(width: 50, height: 20)
    }
}

struct CurrentEpisodeInformation: View {
    
    let movie: Movie
    
    var body: some View {
        Group {
            HStack {
                Text(movie.episodeInfoDisplay)
                    .fontWeight(.bold)
                
                Spacer()
            }
            
            HStack {
                Text(movie.episodeDescriptionDisplay)
                    .font(.subheadline)
                    .fixedSize(horizontal: false, vertical: true)
                
                Spacer()
            }
        }
    }
}

struct CastInfo: View {
    
    let movie: Movie
    
    var body: some View {
        VStack(spacing: 3) {
            HStack {
                Text("Cast: \(movie.cast)") // TODO: Localizable
                
                Spacer()
            }
            
            HStack {
                Text("Creators: \(movie.creators)") // TODO: Localizable
                
                Spacer()
            }
        }
        .font(.caption)
        .foregroundColor(.gray)
    }
}
