//
//  CustomTabSwitcher.swift
//  Netflix
//
//  Created by Cristian Espes on 20/3/21.
//

import SwiftUI

enum CustomTab: Int {
    case episodes = 0
    case trailers
    case more
    
    var title: String {
        switch self {
        case .episodes:
            return "EPISODES" // TODO: Localizable
        case .trailers:
            return "TRAILERS & MORE" // TODO: Localizable
        case .more:
            return "MORE LIKE THIS" // TODO: Localizable
        }
    }
}

struct CustomTabSwitcher: View {
    
    @State private var currenTab: CustomTab = .episodes
    
    let tabs: [CustomTab]
    let movie: Movie
    
    @Binding var showSeasonPicker: Bool
    @Binding var selectedSeason: Int
    
    var body: some View {
        VStack(spacing: 16) {
            
            // Scrollable tab picker
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 20) {
                    ForEach(tabs, id: \.self) { tab in
                        VStack(spacing: 4) {
                            // Red bar
                            Rectangle()
                                .foregroundColor(currenTab == tab ? .red : .clear)
                            
                            // Button
                            Button(action: {
                                currenTab = tab
                            }, label: {
                                Text("\(tab.title)")
                                    .font(.system(size: 16, weight: .bold))
                                    .foregroundColor(currenTab == tab ? .white : .gray)
                            })
                            .buttonStyle(PlainButtonStyle())
                        }
                        .frame(width: widthForTab(tab), height: 30)
                    }
                }
            }
            
            // Selected View
            switch currenTab {
            case .episodes:
                EpisodesView(episodes: movie.episodes ?? [],
                             showSeasonPicker: $showSeasonPicker,
                             selectedSeason: $selectedSeason)
            case .trailers:
                TrailerList(trailers: movie.trailers)
            case .more:
                MoreLikeThis(movies: movie.moreLikeThisMovies)
            }
            
        }
        .foregroundColor(.white)
    }
    
    private func widthForTab(_ tab: CustomTab) -> CGFloat {
        let string = tab.title
        return string.widthString(usingFont: .systemFont(ofSize: 16, weight: .bold))
    }
}

#if DEBUG
struct CustomTabSwitcher_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            
            CustomTabSwitcher(tabs: [.episodes, .trailers, .more], movie: exampleMovie1, showSeasonPicker: .constant(false), selectedSeason: .constant(1))
        }
    }
}
#endif
