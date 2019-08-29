//
//  CharacterTableViewCell.swift
//  RickAndMorty
//
//  Created by Asha Chakrapani on 8/28/19.
//  Copyright © 2019 Asha Chakrapani. All rights reserved.
//

import UIKit

class CharacterTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBOutlet weak var characterImage: UIImageView!
    
    @IBOutlet weak var characterName: UILabel!
    
    @IBOutlet weak var status: UILabel!
    
    @IBOutlet weak var createdDate: UILabel!
    
    
    func resetCell() {
        self.characterImage.image = nil
        self.characterName.text = ""
        self.status.text = ""
        self.createdDate.text = ""
    }
}
