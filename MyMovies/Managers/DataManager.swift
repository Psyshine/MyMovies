//
//  DataManager.swift
//  MyMovies
//
//  Created by Andry Pro on 11.05.2020.
//  Copyright © 2020 Andry Pro. All rights reserved.
//

import Foundation

class DataManager {
    
    private var stringUrl = "https://api.themoviedb.org/3/discover/movi"
      
       private let apiKey = "a450b29fc995d088c8cbde0f9d1b910d"
       private let pagesNumber = 1

      
      
      
       // MARK: - Public Methods
    func fetchData(with success: @escaping (_ response: Data?) -> Void,or failure: @escaping (_ error: Error?) -> Void) {
        let queryItems = [URLQueryItem(name:  "api_key", value: apiKey),
                          URLQueryItem(name: "page", value: String(pagesNumber))]
        var urlComps = URLComponents(string: stringUrl)!
        urlComps.queryItems = queryItems
       let result = urlComps.url!
        
        let session = URLSession.shared
        let reguest = URLRequest(url: result)
        
        session.dataTask(with: reguest) { (data, response, error) in
            print(error)
           if let error = error {
           
                failure(error)
                return
            }
            success(data)
        }.resume()
    }
        
    }


   

