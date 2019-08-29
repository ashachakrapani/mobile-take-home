//
//  CharacterDetailViewController.swift
//  RickAndMorty
//
//  Created by Asha Chakrapani on 8/28/19.
//  Copyright © 2019 Asha Chakrapani. All rights reserved.
//

import UIKit

class CharacterDetailViewController: UIViewController {
    
    //MARK: - UIViewController overrides
    override func viewDidLoad() {
        super.viewDidLoad()
        self.updateViewFromViewModel()
    }
    
    //MARK: - IBOutlets
    @IBOutlet weak var characterName: UILabel!
    @IBOutlet weak var characterImage: UIImageView!
    @IBOutlet weak var characterStatus: UILabel!
    @IBOutlet weak var species: UILabel!
    @IBOutlet weak var type: UILabel!
    @IBOutlet weak var gender: UILabel!
    @IBOutlet weak var origin: UILabel!
    @IBOutlet weak var location: UILabel!
    
    //MARK: - IBActions
    
    //MARK: - Public api
    var selectedCharacter: CharacterViewModel?
    
    //MARK: - Private api
    
    private func setUpNavigationBar() {
        self.navigationItem.backBarButtonItem?.title = NSLocalizedString("Back", comment: "Title for character list table")
    }
    private lazy var seriesController: SeriesController = SeriesController()
    
    private func updateViewFromViewModel() {
        //TODO: fetch image
        if let imageUrl = self.selectedCharacter?.image {
            DispatchQueue.global().async {
                self.seriesController.fetchImage(withUrl: imageUrl) { [weak self] (uiImage, error, statusCode) in
                    //TODO: Handle error/status code
                    self?.characterImage.image = uiImage
                }
            }
        }
        self.characterName.text = self.selectedCharacter?.name ?? "-"
        self.characterStatus.text = self.selectedCharacter?.status?.rawValue ?? "-"
        self.species.text = self.selectedCharacter?.species ?? "-"
        self.type.text = self.selectedCharacter?.type ?? "-"
        self.gender.text = self.selectedCharacter?.gender?.rawValue ?? "-"
        self.origin.text = self.selectedCharacter?.origin?.name ?? "-"
        self.location.text = self.selectedCharacter?.location?.name ?? "-"
        
    }
    

}


