//
//  ServiceInterface.swift
//  RickAndMorty
//
//  Created by Asha Chakrapani on 8/28/19.
//  Copyright © 2019 Asha Chakrapani. All rights reserved.
//

import Foundation

public class ServiceInterface {
    
    //MARK: - Completion Handlers
    public typealias ServiceInterfaceCompletion = (_ response: Data?, _ error: Error?, _ statusCode: Int?) -> Void
    
    //MARK: - Private Api
    private let defaultSession = URLSession(configuration: .default)
    private var dataTask: URLSessionDataTask?
    
    //MARK: - Public Api
    public static let sharedInstance = ServiceInterface()
    
    public func execute(urlString: String, queryString: String? = nil, onCompletion completion: @escaping ServiceInterfaceCompletion) {
        
        self.dataTask?.cancel()
        
        if var urlComponents = URLComponents(string: urlString), let url = urlComponents.url {
            urlComponents.query = queryString
            self.dataTask = self.defaultSession.dataTask(with: url) { [weak self] data, response, error in
                defer {
                    self?.dataTask = nil
                }
                DispatchQueue.main.async {
                    completion(data, error, (response as? HTTPURLResponse)?.statusCode)
                }
            }
            dataTask?.resume()
        }
    }
}
