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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.viewBottom.backgroundColor = UIColor.white.withAlphaComponent(0.3)
        self.viewTop.backgroundColor = UIColor.white.withAlphaComponent(0.3)
    }


}

