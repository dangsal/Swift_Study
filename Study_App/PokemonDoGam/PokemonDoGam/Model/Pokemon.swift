//
//  pokemon.swift
//  PokemonDoGam
//
//  Created by 이성호 on 2021/05/03.
//

import Foundation


struct Pokemon:Codable {
    var name: String?
    var imageUrl: String?
    var id: Int?
    var weight: Int?
    var height: Int?
    var defense: Int?
    var attack: Int?
    var description: String?
    var type: String?
    var baseExperience: Int?
}
