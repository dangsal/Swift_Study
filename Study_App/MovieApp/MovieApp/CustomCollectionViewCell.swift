//
//  CustomCollectionViewCell.swift
//  MovieApp
//
//  Created by 이성호 on 2021/04/13.
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var movieImage: UIImageView!
    @IBOutlet var movieYear: UILabel!
    @IBOutlet var movieTitle: UILabel!
    
    var movieDisplay: Movie?
    
    func displayMovie(movie: Movie){
        
        movieImage.alpha = 0
        movieYear.alpha = 0
        movieTitle.alpha = 0
        

        
        
        movieDisplay = movie
        
        movieTitle.text = movieDisplay!.title
        movieYear.text = String(movieDisplay!.year!)
        
        
        UIView.animate(withDuration: 0.6, delay: 0, options: .curveEaseOut, animations: {
            self.movieYear.alpha = 1
            self.movieTitle.alpha = 1
        } , completion: nil)

        
        guard movieDisplay!.medium_cover_image != nil else{return}
        let urlString = movieDisplay!.medium_cover_image!
        let url = URL(string: urlString)
        
        guard url != nil else {return}
        let session = URLSession.shared
        
        let dataTask = session.dataTask(with: url!) { (data, response, error) in
            if(error == nil && data != nil){
                if(self.movieDisplay!.medium_cover_image == urlString){
                    DispatchQueue.main.async {
                        self.movieImage.image = UIImage(data: data!)
                        UIView.animate(withDuration: 0.6, delay: 0, options: .curveEaseOut, animations: { self.movieImage.alpha = 1}, completion: nil)
                    }
                }
            }
        }
        dataTask.resume()
        
    }
}
