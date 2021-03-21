//
//  EpisodesView.swift
//  Netflix
//
//  Created by Cristian Espes on 21/3/21.
//

import SwiftUI

struct EpisodesView: View {
    
    let episodes: [Episode]
    
    @Binding var showSeasonPicker: Bool
    @Binding var selectedSeason: Int
    
    var body: some View {
        VStack(spacing: 14) {
            // Season Picker
            HStack {
                Button(action: {
                    showSeasonPicker.toggle()
                }, label: {
                    Group {
                        Text("Season \(selectedSeason)") // TODO: Localizable
                        Image(systemName: "chevron.down")
                    }
                })
                
                Spacer()
            }
            
            // Episodes list
            ForEach(getEpisodes(for: selectedSeason)) { episode in
                VStack(alignment: .leading) {
                    // Preview Image
                    HStack {
                        VideoPreviewImage(imageURL: episode.thumbnailURL, videoURL: episode.videoURL)
                            .frame(width: 120, height: 70)
                            .clipped()
                        
                        VStack(alignment: .leading, spacing: 8) {
                            Text("\(episode.episodeNumber). \(episode.name)")
                            
                            Text("\(episode.length)m")
                                .font(.system(size: 12))
                                .foregroundColor(.gray)
                        }
                        
                        Spacer()
                        
                        Image(systemName: "arrow.down.to.line.alt")
                            .font(.system(size: 20))
                    }
                    
                    // Description
                    Text(episode.description)
                        .font(.system(size: 13))
                        .lineLimit(3)
                        .fixedSize(horizontal: false, vertical: true)
                }
                .padding(.bottom, 20)
            }
            
            Spacer()
        }
        .foregroundColor(.white)
    }
    
    private func getEpisodes(for season: Int) -> [Episode] {
        return episodes.filter({ $0.season == season })
    }
}

struct EpisodesView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            
            EpisodesView(episodes: allExampleEpisodes, showSeasonPicker: .constant(false), selectedSeason: .constant(1))
        }
    }
}
