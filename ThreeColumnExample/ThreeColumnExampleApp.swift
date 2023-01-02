//
//  ThreeColumnExampleApp.swift
//  ThreeColumnExample
//
//  Created by Jonathan Grider on 1/1/23.
//

import SwiftUI

@main
struct ThreeColumnExampleApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .frame(minWidth: 1000, minHeight: 700)
                .environmentObject(AppState())
        }
        .windowStyle(.hiddenTitleBar)
        .commands {
            SidebarCommands()
        }
    }
}
