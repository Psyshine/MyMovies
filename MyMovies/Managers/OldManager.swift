//
//  NetworkManager.swift
//  MyMovies
//
//  Created by Andry Pro on 31.03.2020.
//  Copyright © 2020 Andry Pro. All rights reserved.
//

import Foundation

class OldManager {
    // MARK: - Private Properties
    private var stringUrl = "https://api.themoviedb.org/3/discover/movie"
   
    private let apiKey = "a450b29fc995d088c8cbde0f9d1b910d"
    private let pagesCount = 1

   
   static let shared = OldManager()
   
    // MARK: - Public Methods
    func fetchData(with complition: @escaping([Result]) -> Void) {
        // TODO: add failure complition
        let queryItems = [URLQueryItem(name:  "api_key", value: apiKey),
                          URLQueryItem(name: "page", value: String(pagesCount))]
        var urlComps = URLComponents(string: stringUrl)!
        urlComps.queryItems = queryItems
        let result = urlComps.url!
       
        let session = URLSession.shared
        let reguest = URLRequest(url: result)
        session.dataTask(with: reguest) { (data, response, error) in
            
            guard let data = data else { return }
          
            let decoder = JSONDecoder()
            do {
                let response = try decoder.decode(Welcome.self, from: data)
                var movies: [Result] = []
                movies = response.results
                complition(movies)
               
            } catch let error {
                print(error)
            }
        }.resume()
    }
}
