//
//  NewNoteViewController.swift
//  NotesApp
//
//  Created by 이성호 on 2021/07/21.
//

import UIKit

protocol NewNoteProtocol  {
    func saveTapped(title: String, content: String)
}

class NewNoteViewController: UIViewController {
    
    var delegate: NewNoteProtocol?
    
    //MARK: Property
    lazy var btwLine : UIView = {
        let line = UIView()
        line.backgroundColor = .black
        return line
    }()
    
    lazy var titleTextfield : UITextField = {
        let tf = UITextField()
        tf.font = UIFont.boldSystemFont(ofSize: 18)
        tf.placeholder = "새 메모의 제목을 적어주세요."

        tf.becomeFirstResponder()
        return tf
    }()
    lazy var contentTextfield : UITextView = {
        let tf = UITextView()
        tf.font = UIFont.systemFont(ofSize: 16)
        return tf
    }()
    //MARK: Selectors
    @objc func saveTapped(){
        if let titleText = titleTextfield.text , !titleText.isEmpty {
            if let contentText = contentTextfield.text , !contentText.isEmpty {
                delegate?.saveTapped(title: titleText, content: contentText)
                contentTextfield.text = ""
                titleTextfield.text = ""
                navigationController?.popViewController(animated: true)
            }
        }
        
    }
    //MARK: Functions
    //MARK: Init
    deinit {
        print("Deiniti2")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        configureComponent()
    }
    //MARK: Configure
        func configure(){
            view.backgroundColor = .systemBackground
            self.title = "New Note"
            navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(saveTapped))
            navigationController?.navigationBar.tintColor = .black
        }
        
        func configureComponent(){
            
            view.addSubview(titleTextfield)
            titleTextfield.translatesAutoresizingMaskIntoConstraints = false
            titleTextfield.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
            titleTextfield.leftAnchor.constraint(equalTo: view.leftAnchor,constant: 20).isActive = true
            titleTextfield.rightAnchor.constraint(equalTo: view.rightAnchor,constant: -20).isActive = true
            titleTextfield.heightAnchor.constraint(equalToConstant: 60).isActive = true
            
            view.addSubview(btwLine)
            btwLine.translatesAutoresizingMaskIntoConstraints = false
            btwLine.topAnchor.constraint(equalTo: titleTextfield.bottomAnchor, constant: 0).isActive = true
            btwLine.leftAnchor.constraint(equalTo: view.leftAnchor,constant: 20).isActive = true
            btwLine.rightAnchor.constraint(equalTo: view.rightAnchor,constant: -20).isActive = true
            btwLine.heightAnchor.constraint(equalToConstant: 0.2).isActive = true
            
            view.addSubview(contentTextfield)
            contentTextfield.translatesAutoresizingMaskIntoConstraints = false
            contentTextfield.topAnchor.constraint(equalTo: titleTextfield.bottomAnchor,constant: 10).isActive = true
            contentTextfield.leftAnchor.constraint(equalTo: view.leftAnchor,constant: 20).isActive = true
            contentTextfield.rightAnchor.constraint(equalTo: view.rightAnchor,constant: -20).isActive = true
            contentTextfield.bottomAnchor.constraint(equalTo: view.bottomAnchor,constant: -20).isActive = true
        }
}
//MARK: Extensions
