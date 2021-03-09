//
//  ViewController.swift
//  KaKaoTalk_Profile_Page_AutoLayout
//
//  Created by 이성호 on 2021/03/09.
//

import UIKit

class ViewController: UIViewController {

    
    
    
    @IBOutlet var emailButton: UIButton!
    
    
    
    @IBOutlet var profilImageView: UIImageView!
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        emailButton.layer.cornerRadius = 3
        emailButton.layer.borderColor = UIColor.lightGray.cgColor
        emailButton.layer.borderWidth = 1
        
        profilImageView.layer.cornerRadius = profilImageView.bounds.width / 2
    }


}

