//
//  ViewController.swift
//  MovieApp
//
//  Created by 이성호 on 2021/04/13.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var collectionView: UICollectionView!
    
    
    var model = MovieModel()
    var movie = [Movie]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        model.delegate = self
        model.getMovie()
    }


}


extension ViewController: MovieModelProtocol{
    func movieRetrieved(movies: [Movie]) {
        print("movies를 model 에서 가져옴")
        self.movie = movies
        collectionView.reloadData()

    }
}

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movie.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CustomCollectionViewCell
        let new = self.movie[indexPath.row]
        
        cell.displayMovie(movie: new)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
}

