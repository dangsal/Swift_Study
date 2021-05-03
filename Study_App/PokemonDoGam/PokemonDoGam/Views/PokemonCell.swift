//
//  PokemonCell.swift
//  PokemonDoGam
//
//  Created by 이성호 on 2021/05/03.
//

import UIKit

class PokemonCell: UICollectionViewCell {
    
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
        label.text = "dangsal"
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    
    
    
    
    
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
