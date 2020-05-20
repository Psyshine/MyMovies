//
//  DataManager.swift
//  MyMovies
//
//  Created by Andry Pro on 12.05.2020.
//  Copyright © 2020 Andry Pro. All rights reserved.
//

import Foundation

class DataManager {
    // MARK: - Private Properties
    private let parsingManager = ParsingManager()
    private let networkManager = NetworkManager()
    private var movies = [Result]()
    
    // MARK: - Public Methods
    func getMovies(with pageNumber: Int,succes: (([Result]) -> ())?, failure: ((Error?) -> ())?) {
        networkManager.fetchData(with: pageNumber, success: { (data) in
            guard let data = data else { return }

            self.parsingManager.parsData(with: data, succes: { (welcome) in
                 let welcome = welcome
                self.movies.append(contentsOf: welcome.results)
            }) { (error) in
                print(error)
            }
            succes?(self.movies)
        }) { (error) in
            failure?(error)
        }
    }
}
