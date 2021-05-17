//
//  RootViewController.swift
//  tutorial
//
//  Created by 이성호 on 2021/05/17.
//

import UIKit

class RootViewController : UIViewController {
    
    //Property

    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = " Treduler"
        label.font = UIFont.italicSystemFont(ofSize: 40)
        return label
    }()
    
    lazy var loginLabel: UILabel = {
        let label = UILabel()
        label.text = "login"
        label.font = UIFont.systemFont(ofSize: 18)
        return label
    }()
    
    lazy var idView: UIView = {
        let view = UIView()
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.tertiarySystemGroupedBackground.cgColor
        view.layer.cornerRadius = 10
        
        view.addSubview(idTextField)
        idTextField.translatesAutoresizingMaskIntoConstraints = false
        idTextField.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        idTextField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10).isActive = true
        idTextField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10).isActive = true
        idTextField.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        return view
    }()
    
    lazy var pwView: UIView = {
        let view = UIView()
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.tertiarySystemGroupedBackground.cgColor
        view.layer.cornerRadius = 10
        
        view.addSubview(pwTextField)
        pwTextField.translatesAutoresizingMaskIntoConstraints = false
        pwTextField.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        pwTextField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10).isActive = true
        pwTextField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10).isActive = true
        pwTextField.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        return view
    }()
    
    lazy var idTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "ID"
        return tf
    }()
    
    lazy var pwTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "PW"
        return tf
    }()
    
    lazy var loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Log in", for: .normal)
        button.layer.cornerRadius = 8
        button.addTarget(self, action: #selector(loginTapped), for: .touchUpInside)
        return button
    }()
    
    // MARK: Life Cycle Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureViewComponents()

        self.hidekeyboardWhenTappedAround()
//        self.moveViewWithKeyboard()
    }
    
    //MARK: override
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        adjustColor()
    }
    
    //MARK: Selectors
    @objc func loginTapped(){
        let scrollViewController = ScrollViewController()
        self.navigationController?.pushViewController(scrollViewController, animated: true)
    }
    
    //MARK: Helpers
    

    func adjustColor(){
        if traitCollection.userInterfaceStyle == .dark {
            self.loginButton.backgroundColor = .white
            self.loginButton.tintColor = .black
        } else {
            self.loginButton.backgroundColor = .black
            self.loginButton.tintColor = .white
        }
    }
    

    
    //MARK: Configure
    
    func configureViewComponents(){
        view.backgroundColor = .systemBackground
        
        view.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 110).isActive = true
        
        view.addSubview(loginLabel)
        loginLabel.translatesAutoresizingMaskIntoConstraints = false
        loginLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        loginLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20).isActive = true
        
        view.addSubview(idView)
        idView.translatesAutoresizingMaskIntoConstraints = false
        idView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        idView.topAnchor.constraint(equalTo: loginLabel.bottomAnchor, constant: 30).isActive = true
        idView.widthAnchor.constraint(equalToConstant: view.frame.width - 50).isActive = true
        idView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        view.addSubview(pwView)
        pwView.translatesAutoresizingMaskIntoConstraints = false
        pwView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        pwView.topAnchor.constraint(equalTo: idView.bottomAnchor, constant: 20).isActive = true
        pwView.widthAnchor.constraint(equalToConstant: view.frame.width - 50).isActive = true
        pwView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        view.addSubview(loginButton)
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        loginButton.topAnchor.constraint(equalTo: pwView.bottomAnchor, constant: 40).isActive = true
        loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        loginButton.widthAnchor.constraint(equalToConstant: view.frame.width - 50).isActive = true
        loginButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        adjustColor()
    }
    
}
