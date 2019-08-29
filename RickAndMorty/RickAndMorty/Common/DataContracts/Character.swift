//
//  SeriesCharacter.swift
//  RickAndMorty
//
//  Created by Asha Chakrapani on 8/28/19.
//  Copyright © 2019 Asha Chakrapani. All rights reserved.
//

import Foundation

public struct Character: Codable {
    
    var id: Int?
    var name: String?
    var status: String?
    var species: String?
    var type: String?
    var gender: String?
    var origin: Origin?
    var location: Location?
    var image: URL?
    var episode: [URL]?
    var url: String?
    var created: String?
    
}
