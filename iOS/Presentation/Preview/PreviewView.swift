//
//  PreviewView.swift
//  Netflix
//
//  Created by Cristian Espes on 31/3/21.
//

import SwiftUI

struct PreviewView: View {
    
    @ObservedObject var vm: PreviewViewModel
    
    let playVideo: Bool
    
    var body: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            
            TrailerPlayerView(videoURL: vm.movie.trailers.first?.videoURL,
                              playVideo: .constant(playVideo))
            
            VStack {
                HStack {
                    VStack(alignment: .leading, spacing: 0) {
                        Text(vm.movie.name)
                            .fontWeight(.bold)
                            .font(.largeTitle)
                    }
                    
                    Spacer()
                }
                .padding(.horizontal, 20)
                .padding(.top, 60)
                
                Spacer()
                
                HStack {
                    ForEach(0..<vm.movie.categories.count, id: \.self) { catIndex in
                        let category = vm.movie.categories[catIndex]
                        
                        HStack {
                            Text(category)
                                .font(.footnote)
                            
                            if catIndex != vm.movie.categories.count - 1 {
                                Image(systemName: "circle.fill")
                                    .font(.system(size: 3))
                            }
                        }
                    }
                }
                
                HStack {
                    Spacer()
                    
                    SmallVerticalButton(text: "My List", // TODO: Localizable
                                        isOnImage: "checkmark",
                                        isOffImage: "plus",
                                        color: vm.movie.accentColor,
                                        isOn: true,
                                        action: {})
                    
                    Spacer()
                    
                    Button(action: {}, label: {
                        HStack {
                            Image(systemName: "arrowtriangle.right.fill")
                            Text("PLAY") // TODO: Localizable
                                .fontWeight(.heavy)
                        }
                        .padding(.vertical, 12)
                        .padding(.horizontal, 26)
                        .border(vm.movie.accentColor, width: 3)
                    })
                    
                    Spacer()
                    
                    SmallVerticalButton(text: "Info", // TODO: Localizable
                                        isOnImage: "info.circle",
                                        isOffImage: "info.circle",
                                        color: vm.movie.accentColor,
                                        isOn: true,
                                        action: {})
                    
                    Spacer()
                }
                .padding(.vertical, 14)
            }
            .padding(.bottom, 48)
            .foregroundColor(vm.movie.accentColor)
        }
        .edgesIgnoringSafeArea(.vertical)
    }
}

#if DEBUG
struct PreviewView_Previews: PreviewProvider {
    static var previews: some View {
        PreviewView(vm: PreviewViewModel(movie: exampleMovie1), playVideo: true)
    }
}
#endif
