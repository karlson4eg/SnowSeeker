//
//  Facility.swift
//  SnowSeeker
//
//  Created by Evi St on 5/6/22.
//

import SwiftUI

struct Facility: Identifiable {
    let id = UUID()
    var name: String
    
    private let descriptions = [
        "Accommodation": "This resort has popular on-site accommodation.",
        "Beginners": "This resort has lots of ski schools.",
        "Cross-country": "This resort has many cross-country ski routes.",
        "Eco-friendly": "This resort has won an award for environmental friendliness.",
        "Family": "This resort is popular with families."
    ]
    
    var description: String {
        if let message = descriptions[name] {
            return message
        } else {
            fatalError("Unknown facility type: \(name)")
        }
    }

    
    var icon: Image? {
        let icon = FacilityIcon.init(rawValue: self.name)
        return Image(systemName: icon?.iconName ?? "-")
    }
}
