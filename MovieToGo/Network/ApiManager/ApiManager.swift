//
//  ApiManager.swift
//  MovieToGo
//
//  Created by Artem Tkachenko on 12/3/24.
//

import Foundation

final class ApiManager: APIManagerProtocol {

    private let urlSession: URLSession

    init(
        urlSession: URLSession = URLSession.shared
    ) {
        self.urlSession = urlSession
    }

    func perform(
        _ request: any RequestProtocol,
        authToken: String
    ) async throws -> Data {
        let urlRequest = try request.createUrlRequest(authToken: authToken)

        let (data, response) = try await urlSession.data(for: urlRequest)

        guard let httpResponse = response as? HTTPURLResponse else {
            throw NetworkError.invalidResponse
        }

        switch httpResponse.statusCode {
        case 200...299:
            return data
        case 401:
            throw NetworkError.unauthorized
        default:
            throw NetworkError.invalidURL
        }
    }
}
