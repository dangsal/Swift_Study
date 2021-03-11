//
//  ViewController.swift
//  Kakao_profil_Autolayout_Clone
//
//  Created by 이성호 on 2021/03/09.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var viewTop: UIView!
    @IBOutlet var viewBottom: UIView!
    @IBOutlet var profilImageView: UIImageView!
    @IBOutlet var bottomView: UIView!
    @IBOutlet var viewPencil: UIView!
    @IBOutlet var viewUser: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.viewTop.backgroundColor = UIColor.white.withAlphaComponent(0.0)
        self.viewBottom.backgroundColor = UIColor.white.withAlphaComponent(0.0)
        
        profilImageView.layer.cornerRadius = profilImageView.bounds.width * 0.38
        
        bottomView.layer.borderColor = UIColor.white.cgColor
        bottomView.layer.borderWidth = 0.4
        
        self.viewPencil.backgroundColor = UIColor.white.withAlphaComponent(0.0)
        self.viewUser.backgroundColor = UIColor.white.withAlphaComponent(0.0)
    }


}

