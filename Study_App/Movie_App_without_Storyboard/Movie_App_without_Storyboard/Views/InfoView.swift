//
//  InfoView.swift
//  Movie_App_without_Storyboard
//
//  Created by 이성호 on 2021/05/19.
//

import UIKit

class InfoView : UIView {
    //MARK: Property
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
        
        addSubview(nameView)
        nameView.translatesAutoresizingMaskIntoConstraints = false
        nameView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        nameView.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        nameView.heightAnchor.constraint(equalToConstant: 50).isActive = true

    }
    
}
