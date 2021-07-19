//
//  MainViewController.swift
//  QuizApp
//
//  Created by 이성호 on 2021/07/19.
//

import UIKit

class MainViewController: UIViewController {
    //MARK: Property
    lazy var startBtn: UIButton = {
        let bt = UIButton(type: .system)
        bt.setTitle("Start", for: .normal)
        bt.tintColor = .white
        bt.backgroundColor = .black
        return bt
    }()
    
    //MARK: Selectors
    //MARK: Functions
    //MARK: Init
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        configureComponent()
    }
    //MARK: Configure
        func configure(){
            view.backgroundColor = .systemPurple
            navigationController?.navigationBar.prefersLargeTitles = true
            navigationItem.title = "Quiz Game"
            navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
            navigationController?.navigationBar.largeTitleTextAttributes = [. foregroundColor: UIColor.white]
        }
        
        func configureComponent(){
            view.addSubview(startBtn)
            startBtn.translatesAutoresizingMaskIntoConstraints = false
            startBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
            startBtn.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 100).isActive = true
            startBtn.widthAnchor.constraint(equalToConstant: 300).isActive = true
            startBtn.heightAnchor.constraint(equalToConstant: 50).isActive = true
        }
}
//MARK: Extensions
