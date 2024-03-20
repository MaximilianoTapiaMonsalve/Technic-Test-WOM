//
//  SongDetailView.swift
//  WomTest
//
//  Created by Max Tapia on 20-03-24.
//

import SwiftUI

struct SongDetailView: View {
    
    var song: Song
    
    
    var body: some View {
        ZStack{
            Color("backgroundColor").ignoresSafeArea()
            
            VStack(spacing: 15.0){
                
                Text(song.name)
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .fontWeight(.semibold)
                
                AsyncImage(url: URL(string: song.image.last?.label ?? "")){image in
                    image
                        .resizable()
                        .frame(width: 300, height: 300)
                        .scaledToFit()
                        .clipShape(RoundedRectangle(cornerRadius: 15))
                }placeholder: {
                    ProgressView()
                }
                
                Text(song.title)
                    .font(.title2)
                    .fontWeight(.semibold)
                    .lineLimit(/*@START_MENU_TOKEN@*/2/*@END_MENU_TOKEN@*/)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 20)
                
                
                
                HStack(spacing:20){
                    Text(song.artist)
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                    Text(song.realeseDate)
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                }
                Spacer()
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
                .toolbar{
                    ToolbarItem{
                        Button(action: {
                            print("Favoritos")
                        }, label: {
                            Image(systemName:"heart")
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
//#Preview {
//    SongDetailView(song: Song(id: "id", name: "name", title: "Titulo de la canción", artist: "artist", realeseDate: "realese date", image: [IMImage(label: "", attributes: IMImageAttributes(height: "170"))], price: "490"))
//}
