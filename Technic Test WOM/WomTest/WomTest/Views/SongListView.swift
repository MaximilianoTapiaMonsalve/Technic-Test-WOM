//
//  SongListView.swift
//  WomTest
//
//  Created by Max Tapia on 20-03-24.
//

import SwiftUI

struct SongListView: View {
    @StateObject var viewModel = SongViewModel()
    @StateObject var favViewModel: FavoritesViewModel
    
    var body: some View {
        NavigationView{
            SongList(viewModel: viewModel, favViewModel: favViewModel)
            
        }
    }
}




struct SongList: View {
    
    @StateObject var viewModel: SongViewModel
    @StateObject var favViewModel: FavoritesViewModel
    
    var body: some View {
        VStack{
            List{
                Section{
                    ForEach(viewModel.songs.sorted(by:{$0.name < $1.name}),id: \.id){song in
                        NavigationLink(destination: SongDetailView(viewModel: favViewModel, song: song)){
                            
                            HStack(alignment: .center){
                                
                                AsyncImage(url: URL(string: song.image.first?.label ?? ""))
                                    .frame(width: 55, height: 55)
                                    .clipShape(RoundedRectangle(cornerRadius: 5))
                                
                                VStack(alignment:.leading){
                                    
                                    Text(song.name)
                                        .fontWeight(.semibold)
                                        .lineLimit(1)
                                        .minimumScaleFactor(0.9)
                                    
                                    Text(song.artist)
                                        .font(.subheadline)
                                        .lineLimit(1)
                                        .foregroundColor(.secondary)
                                }
                            }
                        }
                    }
                }header: {
                    Text("\(viewModel.songs.count) songs")
                }
                
                .listRowBackground(Color.white)
                
            }
        }
        .navigationTitle("Top Songs")
        .background(Color("backgroundColor"))
        .scrollContentBackground(.hidden)
    }
}

#Preview {
    MusicListView()
}
