//
//  PlayButton.swift
//  Netflix
//
//  Created by Cristian Espes on 20/3/21.
//

import SwiftUI

struct PlayButton: View {
    
    let text: String
    let imageName: String
    var backgroundColor: Color = .white
    
    let action: () -> Void
    
    var body: some View {
        Button(action: action, label: {
            HStack {
                
                Spacer()
                
                Image(systemName: imageName)
                
                Text(text)
                    .fontWeight(.bold)
                    .font(.system(size: 16))
                
                Spacer()
            }
            .padding(.vertical, 6)
            .foregroundColor(backgroundColor == .white ? .black : .white)
            .background(backgroundColor)
            .cornerRadius(3)
        })
    }
}

#if DEBUG
struct WhiteButton_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            
            PlayButton(text: "Play",
                        imageName: "play.fill",
                        action: { print("Tapped") })
        }
    }
}
#endif
