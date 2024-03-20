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
            VStack{
                Text("Top Songs")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.top , 10)
                List{
                    Section{
                        
                        ForEach(viewModel.songs.sorted(by:{$0.name < $1.name}),id: \.id){song in
                            NavigationLink(destination: SongDetailView(song: song)){
                                
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
            
            .navigationBarTitle("",displayMode: .automatic)
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
