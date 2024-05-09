//
//  TV.swift
//  MyMovie
//
//  Created by 민지은 on 2024/05/09.
//

import Foundation

struct TVModel: Hashable, Decodable {
    let results: [TV]
}

struct TV: Hashable, Decodable {
    let name: String
    let poster_path: String?
    let overview: String
    let id: Int
}

