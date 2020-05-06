//
//  NetworkManager.swift
//  MyMovies
//
//  Created by Andry Pro on 31.03.2020.
//  Copyright © 2020 Andry Pro. All rights reserved.
//

import Foundation

class NetworkManager {
    // MARK: - Private Properties
    private var stringUrl = "https://api.themoviedb.org/3/discover/movie"
    let key = "api_key"
    let value = "a450b29fc995d088c8cbde0f9d1b910d"
    private let urlParams = [
        "api_key": "a450b29fc995d088c8cbde0f9d1b910d"
    ]
    
    let queryItems = [NSURLQueryItem(name: "api_key", value: "a450b29fc995d088c8cbde0f9d1b910d")]
    let urlComps = NSURLComponents(string: "https://api.themoviedb.org/3/discover/movie")!
   
   static let shared = NetworkManager()
   
    // MARK: - Public Methods
    func fetchData(with complition: @escaping([Result]) -> Void) {
        let queryItems = [URLQueryItem(name: "api_key", value: "a450b29fc995d088c8cbde0f9d1b910d")]
        var urlComps = URLComponents(string: "https://api.themoviedb.org/3/discover/movie")!
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
