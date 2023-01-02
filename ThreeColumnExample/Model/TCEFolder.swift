//
//  TCEFolder.swift
//  ThreeColumnExample
//
//  Created by Jonathan Grider on 1/1/23.
//

import Foundation

struct TCEFolder: Codable, Identifiable {
    let id: UUID
    var name: String
    var items: [TCEItem] = []
}
