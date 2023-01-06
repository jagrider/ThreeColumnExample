//
//  SidebarListView.swift
//  ThreeColumnExample
//
//  Created by Jonathan Grider on 1/5/23.
//

import SwiftUI

struct SidebarListItemView: View {
    
    let folder: TCEFolder
    
    var body: some View {
        HStack {
            Image(systemName: "folder")
                .foregroundColor(.accentColor)
            Text(folder.name)
            Spacer()
            Text("\(folder.items.count)")
        }
    }
        
}

struct SidebarListView_Previews: PreviewProvider {
    static var previews: some View {
        SidebarListItemView(folder: TCEFolder(id: UUID(), name: "Example Folder"))
    }
}
