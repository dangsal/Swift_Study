//
//  MovieModel.swift
//  MovieApp
//
//  Created by 이성호 on 2021/04/13.
//

import Foundation

protocol MovieModelProtocol {
    func movieRetrieved(movies: [Movie])
}

class MovieModel {
    
    var delegate: MovieModelProtocol?
    
    func getMovie(){
        
        let urlString = "https://yts.mx/api/v2/list_movies.json"
        let url = URL(string: urlString)
        
        guard url != nil else {return}
        let session = URLSession.shared
        let dataTask = session.dataTask(with: url!) { (data, response, error) in
            if error == nil && data != nil {
                let decoder = JSONDecoder()
                do{
                    let movieService = try decoder.decode(MovieService.self, from: data!)
                    DispatchQueue.main.async {
                        self.delegate?.movieRetrieved(movies: movieService.data.movies!)
                    }
                }catch{
                    print(error.localizedDescription)
                }
            }
        }
        dataTask.resume()
        
    }
}
