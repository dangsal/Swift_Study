//
//  PokemonDetailController.swift
//  PokemonDoGam
//
//  Created by 이성호 on 2021/05/10.
//

import UIKit
import SDWebImage

class PokemonDetailController: UIViewController {
    
    //MARK: Property
    var pokemon: Pokemon?{
        didSet {
            configurePokemon()
        }
    }
    
    //MARK: Init
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewComponents()
    }
    
    lazy var imageView:UIImageView = {
        let iv = UIImageView()
        iv.backgroundColor = .systemGroupedBackground
        iv.contentMode = .scaleAspectFit
        return iv
    }()
    
    lazy var weightLabel: UILabel = {
        let label = UILabel()
        label.text = "WEIGHT"
        label.font = UIFont.boldSystemFont(ofSize: 18)
        return label
    }()
    
    lazy var weightUnderLine: UIView = {
        let view = UIView()
        view.backgroundColor = .tertiarySystemGroupedBackground
        return view
    }()
    
    lazy var weightLabelValue: UILabel = {
        let label = UILabel()
        return label
    }()
    
    lazy var heightLabel: UILabel = {
        let label = UILabel()
        label.text = "HEIGHT"
        label.font = UIFont.boldSystemFont(ofSize: 18)
        return label
    }()
    
    lazy var heightUnderLine:UIView = {
        let view = UIView()
        view.backgroundColor = .tertiarySystemGroupedBackground
        return view
    }()
    
    lazy var heightValueLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    lazy var deffenseLabel: UILabel = {
        let label = UILabel()
        label.text = "DEFFENSE"
        label.font = UIFont.boldSystemFont(ofSize: 18)
        return label
    }()
    
    lazy var deffenseValueLabel : UILabel = {
        let label = UILabel()
        return label
    }()
    
    lazy var deffenseUnderLine:UIView = {
        let view = UIView()
        view.backgroundColor = .tertiarySystemGroupedBackground
        return view
    }()
    
    lazy var attackLabel : UILabel = {
        let label = UILabel()
        label.text = "ATTACK"
        label.font = UIFont.boldSystemFont(ofSize: 18)
        return label
    }()
    
    lazy var attackValueLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    lazy var attackUnderLine:UIView = {
        let view = UIView()
        view.backgroundColor = .tertiarySystemGroupedBackground
        return view
    }()
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0

        return label
    }()
    
    
    //MARK: Helpers
    
    //MARK: Configure
    func configurePokemon(){
        guard let pokemon = self.pokemon else { return }
        self.title = pokemon.name?.uppercased()
        
        if let weight = pokemon.weight {
            weightLabelValue.text = String(weight)
        }
        if let height = pokemon.height {
            heightValueLabel.text = String(height)
        }
        if let deffense = pokemon.defense {
            deffenseValueLabel.text = String(deffense)
        }
        if let attack = pokemon.attack {
            attackValueLabel.text = String(attack)
        }
        if let urlString = pokemon.imageUrl {
            if let url = URL(string: urlString){
                self.imageView.sd_setImage(with: url, completed: nil)
            }
        }
        if let description = pokemon.description {
            descriptionLabel.text = description
        }
    }
    
    func configureViewComponents(){
        self.view.backgroundColor = .systemGroupedBackground
        
        view.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        imageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 50).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 200).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        
        view.addSubview(weightLabel)
        weightLabel.translatesAutoresizingMaskIntoConstraints = false
        weightLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 20).isActive = true
        weightLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 50).isActive = true
        
        view.addSubview(weightLabelValue)
        weightLabelValue.translatesAutoresizingMaskIntoConstraints = false
        weightLabelValue.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 20).isActive = true
        weightLabelValue.leftAnchor.constraint(equalTo: weightLabel.rightAnchor, constant: 20).isActive = true
        
        view.addSubview(weightUnderLine)
        weightUnderLine.translatesAutoresizingMaskIntoConstraints = false
        weightUnderLine.topAnchor.constraint(equalTo: weightLabel.bottomAnchor, constant: 10).isActive = true
        weightUnderLine.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 50).isActive = true
        weightUnderLine.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -50).isActive = true
        weightUnderLine.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        view.addSubview(heightLabel)
        heightLabel.translatesAutoresizingMaskIntoConstraints = false
        heightLabel.topAnchor.constraint(equalTo: weightLabel.bottomAnchor, constant: 20).isActive = true
        heightLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 50).isActive = true
        
        view.addSubview(heightValueLabel)
        heightValueLabel.translatesAutoresizingMaskIntoConstraints = false
        heightValueLabel.topAnchor.constraint(equalTo: weightLabel.bottomAnchor, constant: 20).isActive = true
        heightValueLabel.leftAnchor.constraint(equalTo: heightLabel.rightAnchor, constant: 20).isActive = true
        
        view.addSubview(heightUnderLine)
        heightUnderLine.translatesAutoresizingMaskIntoConstraints = false
        heightUnderLine.topAnchor.constraint(equalTo: heightLabel.bottomAnchor, constant: 10).isActive = true
        heightUnderLine.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 50).isActive = true
        heightUnderLine.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -50).isActive = true
        heightUnderLine.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        view.addSubview(deffenseLabel)
        deffenseLabel.translatesAutoresizingMaskIntoConstraints = false
        deffenseLabel.topAnchor.constraint(equalTo: heightLabel.bottomAnchor, constant: 20).isActive = true
        deffenseLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 50).isActive = true
        
        view.addSubview(deffenseValueLabel)
        deffenseValueLabel.translatesAutoresizingMaskIntoConstraints = false
        deffenseValueLabel.topAnchor.constraint(equalTo: heightLabel.bottomAnchor, constant: 20).isActive = true
        deffenseValueLabel.leftAnchor.constraint(equalTo: deffenseLabel.rightAnchor, constant: 20).isActive = true
        
        view.addSubview(deffenseUnderLine)
        deffenseUnderLine.translatesAutoresizingMaskIntoConstraints = false
        deffenseUnderLine.topAnchor.constraint(equalTo: deffenseLabel.bottomAnchor, constant: 10).isActive = true
        deffenseUnderLine.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 50).isActive = true
        deffenseUnderLine.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -50).isActive = true
        deffenseUnderLine.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        view.addSubview(attackLabel)
        attackLabel.translatesAutoresizingMaskIntoConstraints = false
        attackLabel.topAnchor.constraint(equalTo: deffenseLabel.bottomAnchor, constant: 20).isActive = true
        attackLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 50).isActive = true
        
        view.addSubview(attackValueLabel)
        attackValueLabel.translatesAutoresizingMaskIntoConstraints = false
        attackValueLabel.topAnchor.constraint(equalTo: deffenseLabel.bottomAnchor, constant: 20).isActive = true
        attackValueLabel.leftAnchor.constraint(equalTo: attackLabel.rightAnchor, constant: 20).isActive = true
        
        view.addSubview(attackUnderLine)
        attackUnderLine.translatesAutoresizingMaskIntoConstraints = false
        attackUnderLine.topAnchor.constraint(equalTo: attackLabel.bottomAnchor, constant: 10).isActive = true
        attackUnderLine.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 50).isActive = true
        attackUnderLine.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -50).isActive = true
        attackUnderLine.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        view.addSubview(descriptionLabel)
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.topAnchor.constraint(equalTo: attackLabel.bottomAnchor, constant: 20).isActive = true
        descriptionLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 50).isActive = true
        descriptionLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -50).isActive = true

        
        
    }
    
    
}
