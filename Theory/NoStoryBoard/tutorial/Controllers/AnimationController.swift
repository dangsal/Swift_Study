//
//  AnimationController.swift
//  tutorial
//
//  Created by 이성호 on 2021/05/17.
//

import UIKit

class AnimationController:UIViewController {
    
    //MARK: Property
    
    lazy var clickButton: UIButton = {
        let bt = UIButton(type: .system)
        bt.setTitle("Click", for: .normal)
        bt.tintColor = .systemBlue
        bt.addTarget(self, action: #selector(clickTapped), for: .touchUpInside)
        return bt
    }()
    
    lazy var modalView: ModalView = {
        let view = ModalView()
        return view
    }()
    
    lazy var blurEffectView:UIVisualEffectView = {
        let blurEffect = UIBlurEffect(style: .dark)
        blurEffectView = UIVisualEffectView(effect: blurEffect)
        return blurEffectView
    }()
    
    //MARK: Selector
    @objc func closeModal(){
        UIView.animate(withDuration: 0.3) {
            self.modalView.transform = CGAffineTransform(translationX: 0, y: self.view.frame.height)
            self.blurEffectView.alpha = 0
        } completion: { (_) in
            print("done")
            self.modalView.removeFromSuperview()
        }

    }
    
    @objc func clickTapped(){
        view.addSubview(modalView)
        modalView.translatesAutoresizingMaskIntoConstraints = false
        modalView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        modalView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        modalView.widthAnchor.constraint(equalToConstant: 300).isActive = true
        modalView.heightAnchor.constraint(equalToConstant: 500).isActive = true
        
        modalView.transform = CGAffineTransform(translationX: 0, y: self.view.frame.height)
        modalView.delegate = self
        
        UIView.animate(withDuration: 0.3) {
            self.blurEffectView.alpha = 1
            self.modalView.transform = .identity
        }
    }
    //MARK: Init
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    //MARK: Configure
    func configure(){
        view.backgroundColor = .systemBackground
            
        view.addSubview(clickButton)
        clickButton.translatesAutoresizingMaskIntoConstraints = false
        clickButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        clickButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        view.addSubview(blurEffectView)
        blurEffectView.translatesAutoresizingMaskIntoConstraints = false
        blurEffectView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        blurEffectView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        blurEffectView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        blurEffectView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        blurEffectView.alpha = 0

        
    }
    
}

extension AnimationController : ModalViewDelegate {
    func closeButtonTapped() {
        closeModal()
    }
}
