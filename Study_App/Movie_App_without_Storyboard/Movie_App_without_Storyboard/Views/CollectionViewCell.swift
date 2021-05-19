//
//  CollectionViewCell.swift
//  Movie_App_without_Storyboard
//
//  Created by 이성호 on 2021/05/19.
//

import UIKit

class CollectionViewCell : UICollectionViewCell {
    
    //MARK: Property
    let movieService = MovieService()
    
    lazy var imageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.backgroundColor = .systemRed
        return iv
    }()
    
    lazy var movieTitle: UILabel = {
        let label = UILabel()
        label.text = "movieTitle"
        label.font = UIFont.systemFont(ofSize: 25)
        return label
    }()
    
    lazy var movieYear: UILabel = {
        let label = UILabel()
        label.text = "Year"
        label.font = UIFont.systemFont(ofSize: 18)
        return label
    }()
    
    //MARK: Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
        configureComponents()
        movieService.fetchMovie()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: Configure
    func configure(){
        
    }
    
    //MARK: ConfigureComponents
    func configureComponents(){
        
        addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        imageView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        imageView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        imageView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.7).isActive = true
        
        addSubview(movieTitle)
        movieTitle.translatesAutoresizingMaskIntoConstraints = false
        movieTitle.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 10).isActive = true
        movieTitle.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        movieTitle.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        movieTitle.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        addSubview(movieYear)
        movieYear.translatesAutoresizingMaskIntoConstraints = false
        movieYear.topAnchor.constraint(equalTo: movieTitle.bottomAnchor, constant: 10).isActive = true
        movieYear.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        movieYear.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        movieYear.heightAnchor.constraint(equalToConstant: 20).isActive = true
    }
}
