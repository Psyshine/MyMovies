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
    
//    let queryItems = [NSURLQueryItem(name: "id", value: "2121"), NSURLQueryItem(name: "id", value: "3232")]
//    let urlComps = NSURLComponents(string: "www.apple.com/help")!
//    urlComps.queryItems = queryItems
//    let URL = urlComps.URL!
    
 
    let queryItems = [NSURLQueryItem(name: "api_key", value: "a450b29fc995d088c8cbde0f9d1b910d")]
    let urlComps = NSURLComponents(string: "https://api.themoviedb.org/3/discover/movie")!
    
   static let shared = NetworkManager()
   
    // MARK: - Public Methods
    func fetchData(with complition: @escaping([Welcome]) -> Void) {
        stringUrl.append("&\(key)=\(value)")
    
        
        guard let url = URL(string: stringUrl) else { return }
        
        let session = URLSession.shared
        var reguest = URLRequest(url: url)
        
        
       

        session.dataTask(with: reguest) { (data, response, error) in
            guard let data = data else { return }
            let decoder = JSONDecoder()
            do {
                print(data)
                print(response)
                let response = try decoder.decode(Welcome.self, from: data)
                print(response )
                var movies: [Welcome] = []
                movies.append(response)
                complition(movies)
               
            } catch let error {
                print(error)
            }
        }.resume()
    }
}
