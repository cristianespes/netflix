//
//  HomeStack.swift
//  Netflix
//
//  Created by Cristian Espes on 21/3/21.
//

import SwiftUI

struct HomeStack: View {
    
    let vm: HomeViewModel
    
    let topRowSelection: HomeTopRow
    let topGenreSelection: HomeGenre
    
    @Binding var movieDetailToShow: Movie?
    
    var body: some View {
        ForEach(vm.allCategories, id: \.self) { category in
            VStack {
                HStack {
                    Text(vm.getCategoryTitle(for: category))
                        .font(.title3)
                        .fontWeight(.bold)
                    Spacer()
                }
                
                ScrollView(.horizontal, showsIndicators: false) {
                    LazyHStack {
                        ForEach(vm.getMovie(for: category, and: topRowSelection, and: topGenreSelection), id: \.id) { movie in
                            StandardHomeMovie(movie: movie)
                                .frame(width: 100, height: 200)
                                .padding(.horizontal, 20)
                                .onTapGesture {
                                    movieDetailToShow = movie
                                }
                        }
                    }
                }
            }
        }
    }
}

#if DEBUG
struct HomeStack_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            
            ScrollView(.vertical, showsIndicators: false) {
                HomeStack(vm: HomeViewModel(), topRowSelection: .home, topGenreSelection: .allGenres, movieDetailToShow: .constant(nil))
            }
            .foregroundColor(.white)
        }
    }
}
#endif
