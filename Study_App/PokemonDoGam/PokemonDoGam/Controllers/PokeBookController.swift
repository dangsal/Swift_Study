//
//  PokeBookController.swift
//  PokemonDoGam
//
//  Created by 이성호 on 2021/05/03.
//

import UIKit

let reuseableIdentifier = "pokebookCell"

class PokeBookController: UICollectionViewController {
    // MARK: Properties
    let pokemonService = PokemonService()
    
    var pokemons = [Pokemon](){
        didSet {
            // 해당 변수의 값이 변할 때마다 여기가 실행된다.
            self.collectionView.reloadData()
        }
    }
    
    lazy var infoView:InfoView = {
       let view = InfoView()
        return view
    }()
    
    lazy var blurEffectView: UIVisualEffectView = {
        let blurEffect = UIBlurEffect(style: .dark)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        return blurEffectView
    }()
    
    // MARK: Init
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configViewControllers()
    }
    // MARK: 시스템 테마가 변경되어있을때마다 자동으로 호출되는 함수
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        adjustColor()
    }
    
    // MARK: Selectors 함수를 추가할 때는 @objc 붙여야함
    @objc func searchTapped(){
        print("search tapped")
    }
    
    @objc func blurViewTapped(){
        removeInfoViewAnimation()
    }
    
    func adjustColor(){
        if self.traitCollection.userInterfaceStyle == .dark {
            // 다크모드일때
            navigationController?.navigationBar.tintColor = .white
        } else {
            // 라이트모드일때
            navigationController?.navigationBar.tintColor = .black
        }
    }
    // MARK: Helper
    func navigationToDeatailController(pokemon:Pokemon){
        let pokemonDetailController = PokemonDetailController()
        pokemonDetailController.pokemon = pokemon
        self.navigationController?.pushViewController(pokemonDetailController, animated: true)
    }

    func removeInfoViewAnimation(){
        UIView.animate(withDuration: 0.3) {
            self.blurEffectView.alpha = 0
            self.infoView.alpha = 0
            self.infoView.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
        } completion: { (_) in
            self.infoView.removeFromSuperview()
        }

    }
    
    
    func configViewControllers(){
        collectionView.backgroundColor = .systemBackground
        navigationController?.navigationBar.barTintColor = UIColor.mainColor
        navigationController?.navigationBar.isTranslucent = false // 원래 네비게이션바 색상으로 바꾸려면 false 로 바꾸면 됨
        
        self.title = "포켓몬도감"
        
        
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(searchTapped)) //selector 부분은
            
        
        adjustColor()
        
        collectionView.register(PokemonCell.self, forCellWithReuseIdentifier: reuseableIdentifier)
        pokemonService.fetchPokemon()
        pokemonService.delegate = self
        
        collectionView.addSubview(blurEffectView)
        blurEffectView.translatesAutoresizingMaskIntoConstraints = false
        blurEffectView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        blurEffectView.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true
        blurEffectView.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        blurEffectView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        blurEffectView.alpha = 0
        
        let blurViewTapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(blurViewTapped))
        blurEffectView.addGestureRecognizer(blurViewTapGestureRecognizer)

    }
}

// MARK: collectionViewCell delegate functions
extension PokeBookController {
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pokemons.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.row)
        let pokemon = self.pokemons[indexPath.row]
        
        navigationToDeatailController(pokemon: pokemon)
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseableIdentifier, for: indexPath) as! PokemonCell
        
        let pokemon = self.pokemons[indexPath.row]
        cell.pokemon = pokemon
        cell.delegate = self
        return cell
    }
}

// MARK: UICollectionViewDelegateFlowLayout delegate functions
extension PokeBookController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (view.frame.width - 36) / 3
        return CGSize(width: width, height: width)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 32, left: 8, bottom: 8, right: 8)
    }
}

extension PokeBookController: PokemonServiceProtocol {
    func pokemonService(pokemons: [Pokemon]) {
        self.pokemons = pokemons
        
    }
    
    
}

extension PokeBookController: PokemonCellProtocol {
    func showPopUp(pokemon: Pokemon) {
        collectionView.addSubview(infoView)
        infoView.translatesAutoresizingMaskIntoConstraints = false
        infoView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        infoView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -55).isActive = true
        infoView.heightAnchor.constraint(equalToConstant: 500).isActive = true
        infoView.widthAnchor.constraint(equalToConstant: view.frame.width - 80).isActive = true
        infoView.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
        infoView.alpha = 0
        infoView.delegate = self
        infoView.pokemon = pokemon
        
        UIView.animate(withDuration: 0.3) {
            self.blurEffectView.alpha = 1
            self.infoView.transform = .identity
            self.infoView.alpha = 1
        }
    }
    
    
}

extension PokeBookController: InfoViewProtocol {
    func removeInfoView(pokemon: Pokemon) {
        removeInfoViewAnimation()

        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            self.navigationToDeatailController(pokemon: pokemon)
        }

    }
}
