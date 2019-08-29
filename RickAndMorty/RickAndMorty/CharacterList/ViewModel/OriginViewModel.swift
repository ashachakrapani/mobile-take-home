//
//  OriginViewMOdel.swift
//  RickAndMorty
//
//  Created by Asha Chakrapani on 8/29/19.
//  Copyright © 2019 Asha Chakrapani. All rights reserved.
//

import Foundation

public struct OriginViewModel {
    
    init(with origin: Origin) {
        self.name = origin.name
        self.url = origin.url != nil ? URL(string: origin.url!) : nil
    }
    
    var name: String?
    var url: URL?
    
}
