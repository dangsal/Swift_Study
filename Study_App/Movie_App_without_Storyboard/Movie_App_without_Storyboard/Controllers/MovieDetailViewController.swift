//
//  MovieDetailViewController.swift
//  Movie_App_without_Storyboard
//
//  Created by 이성호 on 2021/05/24.
//

import UIKit
import SDWebImage

class MovieDetailViewController : UIViewController {
    //MARK: Property
    
    var movie: Movie?{
        didSet{
            configureMovie()
        }
    }
    
    lazy var backImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .redraw
        iv.alpha = 0.4
        return iv
    }()
    
    lazy var imageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleToFill
        iv.backgroundColor = .systemRed
        return iv
    }()
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.text = "title"
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.numberOfLines = 0
        return label
    }()
    
    lazy var yearLabel: UILabel = {
        let label = UILabel()
        label.text = "Year"
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.numberOfLines = 0
        return label
    }()
    
    lazy var genreLabel: UILabel = {
        let label = UILabel()
        label.text = "Genre"
        label.font = UIFont.boldSystemFont(ofSize: 20)
        return label
    }()
    
    lazy var ratingLabel: UILabel = {
        let label = UILabel()
        label.text = "Rating"
        label.font = UIFont.boldSystemFont(ofSize: 20)
        return label
    }()
    
    lazy var ratingValue: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        return label
    }()
    
    lazy var summaryLable: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        return label
    }()
    
    //MARK: Init
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }
    
    //MARK: Configure
    func configureMovie(){
        guard let movie = self.movie else {return}
        self.title = movie.title?.uppercased()
        self.nameLabel.text = movie.title
        self.yearLabel.text = String(movie.year!)
        self.ratingLabel.text = String(movie.rating!)
        self.summaryLable.text = movie.summary
        guard let url = URL(string: movie.medium_cover_image!) else {return}
        imageView.sd_setImage(with: url, completed: nil)
        guard let url = URL(string: movie.background_image!) else {return}
        backImageView.sd_setImage(with: url, completed: nil)
        
        if (self.movie?.rating!)! > 9.0 {
            self.ratingValue.text = "★★★★★★★★★★"
        } else if (self.movie?.rating!)! > 8.5 {
            self.ratingValue.text = "★★★★★★★★★☆"
        } else if (self.movie?.rating!)! > 7.5 {
            self.ratingValue.text = "★★★★★★★★☆☆"
        } else if (self.movie?.rating!)! > 6.5 {
            self.ratingValue.text = "★★★★★★★☆☆☆"
        } else if (self.movie?.rating!)! > 5.5 {
            self.ratingValue.text = "★★★★★★☆☆☆☆"
        } else if (self.movie?.rating!)! > 4.5 {
            self.ratingValue.text = "★★★★★☆☆☆☆☆"
        } else if (self.movie?.rating!)! > 3.5 {
            self.ratingValue.text = "★★★★☆☆☆☆☆☆"
        } else if (self.movie?.rating!)! > 2.5 {
            self.ratingValue.text = "★★★☆☆☆☆☆☆☆"
        } else if (self.movie?.rating!)! > 1.5 {
            self.ratingValue.text = "★★☆☆☆☆☆☆☆☆"
        } else if (self.movie?.rating!)! > 0.5 {
            self.ratingValue.text = "★☆☆☆☆☆☆☆☆☆"
        } else {
            self.ratingValue.text = "☆☆☆☆☆☆☆☆☆☆"
        }
    }
    
    func configureView(){
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.tintColor = .white
        
        view.addSubview(backImageView)
        backImageView.translatesAutoresizingMaskIntoConstraints = false
        backImageView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        backImageView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        backImageView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        backImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        view.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 30).isActive = true
        imageView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 200).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 350).isActive = true
        
        view.addSubview(nameLabel)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 30).isActive = true
        nameLabel.leftAnchor.constraint(equalTo: imageView.rightAnchor, constant: 20).isActive = true
        nameLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
        
        view.addSubview(yearLabel)
        yearLabel.translatesAutoresizingMaskIntoConstraints = false
        yearLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10).isActive = true
        yearLabel.leftAnchor.constraint(equalTo: imageView.rightAnchor, constant: 20).isActive = true
        yearLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
        
        view.addSubview(genreLabel)
        genreLabel.translatesAutoresizingMaskIntoConstraints = false
        genreLabel.topAnchor.constraint(equalTo: yearLabel.bottomAnchor, constant: 10).isActive = true
        genreLabel.leftAnchor.constraint(equalTo: imageView.rightAnchor, constant: 20).isActive = true
        genreLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
        
        view.addSubview(ratingLabel)
        ratingLabel.translatesAutoresizingMaskIntoConstraints = false
        ratingLabel.topAnchor.constraint(equalTo: genreLabel.bottomAnchor, constant: 10).isActive = true
        ratingLabel.leftAnchor.constraint(equalTo: imageView.rightAnchor, constant: 20).isActive = true
        ratingLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
        
        view.addSubview(ratingValue)
        ratingValue.translatesAutoresizingMaskIntoConstraints = false
        ratingValue.topAnchor.constraint(equalTo: ratingLabel.bottomAnchor, constant: 10).isActive = true
        ratingValue.leftAnchor.constraint(equalTo: imageView.rightAnchor, constant: 20).isActive = true
        ratingValue.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -80).isActive = true
        
        
        view.addSubview(summaryLable)
        summaryLable.translatesAutoresizingMaskIntoConstraints = false
        summaryLable.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 20).isActive = true
        summaryLable.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        summaryLable.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
        summaryLable.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50).isActive = true
        
    }
    

}
