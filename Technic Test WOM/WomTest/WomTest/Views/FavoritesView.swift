//
//  FavoritesView.swift
//  WomTest
//
//  Created by Max Tapia on 20-03-24.
//

import SwiftUI


struct FavoritesView: View {
    @StateObject var viewModel: FavoritesViewModel
    
    
    var body: some View {
        
        NavigationView{
                if viewModel.favoritesSongs.isEmpty {
                    ZStack{
                        Color("backgroundColor").ignoresSafeArea()
                        Text("You don't have favorites songs")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .foregroundStyle(.secondary)
                    }
                } else {
                    ZStack{
                        Color("backgroundColor").ignoresSafeArea()
                        List(viewModel.favoritesSongs.sorted(by: {$0.id < $1.id}), id:\.id) { song in
                            if !viewModel.isEditing {
                                NavigationLink(destination: SongDetailView(viewModel: viewModel, song: song)){
                                    HStack{
                                        SongTile(viewModel: viewModel, song: song)
                                    }
                                    
                                    
                                }
                            } else {
                                SongTile(viewModel: viewModel, song: song)                            }
                        }
                    }
                    .navigationTitle("Favorites songs")
                    .navigationBarTitleDisplayMode(.large)
                    .background(Color("backgroundColor"))
                    
                    .toolbar{
                        ToolbarItem{
                            Button(action: {
                                if viewModel.isEditing{
                                    viewModel.deleteSelectedSongs()
                                }
                                viewModel.isEditing.toggle()
                                
                            }, label: {
                                if viewModel.isEditing{
                                    Text("delete selection")
                                }else{
                                    Image(systemName: "trash")
                                }
                            })
                        }
                        
                    }
                }
                
                
            }
            
            
        }
    }


#Preview {
    MusicListView()
    //    FavoritesView(viewModel: FavoritesViewModel())
}


struct SongTile: View {
    @StateObject var viewModel: FavoritesViewModel
    
    var song: Song
    var body: some View {
        
            VStack{
                
                HStack(alignment: .center){
                    
                    if viewModel.isEditing{
                        Image(systemName: viewModel.selectedSongs.contains(song) ? "checkmark.circle.fill" : "circle")
                            .onTapGesture {
                                viewModel.toggleSelection(for: song)
                            }
                            .foregroundColor(.blue)
                            .padding(.trailing, 10)
                    }
                    
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
                    }
                    Spacer()
                }
            }
            .contentShape(Rectangle())
            .onTapGesture {
                    viewModel.toggleSelection(for: song)
            }
        }
}
