//
//  Bundle+Extension.swift
//  ThreeColumnExample
//
//  Created by Jonathan Grider on 1/1/23.
//

import Foundation

extension Bundle {
    // Decode from a file for the given type
    func decode<T: Codable>(_ file: String) -> T {
        
        // locate file within bundle
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Failed to locate \(file) within bundle")
        }
        
        // Load file
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load \(file) from bundle")
        }
        
        // Decode data and try to confirm it to the specified type
        let decoder = JSONDecoder()
        guard let decodedData = try? decoder.decode(T.self, from: data) else {
            fatalError("Failed to decode \(file) from bundle")
        }
        
        return decodedData
    }
}
