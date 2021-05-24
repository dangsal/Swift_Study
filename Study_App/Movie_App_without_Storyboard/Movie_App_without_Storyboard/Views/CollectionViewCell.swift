//
//  CollectionViewCell.swift
//  Movie_App_without_Storyboard
//
//  Created by 이성호 on 2021/05/19.
//

import UIKit
import SDWebImage

protocol CollectionViewCellProtocol {
    func showPopUp(movie: Movie)
}

class CollectionViewCell : UICollectionViewCell {
    
    //MARK: Property
    
    var delegate : CollectionViewCellProtocol?
    
    var movies: Movie?{
        didSet{
            guard let movies = self.movies else { return }
            self.movieTitle.text = movies.title
            self.movieYear.text = String(movies.year!)
            if let url = URL(string: movies.medium_cover_image!){
                self.imageView.sd_setImage(with: url, completed: nil)
            }
            
        }
    }
    
    lazy var imageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.backgroundColor = .systemBackground
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
        label.textColor = .systemGray
        return label
    }()
    
    //MARK: Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureComponents()

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: Selectors
    @objc func longPress(sender:UILongPressGestureRecognizer){
        if sender.state == UIGestureRecognizer.State.began {
            guard let movie = self.movies else {return}
            delegate?.showPopUp(movie: movie)
            
        }
    }

    
    //MARK: ConfigureComponents
    func configureComponents(){
        
        let longPressRecognizer = UILongPressGestureRecognizer(target: self, action: #selector(longPress))
        self.addGestureRecognizer(longPressRecognizer)
        
        addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        imageView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        imageView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        imageView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.6).isActive = true
        
        addSubview(movieTitle)
        movieTitle.translatesAutoresizingMaskIntoConstraints = false
        movieTitle.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 40).isActive = true
        movieTitle.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        movieTitle.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        movieTitle.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        addSubview(movieYear)
        movieYear.translatesAutoresizingMaskIntoConstraints = false
        movieYear.topAnchor.constraint(equalTo: movieTitle.bottomAnchor, constant: 0).isActive = true
        movieYear.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        movieYear.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        movieYear.heightAnchor.constraint(equalToConstant: 20).isActive = true
    }
}
