//
//  GlobalHelpers.swift
//  Netflix
//
//  Created by Cristian Espes on 20/3/21.
//

import Foundation
import SwiftUI

let exampleVideoURL: URL = URL(string: "https://www.radiantmediaplayer.com/media/big-buck-bunny-360p.mp4")!

let exampleImageURL: URL = URL(string: "https://picsum.photos/300/104")!
let exampleImageURL2: URL = URL(string: "https://picsum.photos/300/104")!
let exampleImageURL3: URL = URL(string: "https://picsum.photos/300/104")!

var randomExmpleImageURL: URL {
    return [exampleImageURL, exampleImageURL2, exampleImageURL3].randomElement() ?? exampleImageURL
}

let exampleTrailer1 = Trailer(name: "Season 3 Trailer", videoURL: exampleVideoURL, thumbnailImageURL: randomExmpleImageURL)

let exampleTrailer2 = Trailer(name: "The Her's Journey", videoURL: exampleVideoURL, thumbnailImageURL: randomExmpleImageURL)

let exampleTrailer3 = Trailer(name: "The Mysterious", videoURL: exampleVideoURL, thumbnailImageURL: randomExmpleImageURL)

let exampleTrailers = [exampleTrailer1, exampleTrailer2, exampleTrailer3]

let exampleMovie1 = Movie(
    id: UUID().uuidString,
    name: "Dark",
    thumbnailURL: URL(string: "https://picsum.photos/200/300")!,
    categories: ["Dystopian", "Exciting", "Suspenseful", "Sci-Fi TV"],
    year: 2020,
    rating: "TV-MA",
    numberOfSeasons: 1,
    currentEpisode: nil,
    defaultEpisodeInfo: exampleEpisodeInfo1,
    creators: "Baran bo Odan, Jantje Friese",
    cast: "Louis Hofmann, Oliver Masucci, Jordis Triebel",
    trailers: exampleTrailers,
    moreLikeThisMovies: [exampleMovie2, exampleMovie3, exampleMovie4, exampleMovie5, exampleMovie6, exampleMovie7],
    episodes: nil,
    promotionHeadline: nil
)

let exampleMovie2 = Movie(
    id: UUID().uuidString,
    name: "Travelers",
    thumbnailURL: URL(string: "https://picsum.photos/200/300/")!,
    categories: ["Dystopian", "Exciting", "Suspenseful", "Sci-Fi TV"],
    year: 2020,
    rating: "TV-MA",
    numberOfSeasons: 2,
    currentEpisode: nil,
    defaultEpisodeInfo: exampleEpisodeInfo1,
    creators: "Baran bo Odan, Jantje Friese",
    cast: "Louis Hofmann, Oliver Masucci, Jordis Triebel",
    trailers: exampleTrailers,
    moreLikeThisMovies: [],
    episodes: nil,
    promotionHeadline: "Best Rated Show"
)

let exampleMovie3 = Movie(
    id: UUID().uuidString,
    name: "Community",
    thumbnailURL: URL(string: "https://picsum.photos/200/301")!,
    categories: ["Dystopian", "Exciting", "Suspenseful", "Sci-Fi TV"],
    year: 2020,
    rating: "TV-MA",
    numberOfSeasons: 3,
    currentEpisode: nil,
    defaultEpisodeInfo: exampleEpisodeInfo1,
    creators: "Baran bo Odan, Jantje Friese",
    cast: "Louis Hofmann, Oliver Masucci, Jordis Triebel",
    trailers: exampleTrailers,
    moreLikeThisMovies: [],
    episodes: nil,
    promotionHeadline: nil
)

let exampleMovie4 = Movie(
    id: UUID().uuidString,
    name: "Alone",
    thumbnailURL: URL(string: "https://picsum.photos/200/302")!,
    categories: ["Dystopian", "Exciting", "Suspenseful", "Sci-Fi TV"],
    year: 2020,
    rating: "TV-MA",
    numberOfSeasons: 4,
    currentEpisode: nil,
    defaultEpisodeInfo: exampleEpisodeInfo1,
    creators: "Baran bo Odan, Jantje Friese",
    cast: "Louis Hofmann, Oliver Masucci, Jordis Triebel",
    trailers: exampleTrailers,
    moreLikeThisMovies: [],
    episodes: nil,
    promotionHeadline: "New episodes coming soon"
)

let exampleMovie5 = Movie(
    id: UUID().uuidString,
    name: "Hannibal",
    thumbnailURL: URL(string: "https://picsum.photos/200/303")!,
    categories: ["Dystopian", "Exciting", "Suspenseful", "Sci-Fi TV"],
    year: 2020,
    rating: "TV-MA",
    numberOfSeasons: 5,
    currentEpisode: nil,
    defaultEpisodeInfo: exampleEpisodeInfo1,
    creators: "Baran bo Odan, Jantje Friese",
    cast: "Louis Hofmann, Oliver Masucci, Jordis Triebel",
    trailers: exampleTrailers,
    moreLikeThisMovies: [],
    episodes: nil,
    promotionHeadline: nil
)

let exampleMovie6 = Movie(
    id: UUID().uuidString,
    name: "After Life",
    thumbnailURL: URL(string: "https://picsum.photos/200/304")!,
    categories: ["Dystopian", "Exciting", "Suspenseful", "Sci-Fi TV"],
    year: 2020,
    rating: "TV-MA",
    numberOfSeasons: 6,
    currentEpisode: nil,
    defaultEpisodeInfo: exampleEpisodeInfo1,
    creators: "Baran bo Odan, Jantje Friese",
    cast: "Louis Hofmann, Oliver Masucci, Jordis Triebel",
    trailers: exampleTrailers,
    moreLikeThisMovies: [],
    episodes: nil,
    promotionHeadline: "Watch Season 6 Now"
)

let exampleMovie7 = Movie(
    id: UUID().uuidString,
    name: "After Life",
    thumbnailURL: URL(string: "https://picsum.photos/200/304")!,
    categories: ["Dystopian", "Exciting", "Suspenseful", "Sci-Fi TV"],
    year: 2020,
    rating: "TV-MA",
    numberOfSeasons: 6,
    currentEpisode: nil,
    defaultEpisodeInfo: exampleEpisodeInfo1,
    creators: "Baran bo Odan, Jantje Friese",
    cast: "Louis Hofmann, Oliver Masucci, Jordis Triebel",
    trailers: exampleTrailers,
    moreLikeThisMovies: [],
    episodes: nil,
    promotionHeadline: "Watch Season 6 Now"
)

var exampleMovies: [Movie] {
    [exampleMovie1, exampleMovie2, exampleMovie3, exampleMovie4, exampleMovie5, exampleMovie6].shuffled()
}

let exampleEpisodeInfo1 = CurrentEpisodeInfo(
    episodeName: "Beginnings and Endings",
    description: "Six months after the disappearances, the police form a task foce. In 2052, Jonas learns that most of Winden perished in an apocalyptic event",
    season: 2,
    episode: 1
)

extension LinearGradient {
    static let blackOpacityGradient = LinearGradient(
        gradient: Gradient(colors: [Color.black.opacity(0), Color.black.opacity(0.95)]),
        startPoint: .top,
        endPoint: .bottom
    )
}

extension String {
    func widthString(usingFont font: UIFont) -> CGFloat {
        let fontAttributes = [NSAttributedString.Key.font: font]
        let size = self.size(withAttributes: fontAttributes)
        return size.width
    }
}
