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
            self.newsDiscription.text = articles.description
            
            guard let imageUrl = self.articles?.urlToImage else {
                let placeholderImage = UIImage(named: "placeholder.png")
                newsImage.image = placeholderImage
                return
            }
            if let url = URL(string: imageUrl){
                self.newsImage.sd_setImage(with: url, completed: nil)
            } else {

            }
        }
    }
    
    lazy var newsImage: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleToFill
        iv.layer.cornerRadius = 5
        iv.layer.masksToBounds = true
        return iv
    }()
    
    lazy var newsTitle: UILabel = {
        let label = UILabel()
        label.text = "dangsal's coding"
        label.numberOfLines = 2
        label.font = UIFont.boldSystemFont(ofSize: 20)
        return label
    }()
    
    lazy var newsDiscription: UILabel = {
        let label = UILabel()
        label.numberOfLines = 3
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .systemGray
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
        newsImage.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -10).isActive = true
        newsImage.widthAnchor.constraint(equalToConstant: 140).isActive = true
        newsImage.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10).isActive = true
        
        addSubview(newsTitle)
        newsTitle.translatesAutoresizingMaskIntoConstraints = false
        newsTitle.topAnchor.constraint(equalTo: self.topAnchor, constant: 10).isActive = true
        newsTitle.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20).isActive = true
        newsTitle.rightAnchor.constraint(equalTo: newsImage.leftAnchor, constant: -10).isActive = true
        

        addSubview(newsDiscription)
        newsDiscription.translatesAutoresizingMaskIntoConstraints = false
        newsDiscription.topAnchor.constraint(equalTo: newsTitle.bottomAnchor, constant: 20).isActive = true
        newsDiscription.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20).isActive = true
        newsDiscription.rightAnchor.constraint(equalTo: newsImage.leftAnchor, constant: -10).isActive = true
        newsDiscription.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10).isActive = true

        
    }
}
