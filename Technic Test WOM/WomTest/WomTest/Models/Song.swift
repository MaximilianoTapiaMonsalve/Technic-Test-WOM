//
//  SongModel.swift
//  WomTest
//
//  Created by Max Tapia on 19-03-24.
//

import Foundation

class Song: Identifiable, Hashable, ObservableObject{
    let id ,name,title,artist,realeseDate: String
    let image: [IMImage]
    let price: String
    @Published var isfav: Bool = false
    
    
    init(id: String ,name: String, title: String, artist: String, realeseDate: String, image: [IMImage], price: String) {
        self.id = id
        self.name = name
        self.title = title
        self.artist = artist
        self.realeseDate = realeseDate
        self.image = image
        self.price = price
    }
    
    func hash(into hasher: inout Hasher) {
            hasher.combine(id)
        }

        static func == (lhs: Song, rhs: Song) -> Bool {
            return lhs.id == rhs.id
        }
}

