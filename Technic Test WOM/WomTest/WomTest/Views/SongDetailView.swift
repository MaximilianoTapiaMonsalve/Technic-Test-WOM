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
        VStack{
            AsyncImage(url: URL(string: song.image.last?.label ?? ""))
                .frame(width: 250, height: 250)
                .scaledToFit()
                .clipShape(RoundedRectangle(cornerRadius: 15))
            
            Text(song.title)
                .font(.title2)
                .fontWeight(.semibold)
                .lineLimit(/*@START_MENU_TOKEN@*/2/*@END_MENU_TOKEN@*/)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 20)
            HStack(spacing:20){
                Text(song.artist)
                Text(song.realeseDate)
            }
        }
    }
}

#Preview {
    SongDetailView(song: Song(id: "id", name: "name", title: "Titulo de la canción", artist: "artist", realeseDate: "realese date", image: [IMImage(label: "", attributes: IMImageAttributes(height: "170"))], price: 0, currency: "clp"))
}
