//
//  SwiftUIVideoView.swift
//  Netflix
//
//  Created by Cristian Espes on 21/3/21.
//

import SwiftUI
import AVKit

struct SwiftUIVideoView: View {
    
    let url: URL
    
    private var player: AVPlayer {
        AVPlayer(url: url)
    }
    
    var body: some View {
        VideoPlayer(player: player)
    }
}

#if DEBUG
struct SwiftUIVideoView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIVideoView(url: exampleVideoURL)
    }
}
#endif
