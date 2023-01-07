//
//  FolderItemDetailView.swift
//  ThreeColumnExample
//
//  Created by Jonathan Grider on 1/5/23.
//

import SwiftUI

struct FolderItemDetailView: View {
    
    let item: TCEItem?
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(item!.name)
                .font(.largeTitle)
                .fontWeight(.bold)
            
            Text(item!.description)
                .font(.headline)
                
            Text(item!.type.rawValue)
                .opacity(0.6)
        }
        .toolbar {
            Spacer()
            Text(item!.name)
                .font(.headline)
            Spacer()
        }
        
    }
}

struct FolderItemDetailView_Previews: PreviewProvider {
    static var previews: some View {
        FolderItemDetailView(item: TCEItem(id: UUID(), name: "Item 1", description: "Lorem Ipsum Dolor Amet", type: .todo))
    }
}
