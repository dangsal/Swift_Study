//
//  MovieDetailViewController.swift
//  Movie_App_without_Storyboard
//
//  Created by 이성호 on 2021/05/24.
//

import UIKit

class MovieDetailViewController : UIViewController {
    //MARK: Property
    
    var movie: Movie?{
        didSet{
            configureMovie()
        }
    }
    
    //MARK: Init
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }
    
    //MARK: Configure
    func configureView(){
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.tintColor = .white
    }
    
    func configureMovie(){
        guard let movie = self.movie else {return}
        self.title = movie.title?.uppercased()
    }
}
