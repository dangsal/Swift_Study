//
//  News.swift
//  NewsApp
//
//  Created by 이성호 on 2021/04/07.
//

import Foundation


struct News: Codable {
    var author: String?
    var title: String?
    var description: String?
    var url: String?
    var urlToImage: String?
}
