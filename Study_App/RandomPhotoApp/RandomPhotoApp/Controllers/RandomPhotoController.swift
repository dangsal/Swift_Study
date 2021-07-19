//
//  RandomPhotoController.swift
//  RandomPhotoApp
//
//  Created by 이성호 on 2021/07/19.
//

import UIKit

class RandomPhotoController : UIViewController {
    //MARK: Property
    lazy var changeBtn : UIButton = {
        let bt = UIButton()
        bt.backgroundColor = .white
        bt.setTitle("Random Photo", for: .normal)
        bt.setTitleColor(.black, for: .normal)
        bt.addTarget(self, action: #selector(changeBtnTapped), for: .touchUpInside)
        return bt
    }()
    
    lazy var imageView : UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.backgroundColor = .white
        return iv
    }()
    
    let colors : [UIColor] = [.systemRed, .systemBlue, .systemPink, .systemGray, .systemTeal, .systemOrange, .systemYellow]
    
    //MARK: Selectors
    @objc func changeBtnTapped(){
        getRandomPhoto()
        
        view.backgroundColor = colors.randomElement()
        
    }
    //MARK: Functions
    func getRandomPhoto(){
        let urlString = "https://source.unsplash.com/random/600x600"
        if let url = URL(string: urlString){
            guard let data = try? Data(contentsOf: url) else {
                return
            }
            DispatchQueue.main.async {
                self.imageView.image = UIImage(data: data)
            }
            
        }
    }
    //MARK: Init
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        configureComponent()
    }
    //MARK: Configure
    func configure(){
        view.backgroundColor = colors.randomElement()
        getRandomPhoto()
        navigationItem.title = "Random Photo"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    func configureComponent(){
        view.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 300).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 300).isActive = true
        
        view.addSubview(changeBtn)
        changeBtn.translatesAutoresizingMaskIntoConstraints = false
        changeBtn.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 40).isActive = true
        changeBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        changeBtn.widthAnchor.constraint(equalToConstant: 300).isActive = true
        changeBtn.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
    }
    //MARK: Extensions
}
