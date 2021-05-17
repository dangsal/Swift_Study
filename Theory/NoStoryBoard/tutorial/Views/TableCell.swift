//
//  TableCell.swift
//  tutorial
//
//  Created by 이성호 on 2021/05/17.
//

import UIKit

class TableCell: UITableViewCell {
    
    //MARK: Property
    var item: String?{
        didSet {
            self.label.text = item
        }
    }
    
    lazy var label:UILabel = {
        let label = UILabel()
        return label
    }()
    
    //MARK: Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: Configures
    func configure(){
        backgroundColor = .systemBackground
        
        addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        label.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true

    }
}
