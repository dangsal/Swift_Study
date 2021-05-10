//
//  InfoView.swift
//  PokemonDoGam
//
//  Created by 이성호 on 2021/05/06.
//
    
import UIKit
import SDWebImage

protocol InfoViewProtocol {
    func removeInfoView()
}

class InfoView: UIView {
    
    var delegate : InfoViewProtocol?
    var pokemon : Pokemon? {
        didSet {
            configurePokemon()
        }
    }
    //MARK: Properties
    lazy var nameView:UIView = {
       let view = UIView()
        view.backgroundColor = .mainColor
        view.addSubview(self.nameLabel)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        nameLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        return view
    }()
    
    lazy var nameLabel: UILabel = {
       let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.text = "이름"
        return label
    }()
    
    lazy var imageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        return iv
    }()
    
    lazy var weightLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.text = "WEIGHT"
        return label
    }()
    
    lazy var weightValueLabel:UILabel = {
        let label = UILabel()
        return label
    }()
    
    lazy var lineUnderWeight: UIView = {
        let view = UIView()
        view.backgroundColor = .tertiarySystemGroupedBackground
        return view
    }()
    
    lazy var heightLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.text = "HEIGHT"
        return label
    }()
    
    lazy var heightValueLabel:UILabel = {
        let label = UILabel()
        return label
    }()
    
    lazy var lineUnderHeight: UIView = {
        let view = UIView()
        view.backgroundColor = .tertiarySystemGroupedBackground
        return view
    }()
    
    lazy var typeLable:UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.text = "TYPE"
        return label
    }()
    
    lazy var typeValueLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    
    
    lazy var goToDetailButton:UIButton = {
        let button = UIButton(type:.system)
        button.setTitle("상세보기", for: .normal)
        button.layer.cornerRadius = 8
        button.backgroundColor = .mainColor
        button.addTarget(self, action: #selector(goToDetailButtonTapped), for: .touchUpInside)
        return button
    }()
    
    //MARK: Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureViewComponent()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Selectors
    @objc func goToDetailButtonTapped(){
        delegate?.removeInfoView()
    }
    
    
    
    //MARK: Helper
    func configurePokemon(){
        guard let pokemon = self.pokemon else { return }
        nameLabel.text = pokemon.name
        if let weight = pokemon.weight {
            self.weightValueLabel.text = String(weight)
        }
        if let height = pokemon.height {
            self.heightValueLabel.text = String(height)
        }
        typeValueLabel.text = pokemon.type
        if let urlString = pokemon.imageUrl {
            if let url = URL(string: urlString){
                self.imageView.sd_setImage(with: url, completed: nil)
            }
        }
    }
    
    func adjustColor(){
        if self.traitCollection.userInterfaceStyle == .dark {
            self.goToDetailButton.setTitleColor(.white, for: .normal)
        } else {
            self.goToDetailButton.setTitleColor(.black, for: .normal)
        }
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        adjustColor()
    }
    
    
   
    func configureViewComponent(){
        self.backgroundColor = .systemBackground
        self.layer.cornerRadius = 8
        self.layer.masksToBounds = true
        
        addSubview(nameView)
        nameView.translatesAutoresizingMaskIntoConstraints = false
        nameView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        nameView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        nameView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        nameView.heightAnchor.constraint(equalToConstant: 45).isActive = true
        
        addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.topAnchor.constraint(equalTo: nameView.bottomAnchor, constant: 15).isActive = true
        imageView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        addSubview(weightLabel)
        weightLabel.translatesAutoresizingMaskIntoConstraints = false
        weightLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 50).isActive = true
        weightLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 50).isActive = true
        
        addSubview(weightValueLabel)
        weightValueLabel.translatesAutoresizingMaskIntoConstraints = false
        weightValueLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 50).isActive = true
        weightValueLabel.leftAnchor.constraint(equalTo: weightLabel.rightAnchor, constant: 10).isActive = true
        
        addSubview(lineUnderWeight)
        lineUnderWeight.translatesAutoresizingMaskIntoConstraints = false
        lineUnderWeight.topAnchor.constraint(equalTo: weightLabel.bottomAnchor, constant: 10).isActive = true
        lineUnderWeight.leftAnchor.constraint(equalTo: leftAnchor, constant: 50).isActive = true
        lineUnderWeight.rightAnchor.constraint(equalTo: rightAnchor, constant: -50).isActive = true
        lineUnderWeight.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        addSubview(heightLabel)
        heightLabel.translatesAutoresizingMaskIntoConstraints = false
        heightLabel.topAnchor.constraint(equalTo: weightLabel.bottomAnchor, constant: 20).isActive = true
        heightLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 50).isActive = true
        
        addSubview(heightValueLabel)
        heightValueLabel.translatesAutoresizingMaskIntoConstraints = false
        heightValueLabel.topAnchor.constraint(equalTo: weightLabel.bottomAnchor, constant: 20).isActive = true
        heightValueLabel.leftAnchor.constraint(equalTo: heightLabel.rightAnchor, constant: 10).isActive = true
        
        addSubview(lineUnderHeight)
        lineUnderHeight.translatesAutoresizingMaskIntoConstraints = false
        lineUnderHeight.topAnchor.constraint(equalTo: heightLabel.bottomAnchor, constant: 10).isActive = true
        lineUnderHeight.leftAnchor.constraint(equalTo: leftAnchor, constant: 50).isActive = true
        lineUnderHeight.rightAnchor.constraint(equalTo: rightAnchor, constant: -50).isActive = true
        lineUnderHeight.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        addSubview(typeLable)
        typeLable.translatesAutoresizingMaskIntoConstraints = false
        typeLable.topAnchor.constraint(equalTo: heightLabel.bottomAnchor, constant: 20).isActive = true
        typeLable.leftAnchor.constraint(equalTo: leftAnchor, constant: 50).isActive = true
        
        addSubview(typeValueLabel)
        typeValueLabel.translatesAutoresizingMaskIntoConstraints = false
        typeValueLabel.topAnchor.constraint(equalTo: heightValueLabel.bottomAnchor, constant: 20).isActive = true
        typeValueLabel.leftAnchor.constraint(equalTo: typeLable.rightAnchor, constant: 10).isActive = true
    
        addSubview(goToDetailButton)
        goToDetailButton.translatesAutoresizingMaskIntoConstraints = false
        goToDetailButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -20).isActive = true
        goToDetailButton.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20).isActive = true
        goToDetailButton.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -20).isActive = true
        goToDetailButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        adjustColor()
    }
}
