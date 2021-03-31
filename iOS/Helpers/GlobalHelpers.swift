//
//  GlobalHelpers.swift
//  Netflix
//
//  Created by Cristian Espes on 20/3/21.
//

import Foundation
import SwiftUI

let exampleVideoURL: URL = URL(string: "https://www.radiantmediaplayer.com/media/nasa-v2/top-17-338p.mp4")!

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

let episode1 = Episode(name: "Beginnings and Endings",
                       season: 1,
                       episodeNumber: 1,
                       thumbnailImageURLString: "https://picsum.photos/300/102",
                       description: "Six months after the disappearances, the police form a task foce. In 2052, Jonas learns that most of Winden perished in an apocalyptic event",
                       length: 53,
                       videoURL: exampleVideoURL)

let episode2 = Episode(name: "Dark Matter",
                       season: 1,
                       episodeNumber: 2,
                       thumbnailImageURLString: "https://picsum.photos/300/102",
                       description: "Clausen and Charlotte interview Regina. The Stranger takes Hannah to 1987, where Claudia has an unnerving encounter and Egon visits an old nemesis.",
                       length: 54,
                       videoURL: exampleVideoURL)

let episode3 = Episode(name: "Ghosts",
                       season: 1,
                       episodeNumber: 3,
                       thumbnailImageURLString: "https://picsum.photos/300/102",
                       description: "In 1954, a missing Helge returns, but he'll only speak to Noah. In 1987, Claudia brings the time machine to Tannhaus, and Egon questions Ulrich again.",
                       length: 56,
                       videoURL: exampleVideoURL)

let episode4 = Episode(name: "Beginnings and Endings",
                       season: 2,
                       episodeNumber: 1,
                       thumbnailImageURLString: "https://picsum.photos/300/102",
                       description: "Six months after the disappearances, the police form a task foce. In 2052, Jonas learns that most of Winden perished in an apocalyptic event",
                       length: 53,
                       videoURL: exampleVideoURL)

let episode5 = Episode(name: "Dark Matter",
                       season: 2,
                       episodeNumber: 2,
                       thumbnailImageURLString: "https://picsum.photos/300/102",
                       description: "Clausen and Charlotte interview Regina. The Stranger takes Hannah to 1987, where Claudia has an unnerving encounter and Egon visits an old nemesis.",
                       length: 54,
                       videoURL: exampleVideoURL)

let episode6 = Episode(name: "Ghosts",
                       season: 2,
                       episodeNumber: 3,
                       thumbnailImageURLString: "https://picsum.photos/300/102",
                       description: "In 1954, a missing Helge returns, but he'll only speak to Noah. In 1987, Claudia brings the time machine to Tannhaus, and Egon questions Ulrich again.",
                       length: 56,
                       videoURL: exampleVideoURL)

let allExampleEpisodes = [episode1, episode2, episode3, episode4, episode5, episode6]

let exampleMovie1 = Movie(
    id: UUID().uuidString,
    name: "Dark",
    thumbnailURL: URL(string: "https://picsum.photos/200/300")!,
    categories: ["Dystopian", "Exciting", "Suspenseful", "Sci-Fi TV"],
    previewImageName: "darkPreview",
    previewVideoURL: exampleVideoURL,
    year: 2020,
    rating: "TV-MA",
    numberOfSeasons: 2,
    currentEpisode: nil,
    defaultEpisodeInfo: exampleEpisodeInfo1,
    creators: "Baran bo Odan, Jantje Friese",
    cast: "Louis Hofmann, Oliver Masucci, Jordis Triebel",
    trailers: exampleTrailers,
    moreLikeThisMovies: [exampleMovie2, exampleMovie3, exampleMovie4, exampleMovie5, exampleMovie6, exampleMovie7],
    episodes: allExampleEpisodes,
    promotionHeadline: nil
)

let exampleMovie2 = Movie(
    id: UUID().uuidString,
    name: "Travelers",
    thumbnailURL: URL(string: "https://picsum.photos/200/300/")!,
    categories: ["Dystopian", "Exciting", "Suspenseful", "Sci-Fi TV"],
    previewImageName: "ozarkPreview",
    previewVideoURL: exampleVideoURL,
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
    previewImageName: "dirtyJohnPreview",
    previewVideoURL: exampleVideoURL,
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
    previewImageName: "travelersPreview",
    previewVideoURL: exampleVideoURL,
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
    previewImageName: "arrestedDevPreview",
    previewVideoURL: exampleVideoURL,
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
    previewImageName: "whiteLinesPreview",
    previewVideoURL: exampleVideoURL,
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
    previewImageName: "ozarkPreview",
    previewVideoURL: exampleVideoURL,
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
    [exampleMovie1, exampleMovie2, exampleMovie3, exampleMovie4, exampleMovie5, exampleMovie6]//.shuffled()
}

let exampleEpisodeInfo1 = CurrentEpisodeInfo(
    episodeName: "Beginnings and Endings",
    description: "Six months after the disappearances, the police form a task foce. In 2052, Jonas learns that most of Winden perished in an apocalyptic event",
    season: 2,
    episode: 1
)

var randomColorForMovie: Color {
    let colors: [Color] = [.yellow, .gray, .pink, .red, .blue, .green, .orange]
    return colors.randomElement() ?? .white
}

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

extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
    
    /// Hide or show the view based on a boolean value.
    ///
    /// Example for visibility:
    /// ```
    /// Text("Label")
    ///     .isHidden(true)
    /// ```
    ///
    /// Example for complete removal:
    /// ```
    /// Text("Label")
    ///     .isHidden(true, remove: true)
    /// ```
    ///
    /// - Parameters:
    ///   - hidden: Set to `false` to show the view. Set to `true` to hide the view.
    ///   - remove: Boolean value indicating whether or not to remove the view.
    @ViewBuilder func isHidden(_ hidden: Bool, remove: Bool = false) -> some View {
        if hidden {
            if !remove {
                self.hidden()
            }
        } else {
            self
        }
    }
}
