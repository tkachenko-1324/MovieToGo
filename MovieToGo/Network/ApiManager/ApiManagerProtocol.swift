//
//  ApiManagerProtocol.swift
//  MovieToGo
//
//  Created by Artem Tkachenko on 12/3/24.
//

import Foundation

protocol APIManagerProtocol {
  func perform(_ request: RequestProtocol, authToken: String) async throws -> Data
}
