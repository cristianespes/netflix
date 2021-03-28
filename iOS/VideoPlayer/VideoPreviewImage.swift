//
//  VideoPreviewImage.swift
//  Netflix
//
//  Created by Cristian Espes on 21/3/21.
//

import SwiftUI
import Kingfisher

struct VideoPreviewImage: View {
    
    let imageURL: URL
    let videoURL: URL
    
    @State private var showingVideoPlayer: Bool = false
    
    var body: some View {
        ZStack {
            KFImage(imageURL)
                .resizable()
                .aspectRatio(contentMode: .fill)
            
            Button(action: {
                showingVideoPlayer.toggle()
            }, label: {
                Image(systemName: "play.circle")
                    .foregroundColor(.white)
                    .font(.system(size: 40))
            })
            .fullScreenCover(isPresented: $showingVideoPlayer, content: {
                SwiftUIVideoView(url: videoURL)
                    .edgesIgnoringSafeArea(.all)
            })
        }
    }
}

#if DEBUG
struct VideoPreviewImage_Previews: PreviewProvider {
    static var previews: some View {
        VideoPreviewImage(imageURL: exampleImageURL, videoURL: exampleVideoURL)
    }
}
#endif
