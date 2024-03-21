//
//  SongDetailView.swift
//  WomTest
//
//  Created by Max Tapia on 20-03-24.
//

import SwiftUI

struct SongDetailView: View {
    
    @StateObject var viewModel: FavoritesViewModel
    @State private var isFav: Bool = false;
    
    var song: Song
    
    
    var body: some View {
        ZStack{
            Color("backgroundColor").ignoresSafeArea()
            
            VStack(spacing: 15.0){
                
                Text(song.name)
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .fontWeight(.semibold)
                
                AlbumImage(song: song)
                
                Text(song.title)
                    .font(.title2)
                    .fontWeight(.semibold)
                    .lineLimit(/*@START_MENU_TOKEN@*/2/*@END_MENU_TOKEN@*/)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 20)
                
                
                SongDetail(song: song)
                
                Spacer()
                
                BuyButton(viewModel: viewModel, song: song, isfav: $isFav)
                    .toolbar{
                        ToolbarItem{
                            Button(action: {
                               isFav = viewModel.toggleFavorite(song: song)
                                
                            }, label: {
                                Image(systemName: song.isfav ? "suit.heart.fill" : "heart")
                            })
                        }
                    }
        }
            
        }
        
    }
}



#Preview{
    MusicListView()
}


struct AlbumImage: View {
    var song: Song
    var body: some View {
        AsyncImage(url: URL(string: song.image.last?.label ?? "")){image in
            image
                .resizable()
                .frame(width: 300, height: 300)
                .scaledToFit()
                .clipShape(RoundedRectangle(cornerRadius: 15))
        }placeholder: {
            ProgressView()
        }
    }
}

struct SongDetail: View {
    var song: Song
    var body: some View {
        
        HStack(spacing:20){
            
            Text(song.artist)
                .font(.subheadline)
                .foregroundStyle(.secondary)
            
            Text(song.realeseDate)
                .font(.subheadline)
                .foregroundStyle(.secondary)
        }
    }
}

struct BuyButton: View {
    
    @StateObject var viewModel: FavoritesViewModel
    
    let song: Song
    @Binding var isfav: Bool
    
    var body: some View {
        Button(action: {
            print("Comprar")
        }, label: {
            Text(song.price)
                .frame(width: 200)
                .padding()
                .background(Color.white)
                .clipShape(RoundedRectangle(cornerRadius: 150))
        })
        .padding()
        
    }
}
