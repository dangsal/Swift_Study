//
//  NewsService.swift
//  NewsApp
//
//  Created by 이성호 on 2021/04/07.
//

import Foundation

struct NewsService: Codable {
    var status: String?
    var totalResults: Int?
    var articles: [News]?
}
