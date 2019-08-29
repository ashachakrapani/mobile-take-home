//
//  EpisodeViewModel.swift
//  RickAndMorty
//
//  Created by Asha Chakrapani on 8/29/19.
//  Copyright © 2019 Asha Chakrapani. All rights reserved.
//

import Foundation

public struct EpisodeViewModel {
    
    init(with episode: Episode) {
        self.id = episode.id
        self.title = episode.name
        self.airDate = episode.air_date
        self.episode = episode.episode
        self.characterUrls = episode.characters
    }
    
    var id: Int?
    var title: String?
    var airDate: String?
    var episode: String?
    var characterUrls: [URL]?
    
}
