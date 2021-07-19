//
//  TableCell.swift
//  QuizApp
//
//  Created by 이성호 on 2021/07/19.
//

import UIKit

class TableCell: UITableViewCell {
    //MARK: Property
    
    lazy var label : UILabel = {
        let label = UILabel()
        label.text = "답안지"
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
            backgroundColor = .systemPurple

        }
        
        func configureComponent(){
            addSubview(label)
            label.translatesAutoresizingMaskIntoConstraints = false
            label.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
            label.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        }
}
//MARK: Extensions
