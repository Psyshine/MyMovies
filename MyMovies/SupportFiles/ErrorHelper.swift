//
//  ErrorHelper.swift
//  MyMovies
//
//  Created by Andry Pro on 25.05.2020.
//  Copyright © 2020 Andry Pro. All rights reserved.
//

import Foundation

enum ErrorHelper {
    case serverError
    case responseError
    case internetError
}

extension ErrorHelper: LocalizedError {
    
    var errorDescription: String? {
            switch self {
            case .serverError, .responseError:
                return "Error"
            case .internetError:
                return "No Internet Connection"
            }
        }
    
        var failureReason: String? {
            switch self {
            case .serverError, .responseError:
                return "Something went wrong"
            case .internetError:
                return nil
            }
        }
    
        var recoverySuggestion: String? {
            switch self {
            case .serverError, .responseError:
                return "Please, try again"
            case .internetError:
                return "Please check your internet connection and try again"
            }
        }
}
