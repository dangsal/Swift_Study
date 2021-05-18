//
//  Model.swift
//  NewsApp_without_Storyboard
//
//  Created by 이성호 on 2021/05/18.
//

import Foundation


struct News: Codable {
    var status: String?
    var totalResults: Int?
    var articles: [Articles]?
}

struct Articles: Codable {
    var author: String?
    var title: String?
    var description: String?
    var url: String?
    var urlToImage: String?

}




