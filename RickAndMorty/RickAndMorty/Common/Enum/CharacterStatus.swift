//
//  CharacterStatus.swift
//  RickAndMorty
//
//  Created by Asha Chakrapani on 8/29/19.
//  Copyright © 2019 Asha Chakrapani. All rights reserved.
//

import Foundation

public enum CharacterStatus: String, Codable, Comparable {
    public static func < (lhs: CharacterStatus, rhs: CharacterStatus) -> Bool {
        return lhs.rawValue < rhs.rawValue
    }
    
    case unknown = "Unknown"
    case alive = "Alive"
    case dead = "Dead"
    
}
