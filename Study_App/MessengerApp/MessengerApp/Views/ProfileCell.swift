//
//  ProfileCell.swift
//  MessengerApp
//
//  Created by 이성호 on 2021/05/26.
//

import UIKit

class ProfileCell: UITableViewCell {
    
    //MARK: Property
    
    
    
    lazy var label: UILabel = {
        let label = UILabel()
        label.text = "Log Out"
        label.textColor = .red
        label.font = UIFont.systemFont(ofSize: 18)
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
    
    //MARK: Configure
    func configure(){
        backgroundColor = .systemBackground
        
        addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        label.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    }
}
