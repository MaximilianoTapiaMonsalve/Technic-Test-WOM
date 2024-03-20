//
//  ContentView.swift
//  Wom Test App
//
//  Created by Max Tapia on 19-03-24.
//

import SwiftUI

struct MusicListView: View {
    @StateObject private var viewModel = SongViewModel()
    
    var body: some View {
        NavigationView {
            List(viewModel.songs.sorted(by: {$0.title < $1.title}), id: \.title){ song in
                ZStack{
                    Text(song.title)
                }
                
            }.navigationTitle("Top Songs")
        }.onAppear {
            viewModel.loadData(for: ["cl","us","se"])
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MusicListView()
    }
}
