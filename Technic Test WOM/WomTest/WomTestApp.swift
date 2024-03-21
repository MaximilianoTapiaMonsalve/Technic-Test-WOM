//
//  WomTestApp.swift
//  WomTest
//
//  Created by Max Tapia on 19-03-24.
//

import SwiftUI

@main
struct WomTestApp: App {
    @Environment(\.colorScheme) var colorScheme
    var body: some Scene {
        WindowGroup {
            MusicListView()
                .preferredColorScheme(.light)
        }
    }
}
