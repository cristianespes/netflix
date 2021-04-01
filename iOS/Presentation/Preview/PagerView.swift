//
//  PagerView.swift
//  Netflix
//
//  Created by Cristian Espes on 28/3/21.
//

import SwiftUI

struct PagerView<Content: View>: View {
    
    let pageCount: Int
    @Binding var currentIndex: Int
    @Binding var translation: CGFloat
    
    @State private var verticalDragIsActive: Bool = false
    
    let externalDragGesture: _EndedGesture<_ChangedGesture<DragGesture>>
    
    let content: Content
    
    init(pageCount: Int, currentIndex: Binding<Int>, translation: Binding<CGFloat>, externalDragGesture: _EndedGesture<_ChangedGesture<DragGesture>>, @ViewBuilder content: () -> Content) {
        self.pageCount = pageCount
        self._currentIndex = currentIndex
        self._translation = translation
        self.externalDragGesture = externalDragGesture
        self.content = content()
    }
    
    var body: some View {
        GeometryReader { geo in
            LazyHStack(spacing: 0) {
                content
                    .frame(width: geo.size.width)
            }
            .frame(width: geo.size.width, alignment: .leading)
            .offset(x: -CGFloat(currentIndex) * geo.size.width)
            .offset(x: translation)
            .animation(.interactiveSpring())
            .gesture(
                externalDragGesture.simultaneously(with:
                    DragGesture(minimumDistance: 20)
                        .onChanged({ (value) in
                            
                            if verticalDragIsActive {
                                return
                            }
                            
                            if abs(value.translation.width) < abs(value.translation.height) {
                                verticalDragIsActive = true
                                return
                            }
                            
                            // Horizontal Drag only
                            translation = value.translation.width
                        })
                        .onEnded({ (value) in
                            
                            if verticalDragIsActive {
                                verticalDragIsActive = false
                                return
                            }
                            
                            let offset = value.translation.width / geo.size.width
                            let newIndex = (CGFloat(currentIndex) - offset).rounded()
                            currentIndex = min(max(Int(newIndex), 0), pageCount - 1)
                            translation = 0
                        })
                )
            )
        }
    }
}

//private struct PagerDummy: View {
//    @State private var currentIndex: Int = 0
//    @State private var translation: CGFloat = .zero
//
//    var body: some View {
//        PagerView(pageCount: 3, currentIndex: $currentIndex, translation: $translation) {
//            Color.red
//            Color.blue
//            Color.black
//        }
//    }
//}
//
//#if DEBUG
//struct PagerView_Previews: PreviewProvider {
//    static var previews: some View {
//        PagerDummy()
//    }
//}
//#endif
