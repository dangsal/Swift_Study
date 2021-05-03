//
//  PokemonService.swift
//  PokemonDoGam
//
//  Created by 이성호 on 2021/05/03.
//

import Foundation


class PokemonService {
    let url = "https://pokemon.treduler.pro/"
    
    func fetchPokemon(){
        if let url = URL(string: url) {
            URLSession.shared.dataTask(with: url) { data, response, error in
                if let error = error {
                    print("에러가 발생했습니다.")
                    print(error.localizedDescription)
                } else {
                    if let data = data {
                        do {
                            let pokemons = try JSONDecoder().decode([Pokemon].self, from: data)
                            print(pokemons)
                        } catch let error {
                            print("에러가 발생했습니다.")
                            print(error.localizedDescription)
                        }
                    }
                }
            }.resume()
        }
    }
}
