//
//  ModalView.swift
//  tutorial
//
//  Created by 이성호 on 2021/05/17.
//

import UIKit

protocol ModalViewDelegate {
    func closeButtonTapped()
}


class ModalView: UIView {
    
    var delegate: ModalViewDelegate?
    
    lazy var closeButton:UIButton = {
        let bt = UIButton(type: .system)
        bt.setTitle("Close", for: .normal)
        bt.addTarget(self, action: #selector(closeButtonTapped), for: .touchUpInside)
        return bt
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureViewComponents()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func closeButtonTapped(){
        delegate?.closeButtonTapped()
    }
    
    func configureViewComponents(){
        backgroundColor = .systemBackground
        layer.cornerRadius = 8
        
        addSubview(closeButton)
        closeButton.translatesAutoresizingMaskIntoConstraints = false
        closeButton.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        closeButton.bottomAnchor.constraint(equalTo: centerYAnchor, constant: 50).isActive = true
    }
}
