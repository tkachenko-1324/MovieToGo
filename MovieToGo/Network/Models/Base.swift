//
//  Base.swift
//  MovieToGo
//
//  Created by Artem Tkachenko on 12/4/24.
//

struct BaseResponse: Decodable {
    let statusCode: Int
    let statusMessage: String
}
