//
//  Movie.swift
//  MovieApp
//
//  Created by 이성호 on 2021/04/13.
//

import Foundation

struct Movie: Codable {
    var title: String?
    var rating: Double?
    var summary: String?
    var year: Int?
    var medium_cover_image: String?
}

struct MovieData: Codable {
    var movie_count: Int?
    var limit: Int?
    var page_number: Int?
    var movies: [Movie]?
}

struct MovieService: Codable {
    var status: String?
    var status_message: String?
    var data: MovieData
}
