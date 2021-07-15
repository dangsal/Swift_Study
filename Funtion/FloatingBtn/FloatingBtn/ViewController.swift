//
//  ViewController.swift
//  FloatingBtn
//
//  Created by 이성호 on 2021/07/15.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var floatingButton : UIButton = {
        let bt = UIButton(frame: CGRect(x: 0, y: 0, width: 60, height: 60))
        bt.backgroundColor = .systemPink
        bt.tintColor = .white
        bt.setTitleColor(.white, for: .normal)
        
        let image = UIImage(systemName: "plus", withConfiguration: UIImage.SymbolConfiguration(pointSize: 32, weight: .medium))
        bt.setImage(image, for: .normal)
        
        bt.layer.cornerRadius = 30
        // Shadow 주려면 masksToBound false 로
//        bt.layer.masksToBounds = true
        bt.layer.shadowRadius = 10
        bt.layer.shadowOpacity = 0.5
        bt.addTarget(self, action: #selector(didTapBtn), for: .touchUpInside)
        return bt
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        view.addSubview(floatingButton)
        floatingButton.translatesAutoresizingMaskIntoConstraints = false
        floatingButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        floatingButton.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -10).isActive = true
        floatingButton.widthAnchor.constraint(equalToConstant: 60).isActive = true
        floatingButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
    }
    
    @objc func didTapBtn(){
        let alert = UIAlertController(title: "Add Something", message: "Floating Btn Tapped", preferredStyle: .alert)
        
        let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alert.addAction(cancel)
        
        present(alert,animated: true)
    }

}

