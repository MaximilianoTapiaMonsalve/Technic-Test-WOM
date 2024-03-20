//
//  SongModel.swift
//  WomTest
//
//  Created by Max Tapia on 19-03-24.
//

import Foundation

struct Song: Identifiable,Hashable{
    let id = UUID()
    let title: String
    
    func hash(into hasher: inout Hasher) {
            hasher.combine(id)
        }

        static func == (lhs: Song, rhs: Song) -> Bool {
            return lhs.id == rhs.id
        }
}
