//
//  CollectionHeaderCell.swift
//  CollectionView
//
//  Created by 이성호 on 2021/06/21.
//

import UIKit

class CollectionHeaderCell: UICollectionViewCell {

    //MARK: Property
    lazy var label: UILabel = {
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
    
    //MARK: Configure
    func configure(){
        backgroundColor = .systemBackground
        
        addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0).isActive = true
        label.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 0).isActive = true
    }
}
