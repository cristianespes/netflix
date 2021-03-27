//
//  SearchViewModel.swift
//  Netflix
//
//  Created by Cristian Espes on 25/3/21.
//

import Foundation

final class SearchViewModel: ObservableObject {
    
    enum ViewState {
        case empty
        case loading
        case ready
        case error
    }
    
    @Published var isLoading: Bool = false
    
    @Published var viewState: ViewState = .ready
    
    @Published var popularMovies: [Movie] = []
    @Published var searchResults: [Movie] = []
    
    @Published var isShowingPopularMovies = true
    
    init() {
        getPopularMovies()
    }
    
    func updateSearchText(with text: String) {
        setViewState(to: .loading)
        
        if text.count > 0 {
            isShowingPopularMovies = false
            getSearchResults(for: text)
        } else {
            isShowingPopularMovies = true
        }
    }
    
}

private extension SearchViewModel {
    
    func setViewState(to state: ViewState) {
        DispatchQueue.main.async {
            self.viewState = state
            self.isLoading = state == .loading
        }
    }
    
    func getPopularMovies() {
        popularMovies = generateMovies(40)
    }
    
    func getSearchResults(for text: String) {
        
        let haveResult = Int.random(in: 0...3)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) { [weak self] in
            if haveResult == 0 {
                // empty view
                self?.searchResults = []
                self?.setViewState(to: .empty)
            } else {
                // ready view
                let movies = generateMovies(21)
                self?.searchResults = movies
                self?.setViewState(to: .ready)
            }
        }
    }
}
