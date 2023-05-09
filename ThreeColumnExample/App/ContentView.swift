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
    @State private var searchText = ""
    
    var body: some View {
        NavigationSplitView(columnVisibility: $showSidebar) {
            // MARK: Left Column
            SidebarView(selectedFolder: $selectedFolder)
                .navigationSplitViewColumnWidth(min: 200, ideal: 250, max: 300) // Modify these with your desired sidebar widths
            
        } detail: {
            // MARK: Center & Right Column
            // In order for SwiftUI to play nice with a shared toolbar, we create a view such as FolderContentView which has **its own** nested NavigationView (NOT split view)
            VStack(alignment: .leading) {
                if let folderId = selectedFolder, let folder = appState.folder(id: folderId) {
                    FolderContentView(folder: folder, selectedItem: $selectedFolderItem)
                } else {
                    EmptyView()
                }
            }
            .toolbar {
                ToolbarItem() {
                    Button(action: {
                        // Perform copy action
                    }) {
                        Image(systemName: "doc.on.doc")
                            .padding(5)
                    }
                }
                ToolbarItem() {
                    Button(action: {
                        // Perform delete action
                    }) {
                        Image(systemName: "trash")
                            .padding(5)
                    }
                }
                ToolbarItem() {
                   Spacer()
                }
                ToolbarItem() {
                    TextField("Search", text: $searchText)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(5)
                        .frame(width: 150)
                }
            }
            /*
            // MARK: Right Column
            VStack {
                if let folderId = selectedFolder, let itemId = selectedFolderItem, let item = appState.item(id: itemId, inFolder: folderId) {
                    FolderItemDetailView(item: item)
                } else {
                    Text("Select an Item")
                }
            }
            .navigationSplitViewColumnWidth(min: 200, ideal: 250, max: 300)
             
             */
        }
        .onAppear {
            selectedFolder = appState.folders.first?.id
        }
        .onChange(of: selectedFolder) { newValue in
            selectedFolderItem = appState.folder(id: selectedFolder ?? UUID())?.items.first?.id // Passing in a UUID default is really hacky, just done here for demonstration purposes
        }
        
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
