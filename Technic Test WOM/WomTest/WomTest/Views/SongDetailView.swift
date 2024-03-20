//
//  SongDetailView.swift
//  WomTest
//
//  Created by Max Tapia on 20-03-24.
//

import SwiftUI

struct SongDetailView: View {
    @StateObject private var viewModel = SongViewModel()
    var song: Song
    var body: some View {
        Text(song.title)
    }
}

#Preview {
    SongDetailView(song: Song(title: "Test song"))
}
