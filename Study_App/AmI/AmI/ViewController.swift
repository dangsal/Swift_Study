//
//  ViewController.swift
//  AmI
//
//  Created by 이성호 on 2021/02/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var lblHello: UILabel! // 초기값이 없어서 옵셔널!
    
    @IBOutlet var txtName: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func btnSend(_ sender: UIButton) {
        
        lblHello.text = "Hello, " + txtName.text!
        
    }
    
}

