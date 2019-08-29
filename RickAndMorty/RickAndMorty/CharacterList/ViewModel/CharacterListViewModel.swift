//
//  CharacterListViewModel.swift
//  RickAndMorty
//
//  Created by Asha Chakrapani on 8/29/19.
//  Copyright © 2019 Asha Chakrapani. All rights reserved.
//

import Foundation


public struct CharacterListViewModel {
    
    var characters: [CharacterViewModel]?
    
    init(with characters: [Character]) {
        self.characters = CharacterListViewModel.from(characters).sorted(by: { $0.createdDate! > $1.createdDate! })
    }
    
    static func from(_ characters: [Character] ) -> [CharacterViewModel] {
        let charactersViewModel: [CharacterViewModel] = characters.map({ CharacterViewModel.init(with: $0) })
        return charactersViewModel
    }
    
    mutating func sorted() {
        self.characters = self.characters?.sorted(by: { (charViewModel1, charViewModel2) -> Bool in
            if let createdDt1 = charViewModel1.createdDate, let createdDt2 = charViewModel2.createdDate {
                return createdDt1 > createdDt2
            }
            return false
        })
        
    }
    
}

