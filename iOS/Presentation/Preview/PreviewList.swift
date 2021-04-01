//
//  PreviewList.swift
//  Netflix
//
//  Created by Cristian Espes on 31/3/21.
//

import SwiftUI

struct PreviewList: View {
    
    let movies: [Movie]
    
    @Binding var currentSelection: Int
    @Binding var isVisible: Bool
    
    @State var currentTranslation: CGFloat = 0
    
    let externalDragGesture: _EndedGesture<_ChangedGesture<DragGesture>>
    
    private let screen = UIScreen.main.bounds
    
    var body: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            
            PagerView(pageCount: movies.count,
                      currentIndex: $currentSelection,
                      translation: $currentTranslation,
                      externalDragGesture: externalDragGesture) {
                ForEach(0..<movies.count) { movieIndex in
                    let movie = movies[movieIndex]
                    
                    PreviewView(vm: PreviewViewModel(movie: movie),
                                playVideo: shouldPlayVideo(index: movieIndex))
                        .frame(width: screen.width)
                }
            }
            .frame(width: screen.width)
        }
    }
    
    private func shouldPlayVideo(index: Int) -> Bool {
        if isVisible == false {
            return false
        }
        
        if index != currentSelection {
            return false
        }
        
        return true
    }
}

//private struct ExamplePreviewList: View {
//    @State private var currentSelection = 0
//    @State private var isVisible = true
//    let externalDragGesture: _EndedGesture<_ChangedGesture<DragGesture>>
//    
//    var body: some View {
//        PreviewList(movies: exampleMovies,
//                    currentSelection: $currentSelection,
//                    isVisible: $isVisible,
//                    externalDragGesture: externalDragGesture)
//    }
//}
//
//#if DEBUG
//struct PreviewList_Previews: PreviewProvider {
//    static var previews: some View {
//        ExamplePreviewList()
//    }
//}
//#endif
