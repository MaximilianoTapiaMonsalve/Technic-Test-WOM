//
//  FavoritesView.swift
//  WomTest
//
//  Created by Max Tapia on 20-03-24.
//

import SwiftUI


struct FavoritesView: View {
    @ObservedObject var viewModel: FavoritesViewModel
    
    var body: some View {
        VStack{
            
            ForEach(viewModel.favoritesSongs,id: \.id){ song in
                Text(song.name)
            }
        }
    }
}

#Preview {
   
    FavoritesView(viewModel: FavoritesViewModel())
}

