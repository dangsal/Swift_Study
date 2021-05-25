//
//  ConversationsViewController.swift
//  MessengerApp
//
//  Created by 이성호 on 2021/05/25.
//

import UIKit

class ConversationsViewController: UIViewController {
    
    //MARK: Init
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    //MARK: Override func
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let isLoggedIn = UserDefaults.standard.bool(forKey: "logged_in")
        print(isLoggedIn)
        if !isLoggedIn {
            let vc = LoginViewController()
            let nav = UINavigationController(rootViewController: vc)
            nav.modalPresentationStyle = .fullScreen
            present(nav, animated: false, completion: nil)
        }
    }
    
    //MARK: Configure
    func configure(){
        view.backgroundColor = .systemGray
    }
}
