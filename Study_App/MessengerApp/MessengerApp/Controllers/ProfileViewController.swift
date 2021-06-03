//
//  ProfileViewController.swift
//  MessengerApp
//
//  Created by 이성호 on 2021/05/25.
//

import UIKit
import FirebaseAuth
import FBSDKLoginKit
import GoogleSignIn

let reuseableIdentifier = "cell"

class ProfileViewController: UITableViewController {
    //MARK: Property
    
    let data = ["Log Out"]
    

    
    //MARK: Init
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    //MAKR: configure
    func configure(){
        view.backgroundColor = .systemBackground
        title = "profile"
        navigationController?.navigationBar.prefersLargeTitles = true
        

    
        configureComponents()
    }
    
    func configureComponents(){
        tableView.register(ProfileCell.self, forCellReuseIdentifier: reuseableIdentifier)
    }
    
}

extension ProfileViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseableIdentifier, for: indexPath) as! ProfileCell

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let actionSheet = UIAlertController(title: "", message: "", preferredStyle: .actionSheet)
        
        actionSheet.addAction(UIAlertAction(title: "Log Out", style: .destructive, handler: { [weak self] (_) in
            
            guard let strongSelf = self else {return}
            
            // log out facebook
            FBSDKLoginKit.LoginManager().logOut()
            
            // log out google
            GIDSignIn.sharedInstance().signOut()
            
            do{
                try FirebaseAuth.Auth.auth().signOut()
                
                let vc = LoginViewController()
                let nav = UINavigationController(rootViewController: vc)
                nav.modalPresentationStyle = .fullScreen
                strongSelf.present(nav, animated: true, completion: nil)
                 
            } catch {
                print("Fail to log out")
            }
        }))
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        present(actionSheet, animated: true)
        

    }
    
}
