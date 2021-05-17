//
//  CollectionCell.swift
//  tutorial
//
//  Created by 이성호 on 2021/05/17.
//

import UIKit

class CollectionCell:UICollectionViewCell {
    
    //MARK: Property
    
    var item : String?{
        didSet{
            label.text = item
        }
    }
    
    lazy var label:UILabel = {
        let label = UILabel()
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
        backgroundColor = .systemRed
        
        addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        label.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    }
}
