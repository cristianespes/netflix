//
//  ContentView.swift
//  Shared
//
//  Created by Cristian Espes on 20/3/21.
//

import SwiftUI

enum Tab: Int, CaseIterable {
    case home = 0
    case search
    case comingSoon
    case downloads
    case more
    
    var title: String {
        switch self {
        case .home:
            return "Home" // TODO: Localizable
        case .search:
            return "Search" // TODO: Localizable
        case .comingSoon:
            return "Coming Soon" // TODO: Localizable
        case .downloads:
            return "Downloads" // TODO: Localizable
        case .more:
            return "More" // TODO: Localizable
        }
    }
}

struct ContentView: View {
    
    @State private var tab: Tab = .home
    
    init() {
        UITabBar.appearance().isTranslucent = false
        UITabBar.appearance().barTintColor = UIColor.black
    }
    
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Image(systemName: "house")
                    Text(Tab.home.title)
                }
                .tag(Tab.home)
            
            SearchView()
                .tabItem {
                    Image(systemName: "magnifyingglass")
                    Text(Tab.search.title)
                }
                .tag(Tab.search)
            
            Text(Tab.comingSoon.title)
                .tabItem {
                    Image(systemName: "play.rectangle")
                    Text(Tab.comingSoon.title)
                }
                .tag(Tab.comingSoon)
            
            Text(Tab.downloads.title)
                .tabItem {
                    Image(systemName: "arrow.down.to.line.alt")
                    Text(Tab.downloads.title)
                }
                .tag(Tab.downloads)
            
            Text(Tab.more.title)
                .tabItem {
                    Image(systemName: "equal")
                    Text(Tab.more.title)
                }
                .tag(Tab.more)
        }
        .accentColor(.white)
    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
