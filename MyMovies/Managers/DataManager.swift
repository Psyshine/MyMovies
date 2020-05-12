//
//  DataManager.swift
//  MyMovies
//
//  Created by Andry Pro on 12.05.2020.
//  Copyright © 2020 Andry Pro. All rights reserved.
//

import Foundation

class DataManager {
    
    private let parsingManager = ParsingManager()
    private var movies = [Result]()
    
    func getMovies() -> [Result]{
        parsingManager.fetchMovie { (welcome) in
            print(welcome.results)
            self.movies = welcome.results
        }
        return movies
    }
}
