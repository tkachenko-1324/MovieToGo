//
//  MovieResponse.swift
//  MovieToGo
//
//  Created by Artem Tkachenko on 12/3/24.
//

import Foundation

struct MovieResponse: Decodable {
    let adult: Bool
    let backdropPath: String?
    let id: Int
    let originalLanguage: String
    let originalTitle: String
    let overview: String
    let popularity: Double
    let posterPath: String
    let releaseDate: String
    let title: String
    let video: Bool
    let voteAverage: Double
    let voteCount: Int
}
