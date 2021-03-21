//
//  Trailer.swift
//  Netflix
//
//  Created by Cristian Espes on 21/3/21.
//

import Foundation

struct Trailer: Identifiable, Hashable {
    let id: String = UUID().uuidString
    let name: String
    let videoURL: URL
    let thumbnailImageURL: URL
}
