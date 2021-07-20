//
//  CountDownController.swift
//  CuntDownApp
//
//  Created by 이성호 on 2021/07/20.
//

import UIKit


class CountDownController : UIViewController {

    //MARK: Property
    let nextVC = DatePickController()
    
    lazy var label : UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        return label
    }()
    //MARK: Selectors
    @objc func addTapped(){
        navigationController?.pushViewController(nextVC, animated: true)
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
            view.backgroundColor = .systemGray

            navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addTapped))
            
            nextVC.delegate = self
        }
        
        func configureComponent(){
            
            view.addSubview(label)
            label.translatesAutoresizingMaskIntoConstraints = false
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
            label.widthAnchor.constraint(equalToConstant: 100).isActive = true
            label.heightAnchor.constraint(equalToConstant: 60).isActive = true

        }

}
//MARK: Extensions
extension CountDownController: DatePickControllerProtocol {
    func dataSave(text: String) {
        label.text = text
    }
}
