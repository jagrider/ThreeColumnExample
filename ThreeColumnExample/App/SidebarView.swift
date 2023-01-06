//
//  SidebarView.swift
//  ThreeColumnExample
//
//  Created by Jonathan Grider on 1/1/23.
//

import SwiftUI

struct SidebarView: View {
    @EnvironmentObject var appState: AppState
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            List {
                Section("Folders") {
                    ForEach(appState.folders) { folder in
                        NavigationLink {
                            FolderItemsListView(folder: folder)
                        } label: {
                            SidebarListItemView(folder: folder)
                        }

                    }
                }
            }
            .listStyle(.sidebar)
        }
        .toolbar {
            Spacer()
            Button {
                print("Add folder")
            } label: {
                Image(systemName: "plus")
                    .font(.title2)
            }
        }
    }
}

struct SidebarView_Previews: PreviewProvider {
    static var previews: some View {
        SidebarView()
    }
}
