//
//  Bundle-Decodable.swift
//  Moonshot
//
//  Created by Evi St on 3/11/22.
//

import Foundation

extension Bundle {
    func decode<T: Codable>(_ file: String) -> T {
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Failed to locate \(file) in bundle")
        }
        
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load \(file) in bundle")
        }
        
        let decoder = JSONDecoder()

        do{
            let loaded = try decoder.decode(T.self, from: data)
            return loaded
            
        } catch {
            print(error)
            fatalError("Failed to decode \(file) in bundle")
        }
//        guard let loaded = try? decoder.decode(T.self, from: data) else {
//            fatalError("Failed to decode \(file) in bundle")
//        }

        
    }
    
}
