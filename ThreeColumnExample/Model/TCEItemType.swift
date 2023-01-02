//
//  TCEItemType.swift
//  ThreeColumnExample
//
//  Created by Jonathan Grider on 1/1/23.
//

import Foundation

enum TCEItemType: String, Codable, CaseIterable {
    case todo = "TODO"
    case link = "LINK"
    case recipe = "RECIPE"
    case misc = "MISC"
    
    var description: String {
        switch self {
        case .todo:
            return "Todo or checklist item"
        case .link:
            return "Link to a resource or website"
        case .recipe:
            return "Recipe for a tasty treat or family staple"
        case .misc:
            return "Miscellaneous"
        }
    }
}
