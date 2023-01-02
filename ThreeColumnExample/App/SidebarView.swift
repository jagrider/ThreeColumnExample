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
        VStack(alignment: .leading) {
            List {
                Section("Folders") {
                    ForEach(appState.folders) { folder in
                        HStack {
                            Image(systemName: "folder")
                            Text(folder.name)
                        }
                    }
                }
            }
            .listStyle(.sidebar)
        }
    }
}

struct SidebarView_Previews: PreviewProvider {
    static var previews: some View {
        SidebarView()
    }
}
