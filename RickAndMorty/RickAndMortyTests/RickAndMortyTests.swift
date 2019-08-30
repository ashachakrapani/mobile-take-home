//
//  RickAndMortyTests.swift
//  RickAndMortyTests
//
//  Created by Asha Chakrapani on 8/30/19.
//  Copyright © 2019 Asha Chakrapani. All rights reserved.
//

import XCTest
@testable import RickAndMorty

class RickAndMortyTests: XCTestCase {
    
    private lazy var seriesController = SeriesController()
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    /// Asserts the api responses are of the required type
    func testFetchEpisodes() {
        self.seriesController.fetchEpisodes { (response) in
            if let _response = response {
                XCTAssert(_response as AnyObject is EpisodeListResponse)
            }
        }
    }
    
    func testFetchCharacters() {
        self.seriesController.fetchCharacterDetail(forIds: [1]) { (response) in
            if let _response = response {
                XCTAssert(_response as AnyObject is CharacterListResponse)
            }
        }
    }
    
    func testFetchImage() {
        let testImageUrlString = "https://rickandmortyapi.com/api/character/avatar/361.jpeg"
        self.seriesController.fetchImage(withUrl: URL(string: testImageUrlString)!) { (response, error, statusCode) in
            XCTAssert(response as AnyObject is UIImage)
        }
    }
    
    //TODO: - Tests for table view/cells
    
    
}
