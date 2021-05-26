//
//  ConversationsViewController.swift
//  MessengerApp
//
//  Created by 이성호 on 2021/05/25.
//

import UIKit
import FirebaseAuth

class ConversationsViewController: UIViewController {
    
    //MARK: Init
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    //MARK: Override func
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        validateAuth()
        
    }
    
    //MARK: Functions
    func validateAuth(){
        if FirebaseAuth.Auth.auth().currentUser == nil {
           let vc = LoginViewController()
           let nav = UINavigationController(rootViewController: vc)
           nav.modalPresentationStyle = .fullScreen
           present(nav, animated: false, completion: nil)
       }
   }
    
    //MARK: Configure
    func configure(){
        view.backgroundColor = .systemRed
        
    }
}
