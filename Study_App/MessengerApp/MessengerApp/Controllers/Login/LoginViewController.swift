//
//  LoginViewController.swift
//  MessengerApp
//
//  Created by 이성호 on 2021/05/25.
//

import UIKit
import FirebaseAuth
import FBSDKLoginKit
import GoogleSignIn
import JGProgressHUD


class LoginViewController: UIViewController {
    //MARK: Property
    
    lazy var spinner = JGProgressHUD(style: .dark)
    
    private var loginObserver : NSObjectProtocol?
    
    let faceBookLoginButton : FBLoginButton = {
        let bt = FBLoginButton()
        bt.permissions = ["email", "public_profile"]
        return bt
    }()
    
    
    lazy var imageView: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "logo")
        iv.contentMode = .scaleAspectFit
        return iv
    }()
    
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
    
    lazy var googleLogInButton : GIDSignInButton =  {
        let bt = GIDSignInButton()
        return bt
    }()
    
    
    
    //MARK: Init
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    deinit {
        if let observer = loginObserver {
            NotificationCenter.default.removeObserver(observer)
        }
    }
    
    //MARK: Configure
    func configure(){
        
        
        loginObserver = NotificationCenter.default.addObserver(forName: Notification.Name.didLogInNotification, object: nil, queue: .main, using: { [weak self] _ in
            guard let strongSelf = self else {return}
            
            strongSelf.navigationController?.dismiss(animated: true, completion: nil)
        })
        
        GIDSignIn.sharedInstance().presentingViewController = self
        
        title = "로그인"
        view.backgroundColor = .white
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "회원가입", style: .done, target: self, action: #selector(didTapRegister))

        hidekeyboardWhenTappedAround()
        configureComponents()
        
        emailField.delegate = self
        passwordField.delegate = self
        
        faceBookLoginButton.delegate = self
    
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
        
        
        view.addSubview(faceBookLoginButton)
        faceBookLoginButton.translatesAutoresizingMaskIntoConstraints = false
        faceBookLoginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        faceBookLoginButton.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 20).isActive = true

        view.addSubview(googleLogInButton)
        googleLogInButton.translatesAutoresizingMaskIntoConstraints = false
        googleLogInButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        googleLogInButton.topAnchor.constraint(equalTo: faceBookLoginButton.bottomAnchor, constant: 20).isActive = true
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
        
        spinner.show(in: view)
        
        // Firebase Log In
        FirebaseAuth.Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in
            
            guard let strongSelf = self else {
                return
            }
            
            DispatchQueue.main.async {
                strongSelf.spinner.dismiss()
            }
            
            
            guard let result = authResult, error == nil else {return}
            
            UserDefaults.standard.set(email, forKey: "email")
            
            let user = result.user
            print("Logged In User: \(user)")
            strongSelf.navigationController?.dismiss(animated: true, completion: nil)
        }
        
    }
    
    @objc func didTapRegister(){
        let vc = RegisterViewController()
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

extension LoginViewController : LoginButtonDelegate{
    func loginButtonDidLogOut(_ loginButton: FBLoginButton) {
        // no operation
        
    }
    
    func loginButton(_ loginButton: FBLoginButton, didCompleteWith result: LoginManagerLoginResult?, error: Error?) {
        guard let token = result?.token?.tokenString else {
            print("User failed to log in with facebook")
            return
        }
        
        let facebookRequest = FBSDKLoginKit.GraphRequest(graphPath: "me", parameters: ["fields": "email, first_name, last_name, picture.type(large)"], tokenString: token, version: nil, httpMethod: .get)
        
        facebookRequest.start(completionHandler: { _, result, error in
                    guard let result = result as? [String: Any],
                        error == nil else {
                            print("Failed to make facebook graph request")
                            return
                    }
            
            guard let firstName = result["first_name"] as? String,
                  let lastName = result["last_name"] as? String,
                  let email = result["email"] as? String,
                  let picture = result["picture"] as? [String:Any?] ,
                  let data = picture["data"] as? [String: Any],
                  let pictureUrl = data["url"] as? String
                  else {
                print("Failed to get email and name from facebook result")
                return
            }
            
            UserDefaults.standard.set(email, forKey: "email")
  

//
//            let lastName = userName[userName.startIndex]
//            let startIndex:String.Index = userName.index(userName.startIndex, offsetBy: 1)
//            let firstName = userName[startIndex...]
//


            
            DatabaseManager.shared.userExists(with: email) { exists in
                if !exists {
                    let chatUser = ChatAppUser(firstName: String(firstName), lastName: String(lastName), emailAddress: email)
                                               DatabaseManager.shared.insertUser(with: chatUser, completion: { success in
                                                if success {
                                                    guard let url = URL(string: pictureUrl) else {return}
                                                    print("Downloading data from facebook image")
                                                    URLSession.shared.dataTask(with: url) { data, _ , error in
                                                        guard let data = data else {
                                                            print("Failed to get data from facebook")
                                                            return}
                                                        print("got data from FB, uploading")
                                                        //upload images
                                                        let fileName = chatUser.profilePictureFileName
                                                        StorageManager.shared.uploadProfilePicture(with: data, fileName: fileName) { result in
                                                            switch result {
                                                            case .success(let downloadUrl):
                                                                UserDefaults.standard.set(downloadUrl,forKey: "profile_picture_url")
                                                                print(downloadUrl)
                                                            case .failure(let error):
                                                                print("Storage manager error: \(error)")
                                                            }
                                                        }
                                                    }.resume()
                                                }
                                               })
                }
            }
            
            let credential = FacebookAuthProvider.credential(withAccessToken: token)
            FirebaseAuth.Auth.auth().signIn(with: credential) { [weak self] authResult, error in
                guard let strongSelf = self else {return}
                
                guard authResult != nil , error == nil else {
                    print("Facebook credential login failed")
                    return
                }
                print("Facebook login success")
                strongSelf.navigationController?.dismiss(animated: true, completion: nil)

            }
        }
        )
        }
    
}


