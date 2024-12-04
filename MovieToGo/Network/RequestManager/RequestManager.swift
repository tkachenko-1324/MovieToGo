//
//  RequestManager.swift
//  MovieToGo
//
//  Created by Artem Tkachenko on 12/3/24.
//


final class RequestManager: RequestManagerProtocol {
    let apiManager: APIManagerProtocol
    let parser: DataParserProtocol

    private var apiKey: String {
        return ApiConstants.apiKey
    }

    init(
        apiManager: APIManagerProtocol = ApiManager(),
        parser: DataParserProtocol = DataParser()
    ) {
        self.apiManager = apiManager
        self.parser = parser
    }

    func perform<T>(
        _ request: any RequestProtocol
    ) async throws -> T where T : Decodable {
        let data = try await apiManager.perform(request, authToken: apiKey)
        let decoded: T = try parser.parse(data: data)
        return decoded
    }
}
