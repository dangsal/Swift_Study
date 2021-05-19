//
//  MovieController.swift
//  Movie_App_without_Storyboard
//
//  Created by 이성호 on 2021/05/19.
//

import UIKit

private let reuseableIdentifier = "cell"

class MovieController : UICollectionViewController {
    
    //MARK: Property
    let movieService = MovieService()
    var movies = [Movie](){
        didSet{
            collectionView.reloadData()
        }
    }
    
    lazy var infoView: InfoView = {
        let view = InfoView()
        return view
    }()
    
    //MARK: Init
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        
    }
    
    //MARK: Configure
    func configure(){
        collectionView.backgroundColor = .systemBackground
        navigationItem.title = "MovieApp"
        navigationController?.navigationBar.barTintColor = .mainColor
        navigationController?.navigationBar.isTranslucent = false
        
        collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: reuseableIdentifier)
        
        configuresComponents()
        movieService.fetchMovie()
        movieService.delegate = self
        
    }
    
    //MARK: ConfigureComponents
    func configuresComponents(){
        
        collectionView.addSubview(infoView)
//        infoView.translatesAutoresizingMaskIntoConstraints = false
//        infoView.centerXAnchor.constraint(equalTo: collectionView.centerXAnchor, constant: 0).isActive = true
//        infoView.centerYAnchor.constraint(equalTo: collectionView.centerYAnchor, constant: 0).isActive = true
//        infoView.widthAnchor.constraint(equalToConstant: view.frame.width - 80).isActive = true
//        infoView.heightAnchor.constraint(equalToConstant: 500).isActive = true
    }
    
}

extension MovieController {
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseableIdentifier, for: indexPath) as! CollectionViewCell
        
        return cell
    }
    
}

extension MovieController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (view.frame.width - 40)/2
        return CGSize(width: width, height: 2 * width - 20)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 20, left: 10, bottom: 10, right: 10)
    }
    
}

extension MovieController : MovieServiceProtocol{
    func MovieServiceProtocol(movies: [Movie]) {
        self.movies = movies
    }
    
    
}
