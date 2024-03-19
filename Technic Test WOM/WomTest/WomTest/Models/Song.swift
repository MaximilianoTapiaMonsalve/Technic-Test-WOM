//
//  Song.swift
//  WomTest
//
//  Created by Max Tapia on 19-03-24.
//

import Foundation

struct Song: Identifiable {
    let id = UUID()
    let artistName: String
    let trackName: String
}

