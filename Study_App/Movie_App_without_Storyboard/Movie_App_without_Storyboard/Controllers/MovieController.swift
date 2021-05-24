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
    
    lazy var blurEffectView: UIVisualEffectView = {
        let blurEffect = UIBlurEffect(style: .dark)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        return blurEffectView
    }()
    
    //MARK: Init
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        
    }
    
    //MARK: Selectors
    @objc func blurViewTapped(){
        removeInfoAnimation()
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
        collectionView.addSubview(blurEffectView)
        blurEffectView.translatesAutoresizingMaskIntoConstraints = false
        blurEffectView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        blurEffectView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        blurEffectView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        blurEffectView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        blurEffectView.alpha = 0
        
        let blurViewTapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(blurViewTapped))
        blurEffectView.addGestureRecognizer(blurViewTapGestureRecognizer)

    }
    
    //MARK: Helpers
    func removeInfoAnimation(){
        UIView.animate(withDuration: 0.3) {
            self.blurEffectView.alpha = 0
            self.infoView.alpha = 0
            self.infoView.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
        } completion: { (_) in
            self.infoView.removeFromSuperview()
        }

    }
    
}

extension MovieController {
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movies.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseableIdentifier, for: indexPath) as! CollectionViewCell
        
        let movies = self.movies[indexPath.row]
        cell.movies = movies
        cell.delegate = self
        return cell
    }
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.row)
        
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

extension MovieController : CollectionViewCellProtocol {
    func showPopUp(movie: Movie) {

        collectionView.addSubview(infoView)
        infoView.translatesAutoresizingMaskIntoConstraints = false
        infoView.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        infoView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 0).isActive = true
        infoView.widthAnchor.constraint(equalToConstant: view.frame.width - 80).isActive = true
        infoView.heightAnchor.constraint(equalToConstant: 500).isActive = true
        infoView.alpha = 0
        infoView.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
        infoView.delegate = self
        infoView.movie = movie
        
        UIView.animate(withDuration: 0.3) {
            self.blurEffectView.alpha = 1
            self.infoView.alpha = 1
            self.infoView.transform = .identity
        }
    }
    
    
}
extension MovieController : InfoViewProtocol {
    func removeInfoView() {
        removeInfoAnimation()
    }
}
