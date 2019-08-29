//
//  Episode.swift
//  RickAndMorty
//
//  Created by Asha Chakrapani on 8/28/19.
//  Copyright © 2019 Asha Chakrapani. All rights reserved.
//

import Foundation

public struct Episode: Codable {
    
    var id: Int?
    var name: String?
    var air_date: String?
    var episode: String?
    var characters: [URL]?
 
}
