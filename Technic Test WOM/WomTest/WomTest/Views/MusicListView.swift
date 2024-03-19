//
//  ContentView.swift
//  Wom Test App
//
//  Created by Max Tapia on 19-03-24.
//

import SwiftUI

struct MusicListView: View {
    var body: some View {
        NavigationView {
            List(0 ..< 20){ item in
                HStack {
                    Image("Image-aux")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 70)
                        .clipShape(.rect(cornerRadius:  4))
                    
                    
                    VStack(alignment: .leading,spacing: 5){
                        
                        Text("Titulo de la canción")
                            .fontWeight(.semibold)
                            .lineLimit(/*@START_MENU_TOKEN@*/2/*@END_MENU_TOKEN@*/)
                            .minimumScaleFactor(0.5)
                        
                        Text("Fecha")
                            .font(.subheadline)
                            .foregroundStyle(.secondary)
                    }
                }
            }
            .navigationTitle("List Title")
        }
    }
}

#Preview {
    MusicListView()
}
