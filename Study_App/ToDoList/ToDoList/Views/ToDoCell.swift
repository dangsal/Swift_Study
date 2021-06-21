//
//  ToDoCell.swift
//  ToDoList
//
//  Created by 이성호 on 2021/06/21.
//

import UIKit

class ToDoCell : UITableViewCell {
    
    //MARK: Property

    
    
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
        backgroundColor = .systemGreen
        

        
    }
    
}
