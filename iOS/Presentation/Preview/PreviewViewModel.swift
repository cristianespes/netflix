//
//  PreviewViewModel.swift
//  Netflix
//
//  Created by Cristian Espes on 31/3/21.
//

import Foundation

final class PreviewViewModel: ObservableObject {
    
    let movie: Movie
    
    init(movie: Movie) {
        self.movie = movie
    }
    
}
