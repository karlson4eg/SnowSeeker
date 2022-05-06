//
//  Favourites.swift
//  SnowSeeker
//
//  Created by Evi St on 5/7/22.
//

import Foundation


class Favourites: ObservableObject, Codable {
    private var resorts: Set<String>
    //private let saveKey = "Favourites"
    private var savePath = FileManager.documentsDirectory.appendingPathComponent("FavouriteResorts")
    
    init() {
        do {
            let data = try Data(contentsOf: savePath)
            resorts = try JSONDecoder().decode(Set<String>.self, from: data)
        } catch {
            resorts = []
        }
    }
    func contains(_ resort: Resort) -> Bool {
        resorts.contains(resort.id)
        
    }
    
    func add(_ resort: Resort) {
        objectWillChange.send()
        resorts.insert(resort.id)
        save()
    }
    
    func remove(_ resort: Resort) {
        objectWillChange.send()
        resorts.remove(resort.id)
        save()
    }
    
    func save() {
        do {
            let data = try JSONEncoder().encode(resorts)
            try data.write(to: savePath, options: [.atomicWrite, .completeFileProtection])
        } catch {
            print("Unable to save data")
        }
    }
}
