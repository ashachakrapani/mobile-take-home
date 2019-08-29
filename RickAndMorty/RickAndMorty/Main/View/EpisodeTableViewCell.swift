//
//  EpisodeTableViewCell.swift
//  RickAndMorty
//
//  Created by Asha Chakrapani on 8/28/19.
//  Copyright © 2019 Asha Chakrapani. All rights reserved.
//

import UIKit

class EpisodeTableViewCell: UITableViewCell {
    
    //MARK :- UITableViewCell overrides
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    //MARK :- IBOutlets
    @IBOutlet weak var episodeNumberLabel: UILabel!
    @IBOutlet weak var episodeNameLabel: UILabel!
    
    //MARK :- Public Api
    
    func resetCell() {
        self.episodeNumberLabel.text = ""
        self.episodeNameLabel.text = ""
    }
    
}
