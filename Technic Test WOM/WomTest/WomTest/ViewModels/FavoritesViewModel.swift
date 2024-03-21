//
//  FavoritesViewModel.swift
//  WomTest
//
//  Created by Max Tapia on 20-03-24.
//

import Foundation

class FavoritesViewModel:ObservableObject{
    @Published var favoritesSongs: [Song] = []
    @Published var isEditing: Bool = false
    @Published var selectedSongs: Set<Song> = []
    
    func toggleSelection(for song: Song){
        if selectedSongs.contains(song){
            selectedSongs.remove(song)
        } else {
            selectedSongs.insert(song)
        }
    }
    
    func deleteSelectedSongs(){
        favoritesSongs = favoritesSongs.filter{ !selectedSongs.contains($0) }
        selectedSongs.removeAll()
    }
    
    func toggleFavorite(song: Song)-> Bool{
        
        if let index = favoritesSongs.firstIndex(where: {$0.id == song.id}){
            favoritesSongs.remove(at: index)
        }else{
            favoritesSongs.append(song)
        }
        
        song.isfav.toggle()
        
        return song.isfav
    }
}
