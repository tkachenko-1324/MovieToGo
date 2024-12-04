//
//  DataParserProtocol.swift
//  MovieToGo
//
//  Created by Artem Tkachenko on 12/3/24.
//

import Foundation

protocol DataParserProtocol {
    func parse<T: Decodable>(data: Data) throws -> T
}
