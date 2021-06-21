//
//  CollectionCell.swift
//  CollectionView
//
//  Created by 이성호 on 2021/06/21.
//

import UIKit

class CollectionCell : UICollectionViewCell {
    
    //MARK: Property
    var item : String?{
        didSet {
            self.label.text = item
        }
    }
    
    lazy var label: UILabel = {
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
        backgroundColor = .systemGreen
        
        addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        label.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
    }
}