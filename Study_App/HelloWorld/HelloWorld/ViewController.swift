//
//  ViewController.swift
//  HelloWorld
//
//  Created by 이성호 on 2021/03/01.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBOutlet var lblTitle: UILabel!

    @IBAction func btnUpdateLabel(_ sender: UIButton) {
        
        lblTitle.text = "Hello IOS"
    }
    
}

