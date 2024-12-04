//
//  Constants.swift
//  MovieToGo
//
//  Created by Artem Tkachenko on 12/2/24.
//

enum ApiConstants {
    static let baseUrl = "api.themoviedb.org"
    static let imageStoreUrl = "https://image.tmdb.org/t/p/w500"
    static let apiKey = "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI4MDAzZmFiOWU5OTM3ZjdhMDVhNzVkYmQzOGJmOTE1OSIsIm5iZiI6MTY1Mzk4MzM2OS42OTIsInN1YiI6IjYyOTVjODg5ZjhlOTgyMDA2N2ViNGVkYiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.HH9wkPE_6OWSr68pRJuJKYeOSjQRtLh9qRwGmZaHjc8"
    static let accountId: Int = 12521718
}

enum ApiVersion: String {
    case v3 = "/3/"
}
