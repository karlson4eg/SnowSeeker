//
//  FileManager-DocumentsDirectory.swift
//  SnowSeeker
//
//  Created by Evi St on 5/7/22.
//

import Foundation


extension FileManager {
    static var documentsDirectory: URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
}
