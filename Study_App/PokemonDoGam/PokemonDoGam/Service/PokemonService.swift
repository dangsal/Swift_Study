//
//  PokemonService.swift
//  PokemonDoGam
//
//  Created by 이성호 on 2021/05/03.
//

import Foundation

protocol PokemonServiceProtocol {
    func pokemonService(pokemons:[Pokemon])
}


class PokemonService {
    let url = "https://pokemon.treduler.pro/"
    
    var delegate: PokemonServiceProtocol?
    
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
                            DispatchQueue.main.async {
                                self.delegate?.pokemonService(pokemons: pokemons)
                            }
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
