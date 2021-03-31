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
    @State private var previewStartingIndex: Int = 0
    @State private var showPreviewFullScreen: Bool = false
    @State private var previewCurrentPosition: CGFloat = UIScreen.main.bounds.height + 20
    
    private let screen = UIScreen.main.bounds
    
    init() {
        UITabBar.appearance().isTranslucent = false
        UITabBar.appearance().barTintColor = UIColor.black
    }
    
    var body: some View {
        ZStack {
            TabView {
                HomeView(previewStartingIndex: $previewStartingIndex,
                         showPreviewFullScreen: $showPreviewFullScreen)
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
                
                ComingSoon()
                    .tabItem {
                        Image(systemName: "play.rectangle")
                        Text(Tab.comingSoon.title)
                    }
                    .tag(Tab.comingSoon)
                
                DownloadsView()
                    .tabItem {
                        Image(systemName: "arrow.down.to.line.alt")
                        Text(Tab.downloads.title)
                    }
                    .tag(Tab.downloads)
                
                /*Text(Tab.more.title)
                    .tabItem {
                        Image(systemName: "equal")
                        Text(Tab.more.title)
                    }
                    .tag(Tab.more)*/
            }
            .accentColor(.white)
            
            PreviewList(movies: exampleMovies,
                        currentSelection: $previewStartingIndex,
                        isVisible: $showPreviewFullScreen)
                .offset(y: previewCurrentPosition)
                .isHidden(!showPreviewFullScreen)
                .animation(.easeIn)
                .transition(.move(edge: .bottom))
        }
        .onChange(of: showPreviewFullScreen, perform: { value in
            if value {
                // show full screen
                withAnimation {
                    previewCurrentPosition = .zero
                }
            } else {
                // hidding
                withAnimation {
                    previewCurrentPosition = screen.height + 20
                }
            }
        })
    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
