//
//  Favourites.swift
//  SnowSeeker
//
//  Created by Evi St on 5/7/22.
//

import Foundation


class Favourites: ObservableObject {
    private var resorts: Set<String>
    private let saveKey = "Favourites"
    
    init() {
        //load our saved data
        resorts = []
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
        // write out our data
        
    }
}
