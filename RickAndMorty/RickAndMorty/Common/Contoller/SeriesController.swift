//
//  SeriesController.swift
//  RickAndMorty
//
//  Created by Asha Chakrapani on 8/28/19.
//  Copyright © 2019 Asha Chakrapani. All rights reserved.
//

import Foundation
import UIKit

public class SeriesController {
    
    typealias EpisodeFetchCompletion = (_ episodeFetchResponse: EpisodeListResponse?) -> Void
    typealias CharacterFetchCompletion = (_ characterFetchResponse: CharacterListResponse?) -> Void
    typealias ImageFetchCompletion = (_ image: UIImage?, _ error: Error?, _ statusCode: Int) -> Void
    
    // Fetches all episodes
    func fetchEpisodes(_ completionHandler: @escaping EpisodeFetchCompletion) {
        ServiceInterface.sharedInstance.execute(urlString: Routes.Episode.episodes) { (data, error, statusCode) in
            if let _data = data {
                let response = try? JSONDecoder().decode(EpisodeListResponse.self, from: _data)
                completionHandler(response)
            }
        }
    }
    
    //Fetches all characters give
    func fetchCharacterDetail(forIds ids: [Int], _ completionHandler: @escaping CharacterFetchCompletion) {
        ServiceInterface.sharedInstance.execute(urlString: Routes.Character.details, queryString: "\(ids)") { (data, error, statusCode) in
            if let _data = data {
                let response = try? JSONDecoder().decode(CharacterListResponse.self, from: _data)
                completionHandler(response)
            }
        }
    }
    
    //Fetches image
    func fetchImage(withUrl url: URL, _ completionHandler: @escaping ImageFetchCompletion) {
        ServiceInterface.sharedInstance.execute(urlString: url.absoluteString) { (response, error, statusCode) in
            let image = (response != nil) ? UIImage(data: response!) : nil
            completionHandler(image, error, statusCode ?? -1)
        }
    }
}
