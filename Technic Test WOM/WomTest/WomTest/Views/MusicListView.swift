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
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .padding(.top , 10)
                List{
                    Section{
                        ForEach(viewModel.songs,id: \.id){song in
                            Text(song.name)
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
