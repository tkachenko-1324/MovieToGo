//
//  RequestManagerProtocol.swift
//  MovieToGo
//
//  Created by Artem Tkachenko on 12/3/24.
//

protocol RequestManagerProtocol {
  func perform<T: Decodable>(_ request: RequestProtocol) async throws -> T
}
