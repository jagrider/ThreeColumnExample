//
//  ContentView.swift
//  ThreeColumnExample
//
//  Created by Jonathan Grider on 1/1/23.
//

import SwiftUI

struct ContentView: View {
    // Make sure to show the leading sidebar when the window first appears
    @EnvironmentObject var appState: AppState
    @State private var showSidebar: NavigationSplitViewVisibility = .all
    @State private var showPlusButton: Bool = true
    @State private var selectedFolder: TCEFolder.ID? = nil
    @State private var selectedFolderItem: TCEItem.ID? = nil
    
    var body: some View {
        NavigationSplitView(columnVisibility: $showSidebar) {
            // MARK: Left Column
            SidebarView(selectedFolder: $selectedFolder)
                .navigationSplitViewColumnWidth(min: 200, ideal: 250, max: 300) // Modify these with your desired sidebar widths
            
        } content: {
            // MARK: Center Column
            VStack(alignment: .leading) {
                if let folderId = selectedFolder, let folder = appState.folder(id: folderId) {
                    FolderItemsListView(folder: folder, selectedItem: $selectedFolderItem)
                } else {
                    EmptyView()
                }
            }
            .navigationSplitViewColumnWidth(min: 200, ideal: 250, max: 300)
        } detail: {
            // MARK: Right Column
            VStack {
                if let folderId = selectedFolder, let itemId = selectedFolderItem, let item = appState.item(id: itemId, inFolder: folderId) {
                    FolderItemDetailView(item: item)
                } else {
                    Text("Select an Item")
                }
            }
            .navigationSplitViewColumnWidth(min: 200, ideal: 250, max: 300)
        }
        .onAppear {
            selectedFolder = appState.folders.first?.id
            selectedFolderItem = appState.folders.first?.items.first?.id
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
