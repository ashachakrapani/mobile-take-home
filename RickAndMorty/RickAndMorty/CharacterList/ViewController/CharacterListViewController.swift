//
//  CharacterListViewController.swift
//  RickAndMorty
//
//  Created by Asha Chakrapani on 8/28/19.
//  Copyright © 2019 Asha Chakrapani. All rights reserved.
//

import UIKit

class CharacterListViewController: UIViewController {

    //MARK : - UIViewController overrides
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.estimatedRowHeight = 75
        self.tableView.rowHeight = UITableView.automaticDimension
        
        self.setUpNavigationBar()
    
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if ( segue.identifier == "CharacterDetailSegue") {
            if let characterDetailViewController = segue.destination as? CharacterDetailViewController {
                characterDetailViewController.selectedCharacter = self.selectedCharacter
            }
        }
    }
    
    //MARK : - IBOutlets
    @IBOutlet weak var tableView: UITableView!
    
    //MARK : - Public api
    var selectedEpisode: EpisodeViewModel? {
        didSet {
            //fetch character detail
            if let characterUrls = self.selectedEpisode?.characterUrls {
                let characterIds = self.getAllCharacterIds(characterUrls)
                self.fetchDetail(forCharacterIds: characterIds)
            }
        }
    }
    
    //MARK : - Private api
    private var characterListViewModel: CharacterListViewModel?
    private var selectedCharacter: CharacterViewModel?
    private lazy var seriesController: SeriesController = SeriesController()
    private let cellDateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        return dateFormatter
    }()
    
    private func setUpNavigationBar() {
        let episode = self.selectedEpisode?.episode ??  ""
        self.navigationItem.title = NSLocalizedString("\(episode) - Characters", comment: "Title for character list table")
    }
    
    private func fetchDetail(forCharacterIds ids: [Int]) {
        self.seriesController.fetchCharacterDetail(forIds: ids) { (characterListResponse) in
            if let characterList =  characterListResponse?.results {
                self.characterListViewModel = CharacterListViewModel.init(with: characterList)
                self.characterListViewModel?.sorted()
                self.tableView.reloadData()
            }
        }
    }
    
    private func getAllCharacterIds(_ urls: [URL]) -> [Int] {
        return urls.map({ Int($0.lastPathComponent )}).compactMap({ $0 })
    }
}

//MARK: - UITableViewDataSource, UITableViewDelegate extension

extension CharacterListViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.characterListViewModel?.characters?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "CharacterCell", for: indexPath) as! CharacterTableViewCell
        cell.resetCell()
        
        let character = self.characterListViewModel?.characters?[indexPath.row]
        cell.characterName.text = character?.name
        
        let status = character?.status ?? CharacterStatus.unknown
        cell.status.text = status.rawValue
        if let _createdDate = character?.createdDate {
            cell.createdDate.text = self.cellDateFormatter.string(from: _createdDate)
        }
        
        if let imageUrl = character?.image {
            DispatchQueue.global().async {
                self.seriesController.fetchImage(withUrl: imageUrl) { (uiImage, error, statusCode) in
                    //TODO: Handle error/status code
                    cell.characterImage.image = uiImage
                }
            }
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let character = self.characterListViewModel?.characters?[indexPath.row] {
            self.selectedCharacter = character
            self.performSegue(withIdentifier: "CharacterDetailSegue", sender: self)
        }
    }
}
