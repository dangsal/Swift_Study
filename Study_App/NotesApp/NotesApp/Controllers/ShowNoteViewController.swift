//
//  ShowNoteViewController.swift
//  NotesApp
//
//  Created by 이성호 on 2021/07/21.
//

import UIKit

class ShowNoteViewController : UIViewController {
    //MARK: Property
    var notes = [Notes]()
    
    let vc = NotesViewController()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "제목들어갈곳"
        label.backgroundColor = .systemRed
        return label
    }()
    
    lazy var contentLabel: UILabel = {
        let label = UILabel()
        label.text = "내용이 들어갈 곳"
        label.backgroundColor = .systemBlue
        return label
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
            view.backgroundColor = .systemBackground
            vc.delegate = self
        }
        
        func configureComponent(){
            view.addSubview(titleLabel)
            titleLabel.translatesAutoresizingMaskIntoConstraints = false
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
            titleLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30).isActive = true
            titleLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
            
            view.addSubview(contentLabel)
            contentLabel.translatesAutoresizingMaskIntoConstraints = false
            contentLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 0).isActive = true
            contentLabel.leftAnchor.constraint(equalTo: view.leftAnchor,constant: 30).isActive = true
            contentLabel.rightAnchor.constraint(equalTo: view.rightAnchor,constant: -30).isActive = true
            
        }

}
//MARK: Extensions
extension ShowNoteViewController : NotesProtocol {
    func cellTapped(title: String, content: String) {
        print("SS")
        self.titleLabel.text = title
        self.contentLabel.text = content
    }
    
    
}
