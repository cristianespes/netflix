//
//  SearchView.swift
//  Netflix
//
//  Created by Cristian Espes on 25/3/21.
//

import SwiftUI

struct SearchView: View {
    
    @ObservedObject var vm: SearchViewModel = SearchViewModel()
    @State private var searchText: String = ""
    @State private var movieDetailToShow: Movie? = nil
    
    var body: some View {
        
        let searchTextBinding = Binding {
            return searchText
        } set: {
            searchText = $0
            vm.updateSearchText(with: $0)
        }
        
        return ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                SearchBar(text: searchTextBinding, isLoading: $vm.isLoading)
                    .padding()
                
                ScrollView {
                    if vm.isShowingPopularMovies {
                        PopularList(movies: vm.popularMovies,
                                    movieDetailToShow: $movieDetailToShow)
                    }
                    
                    if vm.viewState == .empty {
                        Text("Your search did not have any results.") // TODO: Localizable
                            .fontWeight(.bold)
                            .padding(.top, 150)
                    } else if vm.viewState == .ready && !vm.isShowingPopularMovies {
                        VStack {
                            HStack {
                                Text("Movies & TV") // TODO: Localizable
                                    .fontWeight(.bold)
                                    .font(.title3)
                                    .padding(.leading, 12)
                                
                                Spacer()
                            }
                            
                            SearchResultGrid(movies: vm.searchResults, movieDetailToShow: $movieDetailToShow)
                        }
                    }
                }
            }
            
            if let movie = movieDetailToShow {
                MovieDetail(movie: movie, movieDetailToShow: $movieDetailToShow)
                    .animation(.easeIn)
                    .transition(.opacity)
            }
        }
        .foregroundColor(.white)
    }
}

#if DEBUG
struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
#endif

struct PopularList: View {
    
    let movies: [Movie]
    @Binding var movieDetailToShow: Movie?
    
    var body: some View {
        VStack {
            HStack {
                Text("Popular Searches") // TODO: Locablizable
                    .fontWeight(.bold)
                    .font(.title3)
                    .padding(.leading, 12)
                
                Spacer()
            }
            
            LazyVStack {
                ForEach(movies, id: \.id) { movie in
                    PopularMovieView(movie: movie, movieDetailToShow: $movieDetailToShow)
                        .frame(height: 75)
                }
            }
        }
    }
}
