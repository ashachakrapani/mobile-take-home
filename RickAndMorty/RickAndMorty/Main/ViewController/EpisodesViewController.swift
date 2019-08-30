//
//  ViewController.swift
//  RickAndMorty
//
//  Created by Asha Chakrapani on 8/28/19.
//  Copyright © 2019 Asha Chakrapani. All rights reserved.
//

import UIKit

class EpisodesViewController: UIViewController {

    //MARK: - UIViewController overrides
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.estimatedRowHeight = 75
        self.tableView.rowHeight = UITableView.automaticDimension
        
        self.setUpNavigationBar()
        
        self.fetchEpisodes()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if ( segue.identifier == "CharacterListSegue") {
            if let characterListViewController = segue.destination as? CharacterListViewController {
                characterListViewController.selectedEpisode = self.selectedEpisode
            }
        }
    }
    
    //MARK: - IBOutlets
    @IBOutlet weak var tableView: UITableView!
    
    
    //MARK: - Private api
    private var episodeListViewModel: EpisodeListViewModel?
    private var selectedEpisode: EpisodeViewModel?
    private lazy var seriesController: SeriesController = SeriesController()
    
    private func setUpNavigationBar() {
        self.navigationItem.title = NSLocalizedString("Episodes", comment: "Title for episodes table")
        let backItem = UIBarButtonItem()
        backItem.title = NSLocalizedString("Back", comment: "Back button title")
        self.navigationItem.backBarButtonItem = backItem
    }
    
    private func fetchEpisodes() {
        self.seriesController.fetchEpisodes { (episodeListResponse) in
            if let episodesList = episodeListResponse?.results {
                self.episodeListViewModel = EpisodeListViewModel.init(with: episodesList)
                self.tableView.reloadData()
            }
        }
    }
}

//MARK: - UITableViewDataSource, UITableViewDelegate extension

extension EpisodesViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.episodeListViewModel?.episodes?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "EpisodeCell", for: indexPath) as! EpisodeTableViewCell
        cell.resetCell()
        
        let episodeViewModel = self.episodeListViewModel?.episodes?[indexPath.row]
        cell.episodeNumberLabel.text = episodeViewModel?.episode
        cell.episodeNameLabel.text = episodeViewModel?.title
        cell.isUserInteractionEnabled = false
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let episode = self.self.episodeListViewModel?.episodes?[indexPath.row] {
            self.selectedEpisode = episode
            self.performSegue(withIdentifier: "CharacterListSegue", sender: self)
        }
    }
}
