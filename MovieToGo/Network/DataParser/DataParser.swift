//
//  DataParser.swift
//  MovieToGo
//
//  Created by Artem Tkachenko on 12/3/24.
//

import Foundation

final class DataParser: DataParserProtocol {
    private var defaultDecoder: JSONDecoder {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }

    func parse<T>(
        data: Data
    ) throws -> T where T : Decodable {
        guard let error = try? defaultDecoder.decode(APIError.self, from: data), !error.success else {
            do {
                return try defaultDecoder.decode(T.self, from: data)
            } catch {
                throw NetworkError.parsingError
            }
        }

        throw NetworkError.apiError(error)
    }
}
