//
//  TableCell.swift
//  NotesApp
//
//  Created by 이성호 on 2021/07/21.
//

import UIKit

class TableCell : UITableViewCell {
    
    //MARK: Property

    
    lazy var titleLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15)
        return label
    }()
    
    lazy var contentLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.numberOfLines = 1
        label.lineBreakMode = .byCharWrapping
        return label
    }()
    //MARK: Selectors
    //MARK: Functions
    //MARK: Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configure()
        configureComponent()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //MARK: Configure
        func configure(){
            backgroundColor = .systemBackground
        }
        
        func configureComponent(){

            
            addSubview(titleLabel)
            titleLabel.translatesAutoresizingMaskIntoConstraints = false
            titleLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 30).isActive = true
            titleLabel.topAnchor.constraint(equalTo: topAnchor,constant: 10).isActive = true
            
            addSubview(contentLabel)
            contentLabel.translatesAutoresizingMaskIntoConstraints = false
            contentLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 30).isActive = true
            contentLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 5).isActive = true
        }
    //MARK: Extensions
}
