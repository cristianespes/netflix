//
//  TrailerList.swift
//  Netflix
//
//  Created by Cristian Espes on 21/3/21.
//

import SwiftUI

struct TrailerList: View {
    
    let trailers: [Trailer]
    
    let screen = UIScreen.main.bounds
    
    var body: some View {
        VStack {
            ForEach(trailers) { trailer in
                VStack(alignment: .leading, spacing: 8) {
                    VideoPreviewImage(imageURL: trailer.thumbnailImageURL, videoURL: trailer.videoURL)
                        .frame(maxWidth: screen.width)
                    
                    Text(trailer.name)
                        .font(.headline)
                        .padding(.horizontal)
                }
                .foregroundColor(.white)
                .padding(.bottom, 10)
            }
        }
    }
}

#if DEBUG
struct TrailerList_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            
            TrailerList(trailers: exampleTrailers)
        }
    }
}
#endif
