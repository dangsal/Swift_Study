//
//  LoginViewController.swift
//  MessengerApp
//
//  Created by 이성호 on 2021/05/25.
//

import UIKit

class LoginViewController: UIViewController {
    //MARK: Property
    
    lazy var imageView: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "logo")
        iv.contentMode = .scaleAspectFit
        return iv
    }()
    
//    lazy var scrollView: UIScrollView = {
//        let scrollView = UIScrollView()
//        scrollView.clipsToBounds = true
//        return scrollView
//    }()

    lazy var emailField: UITextField = {
        let tf = UITextField()
        tf.autocapitalizationType = .none
        tf.autocorrectionType = .no
        tf.returnKeyType = .done
        tf.layer.cornerRadius = 12
        tf.layer.borderWidth = 1
        tf.layer.borderColor = UIColor.systemGray.cgColor
        tf.placeholder = "이메일"
        tf.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 5, height: 0))
        tf.leftViewMode = .always
        tf.backgroundColor = .white
        return tf
    }()
    
    lazy var passwordField: UITextField = {
        let tf = UITextField()
        tf.autocapitalizationType = .none
        tf.autocorrectionType = .no
        tf.returnKeyType = .continue
        tf.layer.cornerRadius = 12
        tf.layer.borderWidth = 1
        tf.layer.borderColor = UIColor.systemGray.cgColor
        tf.placeholder = "6자리이상 비밀번호"
        tf.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 5, height: 0))
        tf.leftViewMode = .always
        tf.backgroundColor = .white
        tf.isSecureTextEntry = true
        return tf
    }()
    
    lazy var loginButton: UIButton = {
        let bt = UIButton(type: .system)
        bt.setTitle("로그인", for: .normal)
        bt.backgroundColor = .link
        bt.setTitleColor(.white, for: .normal)
        bt.layer.cornerRadius = 12
        bt.layer.masksToBounds = true
        bt.titleLabel?.font = .systemFont(ofSize: 20, weight: .bold)
        return bt
    }()
    
    //MARK: Init
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    //MARK: Configure
    func configure(){
        title = "로그인"
        view.backgroundColor = .white
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "가입하기", style: .done, target: self, action: #selector(didTapRegister))

        hidekeyboardWhenTappedAround()
        configureComponents()
        
        emailField.delegate = self
        passwordField.delegate = self
        
        

        
    }
    
    func configureComponents(){
        view.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 150).isActive = true
        imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        view.addSubview(emailField)
        emailField.translatesAutoresizingMaskIntoConstraints = false
        emailField.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 25).isActive = true
        emailField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        emailField.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -60).isActive = true
        emailField.heightAnchor.constraint(equalToConstant: 52).isActive = true
        
        view.addSubview(passwordField)
        passwordField.translatesAutoresizingMaskIntoConstraints = false
        passwordField.topAnchor.constraint(equalTo: emailField.bottomAnchor, constant: 20).isActive = true
        passwordField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        passwordField.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -60).isActive = true
        passwordField.heightAnchor.constraint(equalToConstant: 52).isActive = true
        
        view.addSubview(loginButton)
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        loginButton.topAnchor.constraint(equalTo: passwordField.bottomAnchor, constant: 20).isActive = true
        loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        loginButton.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -60).isActive = true
        loginButton.heightAnchor.constraint(equalToConstant: 52).isActive = true
        loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
    }
    
    
    //MARK: Functions
    func alertUserLoginError(){
        let alert = UIAlertController(title: "알림", message: "모든 정보를 입력하세요.", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "확인", style: .cancel, handler: nil))
        present(alert, animated: true)
    }
    
    
    //MARK: Selectors
    @objc func loginButtonTapped(){
        
        emailField.resignFirstResponder()
        passwordField.resignFirstResponder()
        
        guard let email = emailField.text, let password = passwordField.text, !email.isEmpty, !password.isEmpty, password.count >= 6 else {
            alertUserLoginError()
            return
        }
        
        // Firebase Log In
        
        
    }
    
    @objc func didTapRegister(){
        let vc = RegisterViewController()
        vc.title = "Create Account"
        navigationController?.pushViewController(vc, animated: true)
    }
}


extension LoginViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if textField == emailField {
            passwordField.becomeFirstResponder()
        } else if textField == passwordField {
            loginButtonTapped()
        }
        
        return true
    }
}
