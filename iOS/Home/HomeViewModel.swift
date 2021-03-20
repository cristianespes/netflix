//
//  HomeVM.swift
//  Netflix
//
//  Created by Cristian Espes on 20/3/21.
//

import Foundation

final class HomeViewModel: ObservableObject {
    
    // MARK: - Categories at Home
    enum Category: Int, CaseIterable {
        case trendingNow = 0
        case standUpComedy
        case newReleases
        case watchItAgain
        case sciFiMovies
    }
    
    // MARK: - Properties
    @Published var movies: [Category: [Movie]] = [:]
    
    var allCategories: [Category] {
        movies.keys.sorted(by: { $0.rawValue < $1.rawValue })
    }
    
    // MARK: - Life Cycle
    init() {
        setupMovies()
    }
    
}

// MARK: - Public methods
extension HomeViewModel {
    func getMovie(for category: Category) -> [Movie] {
        movies[category] ?? []
    }
    
    func getCategoryTitle(for category: Category) -> String {
        // TODO: Localizable
        switch category {
        case .trendingNow:
            return "Trending Now"
        case .standUpComedy:
            return "Stand-Up Comedy"
        case .newReleases:
            return "New Releases"
        case .watchItAgain:
            return "Watch It Again"
        case .sciFiMovies:
            return "Sci-Fi Movies"
        }
    }
}

// MARK: - Private methods
private extension HomeViewModel {
    func setupMovies() {
        movies[.trendingNow] = exampleMovies
        movies[.standUpComedy] = exampleMovies.shuffled()
        movies[.newReleases] = exampleMovies.shuffled()
        movies[.watchItAgain] = exampleMovies.shuffled()
        movies[.sciFiMovies] = exampleMovies.shuffled()
    }
}
