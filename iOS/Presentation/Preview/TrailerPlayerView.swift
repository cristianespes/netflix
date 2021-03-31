//
//  TrailerPlayerView.swift
//  Netflix
//
//  Created by Cristian Espes on 31/3/21.
//

import SwiftUI
import VideoPlayer

struct TrailerPlayerView: View {
    
    let videoURL: URL?
    @Binding var playVideo: Bool
    
    var body: some View {
        if let videoURL = videoURL {
            VideoPlayer(url: videoURL, play: $playVideo)
                .scaledToFit()
        } else {
            Text("Could not load video") // TODO: Localizable
        }
    }
}

#if DEBUG
struct TrailerPlayerView_Previews: PreviewProvider {
    static var previews: some View {
        TrailerPlayerView(videoURL: exampleVideoURL, playVideo: .constant(true))
    }
}
#endif
