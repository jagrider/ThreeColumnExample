//
//  TCEFolders.swift
//  ThreeColumnExample
//
//  Created by Jonathan Grider on 1/1/23.
//

import Foundation

// NOTE:
//
//  This data model for demonstration only.
//  Consider using CoreData or another data storage solution for storing your application data.
//
// General 
@MainActor
class AppState: ObservableObject {
    // An observable that can be read everywhere but only updated within AppState
    @Published private(set) var folders: [TCEFolder]
    
    // Start by loading data from
    init() {
        if let data = UserDefaults.standard.data(forKey: dataSaveKey) { // dataSaveKey -> Constants.swift
            let decoder = JSONDecoder()
            
            if let decoded = try? decoder.decode([TCEFolder].self, from: data) {
                folders = decoded
                return
            }
        }
        
        // First time setup: Use the starter app data
        self.folders = starterFolders // starterFolders -> Constants.swift
        self.save()
    }
    
    // Save the app data to the UserDefaults
    private func save() {
        let encoder = JSONEncoder()
        
        guard let encoded = try? encoder.encode(folders) else {
                fatalError("Uknown error while saving data")
        }
        
        UserDefaults.standard.set(encoded, forKey: dataSaveKey) // dataSaveKey -> Constants.swift
    }
    
    // Creates a new TCEFolder that can store items
    func createFolder(withName name: String) -> TCEFolder {
        let newFolder = TCEFolder(id: UUID(), name: name)
        
        folders.append(newFolder)
        self.save()
        
        return newFolder
    }
    
    // Removes a folder and its items
    func removeFolder(byId: TCEFolder.ID) {
        folders.removeAll(where: { $0.id == byId })
        self.save()
    }
    
    // Adds a new item to a given folder
    func addItem(_ item: TCEItem, toFolder: TCEFolder.ID) {
        
        // See if we have the folder
        guard var folder = self.folders.first(where: { $0.id == toFolder }) else {
            return
        }
        
        folder.items.append(item)
        self.save()
    }
    
    // Removes an item from a given folder
    func removeItem(_ item: TCEItem, from folder: TCEFolder.ID) {
        // See if we have the folder
        guard var folder = self.folders.first(where: { $0.id == folder }) else {
            return
        }
        
        folder.items.removeAll(where: { $0.id == item.id })
        self.save()
    }
    
    // Update an item
    func updateItem(_ updatedItem: TCEItem, in folder: TCEFolder.ID) {
        // See if we have the folder
        guard var folder = self.folders.first(where: { $0.id == folder }) else {
            return
        }
        
        // Update existing item
        guard let existingItemIndex = folder.items.firstIndex(where: { $0.id == updatedItem.id }) else {
            return
        }
        folder.items[existingItemIndex] = updatedItem
        self.save()
    }
    
}
