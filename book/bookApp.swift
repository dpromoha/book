//
//  bookApp.swift
//  book
//
//  Created by Daria on 19.06.2024.
//

import SwiftUI

@main
struct bookApp: App {
    
    @StateObject private var settings = AppSettings()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(settings)
        }
    }
    
}
