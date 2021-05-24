//
//  Movie.swift
//  Movie_App_without_Storyboard
//
//  Created by 이성호 on 2021/05/19.
//

import Foundation

struct MovieDataAccess: Codable {
    var status: String?
    var status_message: String?
    var data: MovieData
}


struct MovieData: Codable {
    var movie_count: Int?
    var limit: Int?
    var page_number: Int?
    var movies: [Movie]?
}


struct Movie: Codable {
    var title: String?
    var rating: Double?
    var summary: String?
    var year: Int?
    var background_image: String?
    var medium_cover_image: String?
    var url: String?
    var genres: [String]?
}
