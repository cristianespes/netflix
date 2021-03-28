//
//  DownloadsView.swift
//  Netflix
//
//  Created by Cristian Espes on 28/3/21.
//

import SwiftUI

struct DownloadsView: View {
    var body: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                HStack {
                    Image(systemName: "info.circle")
                    
                    Text("Smart Downloads") // TODO: Localizable
                    
                    Text("ON") // TODO: Localizable
                        .foregroundColor(.blue)
                    
                    Spacer()
                }
                .padding()
                .font(.system(size: 18, weight: .bold))
                
                ZStack {
                    Circle()
                        .foregroundColor(.graySearchBackground)
                        .padding(.horizontal, 100)
                    
                    Image(systemName: "arrow.down.to.line.alt")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 75)
                        .foregroundColor(.gray)
                }
                .frame(height: 275)
                .padding(.top, 75)
                .opacity(0.6)
                
                VStack(spacing: 20) {
                    Text("Never be without Netflix") // TODO: Localizable
                        .font(.title2)
                        .fontWeight(.bold)
                    
                    Text("Download shows and movies so you'll never be without something to watch\n-- even when you're offline") // TODO: Localizable
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 50)
                    
                    Button(action: {
                        // Show shows that can be downloaded
                    }, label: {
                        Text("See Waht You Can Download") // TODO: Localizable
                            .foregroundColor(.black)
                            .fontWeight(.bold)
                            .padding()
                            .background(Color.white)
                    })
                    
                }
                
                Spacer()
            }
            .foregroundColor(.white)
        }
    }
}

#if DEBUG
struct DownloadsView_Previews: PreviewProvider {
    static var previews: some View {
        DownloadsView()
    }
}
#endif
