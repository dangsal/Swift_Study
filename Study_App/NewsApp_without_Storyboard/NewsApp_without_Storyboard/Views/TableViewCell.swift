//
//  TableViewCell.swift
//  NewsApp_without_Storyboard
//
//  Created by 이성호 on 2021/05/18.
//

import UIKit

class TableViewCell : UITableViewCell {
    //MARK: Property
    
    var articles: Articles?{
        didSet{
            guard let articles = self.articles else {return}
            self.newsTitle.text = articles.title
        }
    }
    
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
        
        addSubview(newsTitle)
        newsTitle.translatesAutoresizingMaskIntoConstraints = false
        newsTitle.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        newsTitle.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
    }
}
