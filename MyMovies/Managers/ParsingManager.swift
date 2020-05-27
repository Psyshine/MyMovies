//
//  ParsingManager.swift
//  MyMovies
//
//  Created by Andry Pro on 12.05.2020.
//  Copyright © 2020 Andry Pro. All rights reserved.
//

import Foundation

class ParsingManager {
    // MARK: - Public Methods
    func parsData(with data: Data, succes: ((Welcome) -> ())?, failure: ((ErrorHelper?) -> ())?) {
        let decoder = JSONDecoder()
        do {
            let response = try decoder.decode(Welcome.self, from: data)
            succes!(response)
        } catch let error {
            print(error)
            failure!(ErrorHelper.responseError)
        }
    }
}
