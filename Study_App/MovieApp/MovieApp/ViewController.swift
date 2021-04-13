//
//  ViewController.swift
//  MovieApp
//
//  Created by 이성호 on 2021/04/13.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var tableView: UITableView!
    
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

    }
}


