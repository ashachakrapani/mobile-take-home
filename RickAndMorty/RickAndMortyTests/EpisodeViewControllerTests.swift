//
//  EpisodeViewControllerTests.swift
//  RickAndMortyTests
//
//  Created by Asha Chakrapani on 8/30/19.
//  Copyright © 2019 Asha Chakrapani. All rights reserved.
//


import XCTest
@testable import RickAndMorty

class EpisodeViewControllerTests: XCTestCase {
    
    private var viewController: EpisodesViewController!
    var tableView: UITableView!
    var dataSource: UITableViewDataSource!
    var delegate: UITableViewDelegate!
    
    override func setUp() {
        super .setUp()
        guard let vc = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "EpisodeViewController") as? EpisodesViewController else { return XCTFail("Test failed while instanting view controller from storyboard") }
        self.viewController = vc
        self.viewController.loadViewIfNeeded()
        self.tableView = self.viewController?.tableView
        self.dataSource = self.viewController.tableView.dataSource
        self.delegate = self.viewController.tableView.delegate
    }
    
    override func tearDown() {
        super .tearDown()
    }
    
    //Asserts view controller is instantiated
    func testViewControllerNotNil() {
        XCTAssertNotNil(self.viewController)
    }
    
    //Asserts table view is loaded
    func testTableViewOutletNotNil() {
        XCTAssertNotNil(self.tableView)
    }
    
    //Asserts the table cell has the right identifier
    func testTableHasCellWithIdentifier() {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "EpisodeCell")
        XCTAssertNotNil(cell, "Episode cell identifier verified")
    }
    
}
