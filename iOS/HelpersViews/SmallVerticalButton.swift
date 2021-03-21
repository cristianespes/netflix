//
//  SmallVerticalButton.swift
//  Netflix
//
//  Created by Cristian Espes on 20/3/21.
//

import SwiftUI

struct SmallVerticalButton: View {
    
    let text: String
    
    let isOnImage: String
    let isOffImage: String
    
    var isOn: Bool
    
    let action: () -> Void
    
    private var imageName: String {
        if isOn {
            return isOnImage
        } else {
            return isOffImage
        }
    }
    
    
    
    var body: some View {
        Button(action: action, label: {
            VStack {
                Image(systemName: imageName)
                    .foregroundColor(.white)
                
                Text(text)
                    .foregroundColor(.white)
                    .font(.system(size: 14))
                    .fontWeight(.bold)
            }
        })
    }
}

#if DEBUG
struct SmallVerticalButton_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            
            SmallVerticalButton(text: "My List",
                                isOnImage: "checkmark",
                                isOffImage: "plus",
                                isOn: true,
                                action: { print("Tapped") })
        }
    }
}
#endif
