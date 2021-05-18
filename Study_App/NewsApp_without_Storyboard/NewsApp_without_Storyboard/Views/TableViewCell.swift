//
//  TableViewCell.swift
//  NewsApp_without_Storyboard
//
//  Created by 이성호 on 2021/05/18.
//

import UIKit
import SDWebImage

class TableViewCell : UITableViewCell {
    //MARK: Property
    
    var articles: Articles?{
        didSet{
            guard let articles = self.articles else {return}
            self.newsTitle.text = articles.title
            
            guard let imageUrl = self.articles?.urlToImage else {return}
            if let url = URL(string: imageUrl){
                self.newsImage.sd_setImage(with: url, completed: nil)
            } else {
                let placeholderImage = UIImage(named: "placeholder.png")
                newsImage.image = placeholderImage
            }
        }
    }
    
    lazy var newsImage: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleToFill
        return iv
    }()
    
    lazy var newsTitle: UILabel = {
        let label = UILabel()
        label.text = "dangsal's coding"
        return label
    }()
    
    
    //MARK: Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: Configure
    func configure(){
        backgroundColor = .systemBackground
        
        addSubview(newsImage)
        newsImage.translatesAutoresizingMaskIntoConstraints = false
        newsImage.topAnchor.constraint(equalTo: self.topAnchor, constant: 10).isActive = true
        newsImage.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20).isActive = true
        newsImage.widthAnchor.constraint(equalToConstant: 150).isActive = true
        newsImage.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10).isActive = true
        
        addSubview(newsTitle)
        newsTitle.translatesAutoresizingMaskIntoConstraints = false
        newsTitle.topAnchor.constraint(equalTo: self.topAnchor, constant: 10).isActive = true
        newsTitle.leftAnchor.constraint(equalTo: newsImage.rightAnchor, constant: 20).isActive = true


        
    }
}
