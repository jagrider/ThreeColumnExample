//
//  ContentView.swift
//  ThreeColumnExample
//
//  Created by Jonathan Grider on 1/1/23.
//

import SwiftUI

struct ContentView: View {
    // Make sure to show the leading sidebar when the window first appears
    @State private var showSidebar: NavigationSplitViewVisibility = .all
    
    var body: some View {
        NavigationSplitView(columnVisibility: $showSidebar) {
            // MARK: Left Column
            SidebarView()
                .navigationSplitViewColumnWidth(min: 200, ideal: 250, max: 300) // Modify these with your desired sidebar widths
            
        } content: {
            // MARK: Center Column
            VStack {
                Text("")
            }
            .navigationSplitViewColumnWidth(min: 200, ideal: 250, max: 300)

        } detail: {
            // MARK: Right Column
            EmptyView()
                .navigationSplitViewColumnWidth(min: 200, ideal: 250, max: 300)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
