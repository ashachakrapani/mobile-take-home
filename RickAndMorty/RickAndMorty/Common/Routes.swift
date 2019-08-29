//
//  Routes.swift
//  RickAndMorty
//
//  Created by Asha Chakrapani on 8/28/19.
//  Copyright © 2019 Asha Chakrapani. All rights reserved.
//

import Foundation

public struct Routes {
    

    public static let baseURL = "https://rickandmortyapi.com/api"
    
    public struct Episode {
        
        ///All available episodes
        static let episodes = "\(baseURL)/episode/"

    }
    
    public struct Character {
        
        ///Character details
        static let details = "\(baseURL)/character/"
        static let avatar = "\(baseURL)/character/avatar/20.jpeg"
    }
}
