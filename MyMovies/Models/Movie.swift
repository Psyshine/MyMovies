//
//  Movie.swift
//  MyMovies
//
//  Created by Andry Pro on 31.03.2020.
//  Copyright © 2020 Andry Pro. All rights reserved.
//

import Foundation

// MARK: - Welcome
//struct Welcome: Decodable {
//    let adult: Bool
//    let backdropPath: String
//
//    let budget: Int
//    let genres: [Genre]
//    let homepage: String
//    let id: Int
//    let imdbID, originalLanguage, originalTitle, overview: String
//    let popularity: Double
//    let posterPath: String
//    let productionCompanies: [ProductionCompany]
//    let productionCountries: [ProductionCountry]
//    let releaseDate: String
//    let revenue, runtime: Int
//    let spokenLanguages: [SpokenLanguage]
//    let status, tagline, title: String
//    let video: Bool
//    let voteAverage: Double
//    let voteCount: Int
//
//    enum CodingKeys: String, CodingKey {
//        case adult
//        case backdropPath = "backdrop_path"
//
//        case budget, genres, homepage, id
//        case imdbID = "imdb_id"
//        case originalLanguage = "original_language"
//        case originalTitle = "original_title"
//        case overview, popularity
//        case posterPath = "poster_path"
//        case productionCompanies = "production_companies"
//        case productionCountries = "production_countries"
//        case releaseDate = "release_date"
//        case revenue, runtime
//        case spokenLanguages = "spoken_languages"
//        case status, tagline, title, video
//        case voteAverage = "vote_average"
//        case voteCount = "vote_count"
//    }
//}
//
//// MARK: - Genre
//struct Genre: Codable {
//    let id: Int
//    let name: String
//}
//
//// MARK: - ProductionCompany
//struct ProductionCompany: Codable {
//    let id: Int
//    let logoPath: String?
//    let name, originCountry: String
//
//    enum CodingKeys: String, CodingKey {
//        case id
//        case logoPath = "logo_path"
//        case name
//        case originCountry = "origin_country"
//    }
//}
//
//// MARK: - ProductionCountry
//struct ProductionCountry: Codable {
//    let iso3166_1, name: String
//
//    enum CodingKeys: String, CodingKey {
//        case iso3166_1 = "iso_3166_1"
//        case name
//    }
//}
//
//// MARK: - SpokenLanguage
//struct SpokenLanguage: Codable {
//    let iso639_1, name: String
//
//    enum CodingKeys: String, CodingKey {
//        case iso639_1 = "iso_639_1"
//        case name
//    }
//}

// MARK: - Welcome
struct Welcome: Codable {
    let page, totalResults, totalPages: Int
    let results: [Result]

    enum CodingKeys: String, CodingKey {
        case page
        case totalResults = "total_results"
        case totalPages = "total_pages"
        case results
    }
}

// MARK: - Result
struct Result: Codable {
    let popularity: Double
    let voteCount: Int
    let video: Bool
    let posterPath: String
    let id: Int
    let adult: Bool
    let backdropPath: String?
    let originalLanguage: OriginalLanguage
    let originalTitle: String
    let genreIDS: [Int]
    let title: String
    let voteAverage: Double
    let overview, releaseDate: String

    enum CodingKeys: String, CodingKey {
        case popularity
        case voteCount = "vote_count"
        case video
        case posterPath = "poster_path"
        case id, adult
        case backdropPath = "backdrop_path"
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case genreIDS = "genre_ids"
        case title
        case voteAverage = "vote_average"
        case overview
        case releaseDate = "release_date"
    }
}

enum OriginalLanguage: String, Codable {
    case en = "en"
    case es = "es"
    case ja = "ja"
    case ko = "ko"
    case tl = "tl"
    case zh = "zh"
    case fr = "fr"
    case de = "de"
    case it = "it"
    case cn = "cn"
    case id = "id"
    case ru = "ru"
    case `is` = "is"
}

