//
//  Episode.swift
//  Netflix
//
//  Created by Cristian Espes on 20/3/21.
//

import Foundation

struct Episode: Identifiable {
    let id: String = UUID().uuidString
    
    let name: String
    let season: Int
    let thumbnailImageURLString: String
    let description: String
    let length: Int
    
    var thumbnailURL: URL {
        URL(string: thumbnailImageURLString)!
    }
}
