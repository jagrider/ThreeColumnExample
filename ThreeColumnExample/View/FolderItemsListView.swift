//
//  FolderListView.swift
//  ThreeColumnExample
//
//  Created by Jonathan Grider on 1/5/23.
//

import SwiftUI

struct FolderItemsListView: View {
    
    //@EnvironmentObject var appState: AppState
    
    let folder: TCEFolder
    @Binding var selectedItem: TCEItem.ID?
    
    var body: some View {
        VStack(alignment: .leading) {
            List(folder.items, selection: $selectedItem) { item in
                HStack {
                    Text(item.name)
                        .font(.headline)
                        .fontWeight(.medium)
                }
                .padding(.vertical, 10)

            }
            .toolbar {
                Text(folder.name)
                    .font(.headline)
            }
        }
    }
}

struct FolderListView_Previews: PreviewProvider {
    
    static let exampleItems = [
        TCEItem(id: UUID(), name: "Item 1", description: "Lorem Ipsum Dolor Amet", type: .todo),
        TCEItem(id: UUID(), name: "Item 2", description: "Lorem Ipsum Dolor Amet", type: .recipe),
        TCEItem(id: UUID(), name: "Item 3", description: "Lorem Ipsum Dolor Amet", type: .link),
        TCEItem(id: UUID(), name: "Item 4", description: "Lorem Ipsum Dolor Amet", type: .misc)
    ]
    
    static var previews: some View {
        FolderItemsListView(folder: TCEFolder(id: UUID(), name: "Example Folder", items: exampleItems), selectedItem: .constant(nil))
    }
}
