//
//  PokemonCell.swift
//  PokemonDoGam
//
//  Created by 이성호 on 2021/05/03.
//

import UIKit
import SDWebImage

protocol PokemonCellProtocol {
    func showPopUp(pokemon: Pokemon)
}

class PokemonCell: UICollectionViewCell {
    
    var delegate : PokemonCellProtocol?
    
    var pokemon: Pokemon?{
        didSet{
            guard let pokemon = self.pokemon else {return}
            self.pokemonName.text = pokemon.name
            guard let imageUrl = self.pokemon?.imageUrl else {return}
            if let url = URL(string: imageUrl){
                self.imageView.sd_setImage(with: url, completed: nil)
            }
        }
    }
    
    // MARK: Properties
    lazy var imageView:UIImageView = {
       let iv = UIImageView()
        iv.backgroundColor = UIColor.tertiarySystemGroupedBackground
        iv.contentMode = .scaleAspectFit
        return iv
    }()
    
    lazy var textView:UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.mainColor
        view.addSubview(self.pokemonName)
        pokemonName.translatesAutoresizingMaskIntoConstraints = false
        pokemonName.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        pokemonName.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        return view
    }()
    
    lazy var pokemonName: UILabel = {
        let label = UILabel()
  
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    
    
    // MARK: selector
    @objc func longPress(sender:UILongPressGestureRecognizer){

        if sender.state == UIGestureRecognizer.State.began {
            guard let pokemon = self.pokemon else {return}
            delegate?.showPopUp(pokemon: pokemon)
        }
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
        configureViewComponents()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Helpers
    func configureViewComponents(){
        self.layer.cornerRadius = 10
        self.layer.masksToBounds = true
        
        let longPressRecognizer = UILongPressGestureRecognizer(target: self, action: #selector(longPress))
        self.addGestureRecognizer(longPressRecognizer)
        
        
        self.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        imageView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        imageView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        imageView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.7).isActive = true
        
        self.addSubview(textView)
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.topAnchor.constraint(equalTo: imageView.bottomAnchor).isActive = true
        textView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        textView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        textView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    }
}
