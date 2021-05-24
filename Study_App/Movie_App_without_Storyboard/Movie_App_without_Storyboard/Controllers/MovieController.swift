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
    let refreshControl = UIRefreshControl()
    
    var searchedMovie = [Movie]()
    var searchMode = false
    
    let movieService = MovieService()
    
    var movies = [Movie](){
        didSet{
            collectionView.reloadData()
        }
    }
    lazy var searchBar: UISearchBar = {
        let bar = UISearchBar()
        bar.sizeToFit()
        bar.showsCancelButton = true
        bar.delegate = self
        return bar
    }()
    
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
        hidekeyboardWhenTappedAround()
        
    }
    
    //MARK: Selectors
    
    @objc func refresh(){
        print("refresh")
        self.collectionView.reloadData()
    }
    
    @objc func blurViewTapped(){
        removeInfoAnimation()
    }
    
    @objc func searchTapped(){
        configureSearchBar()
    }
    
    //MARK: Configure
    override func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        if(refreshControl.isRefreshing){
            self.refreshControl.endRefreshing()
            movieService.fetchMovie()
        }
    }

    func removeSearchBar(){
        self.navigationItem.titleView = nil
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(searchTapped))
    }
    
    func configureSearchBar(){
        self.navigationItem.titleView = searchBar
        self.navigationItem.rightBarButtonItem = nil
        searchBar.becomeFirstResponder()
    }
    
    func configure(){
        collectionView.backgroundColor = .systemBackground
        navigationItem.title = "MovieApp"
        navigationController?.navigationBar.barTintColor = .mainColor
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.isTranslucent = false
        
        collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: reuseableIdentifier)
        
        configuresComponents()
        movieService.fetchMovie()
        movieService.delegate = self
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(searchTapped))
        
        collectionView.refreshControl = refreshControl
        refreshControl.addTarget(self, action: #selector(refresh), for: .valueChanged)
        
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
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText == "" {
            searchMode = false
        } else {
            searchMode = true
            let matchingMovie = self.movies.filter { movie in
                guard let title = movie.title else {return false}
                return title.lowercased().contains(searchText.lowercased())
            }
            self.searchedMovie = matchingMovie
        }
        collectionView.reloadData()
    }
    
    func removeInfoAnimation(){
        UIView.animate(withDuration: 0.3) {
            self.blurEffectView.alpha = 0
            self.infoView.alpha = 0
            self.infoView.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
        } completion: { (_) in
            self.infoView.removeFromSuperview()
        }

    }
    
    func navigationToDetailViewController(movie: Movie){
        let movieDetailViewController = MovieDetailViewController()
        movieDetailViewController.movie = movie
        
        self.navigationController?.pushViewController(movieDetailViewController, animated: true)
    }
    
}

extension MovieController {
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if searchMode == false {
            return movies.count
        } else {
            return searchedMovie.count
        }
        
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseableIdentifier, for: indexPath) as! CollectionViewCell
        
        var movie : Movie?
        
        if searchMode == false {
            movie = self.movies[indexPath.row]
        } else {
            movie = self.searchedMovie[indexPath.row]
        }
        
        
        cell.movies = movie
        cell.delegate = self
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        var movie : Movie?
        
        if searchMode == false {
            movie = self.movies[indexPath.row]
        } else {
            movie = self.searchedMovie[indexPath.row]
        }
        
        if movie != nil{
            navigationToDetailViewController(movie: movie!)
        }
    }
    
}

extension MovieController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (view.frame.width - 40)/2
        return CGSize(width: width, height: 2 * width - 20)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 40, left: 10, bottom: 10, right: 10)
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
    func removeInfoView(movie: Movie) {
        removeInfoAnimation()
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            self.navigationToDetailViewController(movie: movie)
        }
    }

}

extension MovieController : UISearchBarDelegate{
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        removeSearchBar()
        self.searchBar.text = ""
        searchMode = false
        collectionView.reloadData()
    }
}
