//
//  HomeView.swift
//  Netflix
//
//  Created by Cristian Espes on 20/3/21.
//

import SwiftUI

struct HomeView: View {
    
    var vm: HomeViewModel = HomeViewModel()
    
    private let screen = UIScreen.main.bounds
    
    var body: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            
            ScrollView(.vertical, showsIndicators: false) {
                LazyVStack {
                    
                    TopMoviePreview(movie: exampleMovie1)
                        .frame(width: screen.width)
                        .padding(.top, -110)
                    
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
                                    ForEach(vm.getMovie(for: category)) { movie in
                                        StandardHomeMovie(movie: movie)
                                            .frame(width: 100, height: 200)
                                            .padding(.horizontal, 20)
                                    }
                                }
                            }
                        }
                    }
                }
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
