//
//  RequestProtocol.swift
//  MovieToGo
//
//  Created by Artem Tkachenko on 12/2/24.
//

import Foundation

protocol RequestProtocol {
    var host: String { get }
    var path: String { get }
    var apiVersion: ApiVersion { get }
    var httpMethod: HTTPMethod { get }
    var headers: [String: String] { get }
    var params: [String: Any] { get }
    var queryItems: [String: Any] { get }
}

extension RequestProtocol {
    var host: String {
        return ApiConstants.baseUrl
    }
    
    var params: [String: Any] {
        [:]
    }

    var urlParams: [String: Any] {
        [:]
    }

    var headers: [String: String] {
        [:]
    }

    func createUrlRequest(
        authToken: String
    ) throws -> URLRequest {
        let url = try createUrl()

        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = httpMethod.rawValue
        urlRequest.timeoutInterval = 10

        if !headers.isEmpty {
            urlRequest.allHTTPHeaderFields = headers
        }

        urlRequest.setValue("Bearer " + authToken, forHTTPHeaderField: "Authorization")
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")

        if !params.isEmpty {
            guard httpMethod != .get else {
                throw NetworkError.invalidRequest
            }

            guard let body = try? JSONSerialization.data(withJSONObject: params, options: []) else {
                throw NetworkError.invalidRequest
            }

            urlRequest.httpBody = body
        }

        return urlRequest
    }

    func createUrl() throws -> URL {
        var components = URLComponents()
        components.scheme = "https"
        components.host = host
        components.path = apiVersion.rawValue + path

        if !queryItems.isEmpty {
            components.queryItems = queryItems.map {
                URLQueryItem(name: $0.key, value: String(describing: $0.value))
            }
        }

        guard let url = components.url else {
            throw NetworkError.invalidURL
        }

        return url
    }
}
