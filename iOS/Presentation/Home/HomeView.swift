//
//  HomeView.swift
//  Netflix
//
//  Created by Cristian Espes on 20/3/21.
//

import SwiftUI

enum HomeTopRow: Int, CaseIterable {
    case home = 0
    case tvShows
    case movies
    case myList
    
    var title: String {
        switch self {
        case .home:
            return "Home" // TODO: Localizable
        case .tvShows:
            return "TV Shows" // TODO: Localizable
        case .movies:
            return "Movies" // TODO: Localizable
        case .myList:
            return "My List" // TODO: Localizable
        }
    }
}

enum HomeGenre: Int, CaseIterable {
    case allGenres = 0
    case action
    case comedy
    case horror
    case thriller
    
    var title: String {
        switch self {
        case .allGenres:
            return "All Genres" // TODO: Localizable
        case .action:
            return "Action" // TODO: Localizable
        case .comedy:
            return "comedy" // TODO: Localizable
        case .horror:
            return "Horror" // TODO: Localizable
        case .thriller:
            return "Thriller" // TODO: Localizable
        }
    }
}

struct HomeView: View {
    
    var vm: HomeViewModel = HomeViewModel()
    
    @State private var movieDetailToShow: Movie? = nil
    
    @State private var topRowSelection: HomeTopRow = .home
    @State private var homeGenre: HomeGenre = .allGenres
    
    @State private var showTopRowSelection: Bool = false
    @State private var showGenreSelection: Bool = false
    
    private let screen = UIScreen.main.bounds
    
    var body: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            
            ScrollView(.vertical, showsIndicators: false) {
                LazyVStack {
                    
                    TopRowButtons(topRowSelection: $topRowSelection,
                                  homeGenre: $homeGenre,
                                  showTopRowSelection: $showTopRowSelection,
                                  showGenreSelection: $showGenreSelection)
                    
                    TopMoviePreview(movie: exampleMovie1)
                        .frame(width: screen.width)
                        .padding(.top, -110)
                        .zIndex(-1)
                    
                    HomeStack(vm: vm,
                              topRowSelection: topRowSelection,
                              topGenreSelection: homeGenre,
                              movieDetailToShow: $movieDetailToShow)
                }
            }
            
            if let movie = movieDetailToShow {
                MovieDetail(movie: movie, movieDetailToShow: $movieDetailToShow)
                    .animation(.easeIn)
                    .transition(.opacity)
            }
            
            if showTopRowSelection == true {
                Group {
                    Color.black.opacity(0.9)
                    
                    VStack(spacing: 40) {
                        Spacer()
                        
                        ForEach(HomeTopRow.allCases, id: \.self) { topRow in
                            Button(action: {
                                topRowSelection = topRow
                                showTopRowSelection = false
                            }, label: {
                                if topRow == topRowSelection {
                                    Text(topRow.title)
                                        .foregroundColor(.white)
                                        .fontWeight(.bold)
                                } else {
                                    Text(topRow.title)
                                        .foregroundColor(.gray)
                                        .fontWeight(.bold)
                                }
                            })
                        }
                        
                        Spacer()
                        
                        Button(action: {
                            showTopRowSelection = false
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
                .font(.title2)
            }
            
            if showGenreSelection == true {
                Group {
                    Color.black.opacity(0.9)
                    
                    VStack(spacing: 40) {
                        Spacer()
                        
                        ScrollView(showsIndicators: false) {
                            ForEach(vm.allGenres, id: \.self) { genre in
                                Button(action: {
                                    homeGenre = genre
                                    showGenreSelection = false
                                }, label: {
                                    if genre == homeGenre {
                                        Text(genre.title)
                                            .foregroundColor(.white)
                                            .fontWeight(.bold)
                                    } else {
                                        Text(genre.title)
                                            .foregroundColor(.gray)
                                            .fontWeight(.bold)
                                    }
                                })
                                .padding(.bottom, 40)
                            }
                        }
                        
                        Spacer()
                        
                        Button(action: {
                            showGenreSelection = false
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
                .font(.title2)
            }
        }
        .foregroundColor(.white)
    }
}

#if DEBUG
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
#endif

struct TopRowButtons: View {
    
    @Binding var topRowSelection: HomeTopRow
    @Binding var homeGenre: HomeGenre
    
    @Binding var showTopRowSelection: Bool
    @Binding var showGenreSelection: Bool
    
    var body: some View {
        switch topRowSelection {
        case .home:
            HStack {
                Button(action: {
                    topRowSelection = .home
                }, label: {
                    Image("netflix_logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50)
                })
                .buttonStyle(PlainButtonStyle())
                
                Spacer()
                
                Button(action: {
                    topRowSelection = .tvShows
                }, label: {
                    Text("TV shows")
                })
                .buttonStyle(PlainButtonStyle())
                
                Spacer()
                
                Button(action: {
                    topRowSelection = .movies
                }, label: {
                    Text("Movies")
                })
                .buttonStyle(PlainButtonStyle())
                
                Spacer()
                
                Button(action: {
                    topRowSelection = .myList
                }, label: {
                    Text("My List")
                })
                .buttonStyle(PlainButtonStyle())
            }
            .padding(.leading, 10)
            .padding(.trailing, 30)
        case .myList, .tvShows, .movies:
            HStack {
                Button(action: {
                    topRowSelection = .home
                }, label: {
                    Image("netflix_logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50)
                })
                .buttonStyle(PlainButtonStyle())
                
                HStack(spacing: 20) {
                    Button(action: {
                        showTopRowSelection.toggle()
                    }, label: {
                        HStack {
                            Text(topRowSelection.title)
                                .font(.system(size: 18))
                            
                            Image(systemName: "triangle.fill")
                                .font(.system(size: 10))
                                .rotationEffect(.init(degrees: 180))
                        }
                    })
                    .buttonStyle(PlainButtonStyle())
                    
                    Button(action: {
                        showGenreSelection.toggle()
                    }, label: {
                        HStack {
                            Text(homeGenre.title)
                                .font(.system(size: 12))
                            
                            Image(systemName: "triangle.fill")
                                .font(.system(size: 6))
                                .rotationEffect(.init(degrees: 180))
                        }
                    })
                    .buttonStyle(PlainButtonStyle())
                    
                    Spacer()
                }
            }
            .padding(.leading, 10)
            .padding(.trailing, 30)
        }
    }
}
