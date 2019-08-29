//
//  LocationViewModel.swift
//  RickAndMorty
//
//  Created by Asha Chakrapani on 8/29/19.
//  Copyright © 2019 Asha Chakrapani. All rights reserved.
//

import Foundation

public struct LocationViewModel {
    
    init(with location: Location) {
        self.name = location.name
        self.url = location.url != nil ? URL(string: location.url!) : nil
    }
    
    var name: String?
    var url: URL?
    
}
