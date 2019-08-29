//
//  EpisodeListViewModel.swift
//  RickAndMorty
//
//  Created by Asha Chakrapani on 8/29/19.
//  Copyright © 2019 Asha Chakrapani. All rights reserved.
//

import Foundation


public struct EpisodeListViewModel {
    
    var episodes: [EpisodeViewModel]?
    
    init(with episodes: [Episode]) {
        self.episodes = EpisodeListViewModel.from(episodes)
    }
    
    static func from(_ episodes: [Episode] ) -> [EpisodeViewModel] {
        let episodesViewModel: [EpisodeViewModel] = episodes.map({ EpisodeViewModel.init(with: $0) })
        return episodesViewModel
    }
    
}
