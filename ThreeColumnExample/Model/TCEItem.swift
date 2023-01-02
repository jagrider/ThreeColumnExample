//
//  TCEItem.swift
//  ThreeColumnExample
//
//  Created by Jonathan Grider on 1/1/23.
//

import Foundation


struct TCEItem: Codable, Identifiable {
    let id: UUID
    var name: String
    var description: String
    var type: TCEItemType
}


