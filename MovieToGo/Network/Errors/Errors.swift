//
//  Errors.swift
//  MovieToGo
//
//  Created by Artem Tkachenko on 12/2/24.
//

import Foundation

enum NetworkError: LocalizedError {
    case invalidRequest
    case invalidURL
    case invalidResponse
    case parsingError
    case unauthorized
    case apiError(_ error: APIError)

    var errorDescription: String? {
        switch self {
        case .invalidRequest:
            return "Invalid request"
        case .invalidURL:
            return "Invalid URL"
        case .invalidResponse:
            return "Invalid response"
        case .unauthorized:
            return "Unauthorized"
        case .apiError(let error):
            return error.statusMessage
        case .parsingError:
            return "Parsing error"
        }
    }
}

struct APIError: Decodable {
    let statusCode: Int
    let statusMessage: String
    let success: Bool
}
