//
//  ParsingManager.swift
//  MyMovies
//
//  Created by Andry Pro on 12.05.2020.
//  Copyright © 2020 Andry Pro. All rights reserved.
//

import Foundation

class ParsingManager {
    
    // MARK: - Private Properties
    private let networkManager = NetworkManager()
    
    // MARK: - Public Methods
    func fetchMovie(with complition:@escaping(Welcome) -> Void) {
        _ = networkManager.fetchData(with: { (data) in
            let decoder = JSONDecoder()
            do {
                let response = try decoder.decode(Welcome.self, from: data!)
                complition(response)
            } catch let error {
                print(error)
                // add alert controller?
            }
        }) { (error) in
            // add alert controller?
        }
    }
}
