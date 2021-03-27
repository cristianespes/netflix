//
//  NotificationBar.swift
//  Netflix
//
//  Created by Cristian Espes on 27/3/21.
//

import SwiftUI

struct NotificationBar: View {
    
    @Binding var showNotificationList: Bool
    
    var body: some View {
        Button(action: {
            showNotificationList = true
        }, label: {
            HStack {
                Image(systemName: "bell")
                
                Text("Notifications") // TODO: Localizable
                    .fontWeight(.bold)
                
                Spacer()
                
                Image(systemName: "chevron.right")
            }
            .font(.system(size: 18, weight: .bold))
        })
        .foregroundColor(.white)
        .padding()
    }
}

#if DEBUG
struct NotificationBar_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            
            NotificationBar(showNotificationList: .constant(false))
        }
    }
}
#endif
