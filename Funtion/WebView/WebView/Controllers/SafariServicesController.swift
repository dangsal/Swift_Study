//
//  WebViewController.swift
//  WebView
//
//  Created by 이성호 on 2021/07/20.
//

import UIKit
import SafariServices

class SafariServicesController : UIViewController {
    //MARK: Property
    let vc = SFSafariViewController(url: URL(string: "https://dangsalcoding.tistory.com/m")!)
    
    lazy var button : UIButton = {
        let bt = UIButton(type: .system)
        bt.setTitle("Go to Safari WebView!!", for: .normal)
        bt.addTarget(self, action: #selector(btTapped), for: .touchUpInside)
        return bt
    }()
    
    lazy var button2 : UIButton = {
        let bt = UIButton(type: .system)
        bt.setTitle("Go to WebKit!!", for: .normal)
        bt.addTarget(self, action: #selector(btTapped2), for: .touchUpInside)
        return bt
    }()
    //MARK: Selectors
    @objc func btTapped(){
        present(vc, animated:  true)
    }
    @objc func btTapped2(){
        navigationController?.pushViewController(WebKitController(), animated: true)
    }
    //MARK: Functions
    //MARK: Init
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        configureComponent()
    }
    //MARK: Configure
        func configure(){
            view.backgroundColor = .systemGroupedBackground
        }
        
        func configureComponent(){
            
            view.addSubview(button)
            button.translatesAutoresizingMaskIntoConstraints = false
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true

            view.addSubview(button2)
            button2.translatesAutoresizingMaskIntoConstraints = false
            button2.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
            button2.centerYAnchor.constraint(equalTo: view.centerYAnchor,constant: 40).isActive = true
        }
}
//MARK: Extensions
