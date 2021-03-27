//
//  SearchBar.swift
//  Netflix
//
//  Created by Cristian Espes on 22/3/21.
//

import SwiftUI

struct SearchBar: View {
    
    @Binding var text: String
    @State private var isEditing: Bool = false
    @Binding var isLoading: Bool
    
    var body: some View {
        HStack(spacing: 18) {
            HStack(spacing: 8) {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(Color.graySearchText)
                    .padding(.leading, 10)
                
                ZStack(alignment: .leading) {
                    TextField("", text: $text)
                        .padding(.vertical, 7)
                        .background(Color.graySearchBackground)
                        .cornerRadius(8)
                        .foregroundColor(.white)
                        
                    if text.isEmpty == true { Text("Search").foregroundColor(.graySearchText) } // TODO: Localizable
                }
                .onTapGesture(perform: {
                    isEditing = true
                })
                
                if text.isEmpty == false {
                    if isLoading {
                        ProgressView()
                            .progressViewStyle(CircularProgressViewStyle(tint: Color.white))
                            .frame(width: 35, height: 35)
                            .padding(.trailing, 10)
                    } else {
                        Button(action: {
                            text = ""
                        }, label: {
                            Image(systemName: "xmark.circle.fill")
                                .foregroundColor(.graySearchText)
                                .frame(width: 35, height: 35)
                        })
                        .padding(.trailing, 10)
                    }
                }
            }
            .background(
                Color.graySearchBackground
                    .frame(height: 36)
                    .cornerRadius(8)
            )
            .animation(.default)
            
            if isEditing {
                Button(action: {
                    text = ""
                    isEditing = false
                    hideKeyboard()
                }, label: {
                    Text("Cancel") // TODO: Localizable
                        .foregroundColor(.white)
                })
                .transition(.move(edge: .trailing))
                .animation(.default)
            }
        }
    }
}

#if DEBUG
struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            
            SearchBar(text: .constant(""), isLoading: .constant(false))
                .padding()
        }
    }
}
#endif
