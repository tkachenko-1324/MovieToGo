//
//  PaginationResponse.swift
//  MovieToGo
//
//  Created by Artem Tkachenko on 12/3/24.
//

struct PaginationResponse<T: Decodable>: Decodable {
    let page: Int
    let results: T
    let totalPages: Int
    let totalResults: Int
}
