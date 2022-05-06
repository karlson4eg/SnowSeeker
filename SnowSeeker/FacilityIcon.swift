//
//  FacilityIcon.swift
//  SnowSeeker
//
//  Created by Evi St on 5/6/22.
//

import Foundation

enum FacilityIcon: String {
    case accommodation = "Accommodation"
    case beginners = "Beginners"
    case crossCountry = "Cross-country"
    case ecoFriendly = "Eco-friendly"
    case family = "Family"
    
    var iconName: String {
        switch self {
        case .accommodation:
            return "house"
        case .beginners:
            return "1.circle"
        case .crossCountry:
            return "map"
        case .ecoFriendly:
            return "leaf.arrow.circlepath"
        case .family:
            return "person.3"
        }
    }
    
}
