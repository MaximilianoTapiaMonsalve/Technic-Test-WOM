//
//  ContentView.swift
//  Wom Test App
//
//  Created by Max Tapia on 19-03-24.
//

import SwiftUI


struct MusicListView: View {
    @StateObject private var favoritesViewModel = FavoritesViewModel()
    
    
    init() {
        UINavigationBar.appearance().barTintColor = UIColor(Color("backgroundColor"))
    }
    
    var body: some View {
        TabView{
            SongListView(favViewModel: favoritesViewModel)
                .tabItem{
                    Image(systemName:"music.note.list")
                    Text("Top Songs")
                    
                }
            FavoritesView(viewModel: favoritesViewModel)
                .tabItem{
                    Image(systemName: "star")
                    Text("Favorites")
                }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MusicListView()
    }
}
