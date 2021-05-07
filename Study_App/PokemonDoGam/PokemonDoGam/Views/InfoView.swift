//
//  InfoView.swift
//  PokemonDoGam
//
//  Created by 이성호 on 2021/05/06.
//
    
import UIKit

protocol InfoViewProtocol {
    func removeInfoView()
}

class InfoView: UIView {
    
    var delegate : InfoViewProtocol?
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
        
        addSubview(goToDetailButton)
        goToDetailButton.translatesAutoresizingMaskIntoConstraints = false
        goToDetailButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -20).isActive = true
        goToDetailButton.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20).isActive = true
        goToDetailButton.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -20).isActive = true
        goToDetailButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        adjustColor()
    }
}
