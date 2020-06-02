//
//  DataManager.swift
//  MyMovies
//
//  Created by Andry Pro on 11.05.2020.
//  Copyright © 2020 Andry Pro. All rights reserved.
//

import Foundation

class NetworkManager {
    
    // MARK: - Private Properties
    private var stringUrl = "https://api.themoviedb.org/3/discover/movi"
    private let apiKey = "a450b29fc995d088c8cbde0f9d1b910d"
    
    // MARK: - Public Methods
    //    func fetchData(with pageNumber: Int, success: @escaping (_ response: Data?) -> Void, or failure: @escaping (_ error: ErrorHelper) -> Void) {
    //        let queryItems = [URLQueryItem(name:  "api_key", value: apiKey),
    //                          URLQueryItem(name: "page", value: String(pageNumber))]
    //        var urlComps = URLComponents(string: stringUrl)!
    //        urlComps.queryItems = queryItems
    //        let result = urlComps.url!
    //        let session = URLSession.shared
    //        let reguest = URLRequest(url: result)
    //        session.dataTask(with: reguest) { (data, response, error) in
    //
    //                if let httpResponse = response as? HTTPURLResponse {
    //                    switch httpResponse.statusCode {
    //                    case 200...299:
    //                        success(data)
    //                        return
    //                    case 400...451:
    //                        failure(ErrorHelper.internetError)
    //                        print(ErrorHelper.internetError)
    //                        return
    //                    case 500...511:
    //                        failure(ErrorHelper.serverError)
    //                        print(ErrorHelper.serverError)
    //                        return
    //                    default:
    //                        failure(ErrorHelper.responseError)
    //                        print(ErrorHelper.responseError)
    //                        return
    //                }
    //            }
    //            success(data)
    //        }.resume()
    //    }
    func fetchData(with pageNumber: Int, success: @escaping (_ response: Data?) -> Void, or failure: @escaping (_ error: ErrorHelper) -> Void) {
        let queryItems = [URLQueryItem(name:  "api_key", value: apiKey),
                          URLQueryItem(name: "page", value: String(pageNumber))]
        var urlComps = URLComponents(string: stringUrl)!
        urlComps.queryItems = queryItems
        let result = urlComps.url!
        let session = URLSession.shared
        let reguest = URLRequest(url: result)
        session.dataTask(with: reguest) { (data, response, error) in
            if let error = error as NSError? {
                switch error.code {
                    
                case 200...299:
                    return
                case 400...451:
                    failure(ErrorHelper.internetError)
                    print(ErrorHelper.internetError)
                    return
                case 500...511:
                    failure(ErrorHelper.serverError)
                    print(ErrorHelper.serverError)
                    return
                default:
                    failure(ErrorHelper.responseError)
                    print(ErrorHelper.responseError)
                    return
                }
            }
            success(data)
        }.resume()
    }
}


   

