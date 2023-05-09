//
//  FolderContentView.swift
//  ThreeColumnExample
//
//  Created by Jonathan Grider on 5/9/23.
//

import SwiftUI

struct FolderContentView: View {
    @EnvironmentObject var appState: AppState
    
    let folder: TCEFolder
    @Binding var selectedItem: TCEItem.ID?
    
    var body: some View {
        VStack {
            NavigationView {
                FolderItemsListView(folder: folder, selectedItem: $selectedItem)
                    .navigationSplitViewColumnWidth(min: 200, ideal: 250, max: 300)
                VStack {
                    if let folderId = folder.id, let itemId = selectedItem, let item = appState.item(id: itemId, inFolder: folderId) {
                        FolderItemDetailView(item: item)
                    } else {
                        Text("Select an Item")
                    }
                }
                .navigationSplitViewColumnWidth(min: 200, ideal: 250, max: 300)
            }
        }
        .padding(.top, 1)
    }
}



struct FolderContentView_Previews: PreviewProvider {
    
    static let exampleItems = [
        TCEItem(id: UUID(), name: "Item 1", description: "Lorem Ipsum Dolor Amet", type: .todo),
        TCEItem(id: UUID(), name: "Item 2", description: "Lorem Ipsum Dolor Amet", type: .recipe),
        TCEItem(id: UUID(), name: "Item 3", description: "Lorem Ipsum Dolor Amet", type: .link),
        TCEItem(id: UUID(), name: "Item 4", description: "Lorem Ipsum Dolor Amet", type: .misc)
    ]
    
    static var previews: some View {
        FolderContentView(folder: TCEFolder(id: UUID(), name: "Example Folder", items: exampleItems), selectedItem: .constant(nil))
    }
}
