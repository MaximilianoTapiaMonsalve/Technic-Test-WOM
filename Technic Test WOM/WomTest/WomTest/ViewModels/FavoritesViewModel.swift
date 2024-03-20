//
//  FavoritesViewModel.swift
//  WomTest
//
//  Created by Max Tapia on 20-03-24.
//

import Foundation

class FavoritesViewModel:ObservableObject{
    @Published var favoritesSongs: [Song] = []
}
