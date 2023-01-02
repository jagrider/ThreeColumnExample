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
            SidebarView()
                .navigationSplitViewColumnWidth(min: 200, ideal: 250, max: 300) // Modify these with your desired sidebar widths
            
        } content: {
            VStack {
                Text("Middle Column")
            }
            .frame(minWidth: .zero, maxWidth: 300, maxHeight: .infinity)
            .fixedSize()
            .toolbar {
                Text("Toolbar 1")
            }
            .navigationSplitViewColumnWidth(min: 200, ideal: 250, max: 300)
            
        } detail: {
            VStack(alignment: .center) {
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundColor(.accentColor)
                Text("Hello, world!")
            }
            .padding()
            .toolbar {
                Text("Toolbar 2")
            }
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
