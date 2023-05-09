//
//  ToolbarView.swift
//  ThreeColumnExample
//
//  Created by Jonathan Grider on 5/9/23.
//

import SwiftUI

struct ToolbarView: View {
    @State private var searchText = ""
    
    var body: some View {
        
        HStack {
            Button(action: {
                // Perform copy action
            }) {
                Image(systemName: "doc.on.doc")
                    .padding(5)
            }
            Button(action: {
                // Perform delete action
            }) {
                Image(systemName: "trash")
                    .padding(5)
            }
            Spacer()
            TextField("Search", text: $searchText)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(5)
                .frame(width: 150)
        }
        .padding([.leading, .trailing])
        
    }
}

struct ToolbarView_Previews: PreviewProvider {
    static var previews: some View {
        ToolbarView()
    }
}
