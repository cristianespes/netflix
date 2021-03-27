//
//  ComingSoonViewModel.swift
//  Netflix
//
//  Created by Cristian Espes on 27/3/21.
//

import Foundation

final class ComingSoonViewModel: ObservableObject {
    
    @Published var movies: [Movie] = []
    
    init() {
        movies = generateMovies(20)
    }
    
}
