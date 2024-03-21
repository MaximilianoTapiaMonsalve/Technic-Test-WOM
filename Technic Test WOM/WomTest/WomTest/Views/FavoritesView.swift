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
            ZStack{
                Color("backgroundColor").ignoresSafeArea()
                
                VStack{
                    List(viewModel.favoritesSongs.sorted(by: {$0.id < $1.id}), id:\.id) { song in
                        
                        
                        NavigationLink(destination: SongDetailView(viewModel: viewModel, song: song)){
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
                                }
                            }.onTapGesture {
                                viewModel.toggleSelection(for: song)
                            }
                        }
                    }
                }
                
            }
            .toolbar{
                ToolbarItem{
                    Button(action: {
                        viewModel.isEditing.toggle()
                    }, label: {
                        Text(viewModel.isEditing ? "Done" : "Edit")
                            .frame(width: 100,height: 30)
                            .background()
                            .clipShape(RoundedRectangle(cornerRadius: 30))
                    })
                }
                
            }.background(Color.white)
        }
        
    }
}

#Preview {
    MusicListView()
    //    FavoritesView(viewModel: FavoritesViewModel())
}

