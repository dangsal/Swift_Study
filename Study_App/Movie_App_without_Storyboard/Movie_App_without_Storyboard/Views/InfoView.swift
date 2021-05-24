//
//  InfoView.swift
//  Movie_App_without_Storyboard
//
//  Created by 이성호 on 2021/05/19.
//

import UIKit

protocol InfoViewProtocol{
    func removeInfoView(movie: Movie)
}

class InfoView : UIView {
    //MARK: Property
    var delegate : InfoViewProtocol?
    
    var movie: Movie?{
        didSet{
            configureMovie()
        }
    }
    
    lazy var nameView:UIView = {
        let view = UIView()
        view.backgroundColor = .mainColor
        view.addSubview(nameLable)
        nameLable.translatesAutoresizingMaskIntoConstraints = false
        nameLable.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        nameLable.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        return view
    }()
    
    lazy var nameLable: UILabel = {
        let label = UILabel()
        label.text = "NAME"
        return label
    }()
    
    lazy var imageView: UIImageView = {
        let iv = UIImageView()
        return iv
    }()
    
    lazy var goToDetailButton: UIButton = {
        let bt = UIButton(type: .system)
        bt.setTitle("상세보기", for: .normal)
        bt.backgroundColor = .mainColor
        bt.layer.cornerRadius = 8
        bt.tintColor = .white
        bt.addTarget(self, action: #selector(goToDetailTapped), for: .touchUpInside)
        return bt
    }()
    
    
    lazy var summaryLabel: UILabel = {
        let label = UILabel()
        label.text = "줄거리"
        label.font = UIFont.systemFont(ofSize: 18)
        return label
    }()
    
    lazy var summaryValueLabel: UILabel = {
        let label = UILabel()
        label.text = "줄거리 정보 없음"
        label.numberOfLines = 14
        return label
    }()
    
    //MARK: Selector
    @objc func goToDetailTapped(){
        delegate?.removeInfoView(movie: movie!)
    }
    
    //MARK: Helper
    
    func configureMovie(){
        guard let movie = self.movie else {return}
        nameLable.text = movie.title
        summaryValueLabel.text = movie.summary
    }
    
    
    //MARK: Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureComponets()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    
    //MARK: ConfigureComponents
    func configureComponets(){
        backgroundColor = .systemGroupedBackground
        self.layer.cornerRadius = 8
        self.layer.masksToBounds = true
        
        addSubview(nameView)
        nameView.translatesAutoresizingMaskIntoConstraints = false
        nameView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        nameView.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        nameView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        addSubview(summaryLabel)
        summaryLabel.translatesAutoresizingMaskIntoConstraints = false
        summaryLabel.topAnchor.constraint(equalTo: nameView.bottomAnchor, constant: 20).isActive = true
        summaryLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
        addSubview(summaryValueLabel)
        summaryValueLabel.translatesAutoresizingMaskIntoConstraints = false
        summaryValueLabel.topAnchor.constraint(equalTo: summaryLabel.bottomAnchor, constant: 20).isActive = true
        summaryValueLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20).isActive = true
        summaryValueLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -20).isActive = true
        
        
        addSubview(goToDetailButton)
        goToDetailButton.translatesAutoresizingMaskIntoConstraints = false
        goToDetailButton.leftAnchor.constraint(equalTo: leftAnchor, constant: 20).isActive = true
        goToDetailButton.rightAnchor.constraint(equalTo: rightAnchor, constant: -20).isActive = true
        goToDetailButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20).isActive = true
        goToDetailButton.heightAnchor.constraint(equalToConstant: 50).isActive = true

    }
    
}

