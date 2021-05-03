//
//  PokemonCell.swift
//  PokemonDoGam
//
//  Created by 이성호 on 2021/05/03.
//

import UIKit

class PokemonCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
        configureViewComponents()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Helpers
    func configureViewComponents(){
        self.backgroundColor = .tertiarySystemGroupedBackground
    }
}
