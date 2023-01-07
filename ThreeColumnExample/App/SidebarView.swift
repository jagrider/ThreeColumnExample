//
//  SidebarView.swift
//  ThreeColumnExample
//
//  Created by Jonathan Grider on 1/1/23.
//

import SwiftUI

struct SidebarView: View {
    @Binding var selectedFolder: TCEFolder.ID?
    @EnvironmentObject var appState: AppState
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            List(selection: $selectedFolder) {
                Section("Folders") {
                    ForEach(appState.folders) { folder in
                        SidebarListItemView(folder: folder)
                    }
                }
            }
            .listStyle(.sidebar)
            
            Spacer()
            
            Button {
                // showAddView = true
            } label: {
                Image(systemName: "plus.circle")
                Text("Add Folder")
            }
            .buttonStyle(.plain)
            .padding()
//            .sheet(isPresented: $showAddView, onDismiss: {
//                // dismiss
//            }) {
//                AddNewListView(vm: AddNewListViewModel(context: context))
//            }
        }
    }
}

struct SidebarView_Previews: PreviewProvider {
    static var previews: some View {
        SidebarView(selectedFolder: .constant(nil))
    }
}
