//
//  ViewController.swift
//  Calculator
//
//  Created by 이성호 on 2021/02/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var lblResult: UILabel!
    
    var userIsInTheMiddleOfTypeing = false
    
    @IBAction func performOperation(_ sender: UIButton) {
        userIsInTheMiddleOfTypeing = false
        if let mathmaticalSymbol = sender.currentTitle {
            if mathmaticalSymbol == "π" {
                lblResult.text = String(Double.pi) //M_PI
            }
        }
    }
    
    @IBAction func touchDigit(_ sender: UIButton) {
        
        let digit = sender.currentTitle!
        
        if userIsInTheMiddleOfTypeing {
            let textCurrentlyDisplay = lblResult.text!
            lblResult.text = textCurrentlyDisplay + digit
        } else {
            lblResult.text = digit
        }
        userIsInTheMiddleOfTypeing = true

    }
    
        
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
}

