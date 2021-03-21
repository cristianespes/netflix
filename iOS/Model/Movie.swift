//
//  Movie.swift
//  Netflix
//
//  Created by Cristian Espes on 20/3/21.
//

import Foundation

struct Movie: Identifiable {
    
    let id: String
    let name: String
    let thumbnailURL: URL
    let categories: [String]
    
    // Movie Detail View
    let year: Int
    let rating: String
    let numberOfSeasons: Int?
    
    // Personalization
    let currentEpisode: CurrentEpisodeInfo?
    let defaultEpisodeInfo: CurrentEpisodeInfo
    let creators: String
    let cast: String
    
    let trailers: [Trailer]
    
    let moreLikeThisMovies: [Movie]
    
    let episodes: [Episode]?
    
    let promotionHeadline: String?
    
    var numberOfSeasonsDisplay: String {
        if let num = numberOfSeasons {
            if num == 1 {
                return "1 season" // TODO: Localizable
            } else {
                return "\(num) seasons" // TODO: Localizable
            }
        }
        
        return ""
    }
    
    var episodeInfoDisplay: String {
        if let current = currentEpisode {
            return "S\(current.season):E\(current.episode) \(current.episodeName)" // TODO: Localizable
        } else {
            return "S\(defaultEpisodeInfo.season):E\(defaultEpisodeInfo.episode) \(defaultEpisodeInfo.episodeName)"
        }
    }
    
    var episodeDescriptionDisplay: String {
        if let current = currentEpisode {
            return current.description
        } else {
            return defaultEpisodeInfo.description
        }
    }
}

struct CurrentEpisodeInfo: Hashable, Equatable {
    let episodeName: String
    let description: String
    let season: Int
    let episode: Int
}
