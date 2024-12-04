//
//  MoviesRequest.swift
//  MovieToGo
//
//  Created by Artem Tkachenko on 12/2/24.
//

enum MovieRequests: RequestProtocol {
    case getPopular(page: Int)
    case getMovie(_ id: Int)

    var path: String {
        switch self {
        case .getPopular:
            return "movie/popular"
        case .getMovie(let id):
            return "movie/\(id)"
        }
    }

    var apiVersion: ApiVersion {
        return .v3
    }

    var httpMethod: HTTPMethod {
        switch self {
        case .getPopular, .getMovie:
            return .get
        }
    }

    var queryItems: [String : Any] {
        switch self {
        case .getPopular(let page):
            return [
                "language": "en-US",
                "page": page
            ]
        case .getMovie:
            return [
                "language": "en-US",
            ]
        }
    }
}
