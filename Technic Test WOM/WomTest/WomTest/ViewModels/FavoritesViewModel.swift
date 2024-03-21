//
//  FavoritesViewModel.swift
//  WomTest
//
//  Created by Max Tapia on 20-03-24.
//

import Foundation

class FavoritesViewModel:ObservableObject{
    @Published var favoritesSongs: [Song] = []
    
    func toggleFavorite(song: Song){
        if let index = favoritesSongs.firstIndex(where: {$0.id == song.id}){
            
            favoritesSongs.remove(at: index)
            
            
        }else{
            favoritesSongs.append(song)
        }
        song.isfav.toggle()
    }
}
