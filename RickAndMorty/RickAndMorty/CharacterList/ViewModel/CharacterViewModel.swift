//
//  CharacterViewModel.swift
//  RickAndMorty
//
//  Created by Asha Chakrapani on 8/29/19.
//  Copyright © 2019 Asha Chakrapani. All rights reserved.
//

import Foundation

public struct CharacterViewModel {
    
    init(with character: Character) {
        self.id = character.id
        self.name = character.name
        self.status = CharacterStatus(rawValue: character.status ?? CharacterStatus.unknown.rawValue)
        self.species = character.species
        self.type = character.type
        self.gender = Gender(rawValue: character.gender ?? Gender.unknown.rawValue)
        if let _origin = character.origin {
            self.origin = OriginViewModel(with: _origin)
        }
        
        if let _location = character.location {
            self.location = LocationViewModel(with: _location)
        }
        self.image = character.image
        self.episode = character.episode
        self.characterUrl = character.url
        if let _createdDateString = character.created {
            let cellDateFormatter: DateFormatter = {
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
                return dateFormatter
            }()
            self.createdDate = cellDateFormatter.date(from: _createdDateString)
        }
        
    }
    
    var id: Int?
    var name: String?
    var status: CharacterStatus?
    var species: String?
    var type: String?
    var gender: Gender?
    var origin: OriginViewModel?
    var location: LocationViewModel?
    var image: URL?
    var episode: [URL]?
    var characterUrl: String?
    var createdDate: Date?
    
}
