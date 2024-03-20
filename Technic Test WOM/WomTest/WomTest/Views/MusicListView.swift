//
//  ContentView.swift
//  Wom Test App
//
//  Created by Max Tapia on 19-03-24.
//

import SwiftUI

struct MusicListView: View {
    @StateObject private var viewModel = SongViewModel()
    
    init() {
        UINavigationBar.appearance().barTintColor = UIColor(Color("backgroundColor"))
    }
    
    var body: some View {
        NavigationView{
            ZStack{
                
                List{
                    ForEach(viewModel.songs,id: \.title){song in
                        Text(song.title)
                    }
                    .listRowBackground(Color.white)
                    
                }
            }
            .navigationTitle("a")
            .navigationBarTitleDisplayMode(.automatic)
            .background(Color("backgroundColor"))
            .scrollContentBackground(.hidden)
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MusicListView()
    }
}
