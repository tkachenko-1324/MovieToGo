//
//  Movie.swift
//  MovieToGo
//
//  Created by Artem Tkachenko on 12/3/24.
//

import Foundation

struct Movie: Identifiable {
    let id: Int
    let title: String
    let overview: String
    let posterUrl: URL?
    let backdropUrl: URL?
    let releaseDate: String
    let voteAverage: Double

    init(
        id: Int,
        title: String,
        overview: String,
        posterUrl: URL?,
        backdropUrl: URL?,
        releaseDate: String,
        voteAverage: Double
    ) {
        self.id = id
        self.title = title
        self.overview = overview
        self.posterUrl = posterUrl
        self.backdropUrl = backdropUrl
        self.releaseDate = releaseDate
        self.voteAverage = voteAverage
    }

    init(
        response: MovieResponse
    ) {
        self.id = response.id
        self.title = response.title
        self.overview = response.overview
        
        let posterUrl = ApiConstants.imageStoreUrl + response.posterPath
        self.posterUrl = URL(string: posterUrl)

        let backdropPath = ApiConstants.imageStoreUrl + (response.backdropPath ?? "")
        self.backdropUrl = URL(string: backdropPath)

        self.releaseDate = response.releaseDate
        self.voteAverage = response.voteAverage
    }
}
