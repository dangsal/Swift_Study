//
//  ViewController.swift
//  SimplePM
//
//  Created by 이성호 on 2021/02/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var lblNumber: UILabel!
    
    var x = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    @IBAction func btnPlus(_ sender: UIButton) {
        x += 1
        lblNumber.text = String(x)
    }
    
    @IBAction func btnMinus(_ sender: UIButton) {
        x -= 1
        lblNumber.text = String(x)
    }
    
}

