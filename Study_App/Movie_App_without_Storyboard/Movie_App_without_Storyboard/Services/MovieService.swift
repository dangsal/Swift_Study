//
//  MovieService.swift
//  Movie_App_without_Storyboard
//
//  Created by 이성호 on 2021/05/19.
//

import Foundation

protocol MovieServiceProtocol {
    func MovieServiceProtocol(movies: [Movie])
}

class MovieService {
    
    var delegate : MovieServiceProtocol?
    
    let url = "https://yts-proxy.now.sh/list_movies.json"
    
    func fetchMovie(){
        if let url = URL(string: url){
            URLSession.shared.dataTask(with: url) { data, response, error in
                if let error = error {
                    print(error.localizedDescription)
                } else {
                    if let data = data {
                        do{
                            let movies = try JSONDecoder().decode(MovieDataAccess.self, from: data)
                            DispatchQueue.main.async {
                                self.delegate?.MovieServiceProtocol(movies: movies.data.movies!)
                            }
                        }catch {
                            print(error.localizedDescription)
                        }
                    }
                }
            }.resume()
        }
        
        
        
    }
}
