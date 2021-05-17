//
//  CollectionHeaderCell.swift
//  tutorial
//
//  Created by 이성호 on 2021/05/17.
//

import UIKit

class CollectionHeaderCell : UICollectionReusableView {
    
    //MARK: Property
    lazy var label:UILabel = {
        let label = UILabel()
        label.font = UIFont.italicSystemFont(ofSize: 40)
        label.text = "Header"
        return label
    }()
    
    //MARK: Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: configure
    func configure(){
        backgroundColor = .systemBackground
        
        addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        label.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    }
}
