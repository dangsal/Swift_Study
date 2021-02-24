//
//  ViewController.swift
//  Calculator
//
//  Created by 이성호 on 2021/02/23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet private var lblResult: UILabel!
    
    private var userIsInTheMiddleOfTypeing = false
    
    
    @IBAction private func touchDigit(_ sender: UIButton) {
        
        let digit = sender.currentTitle!
        
        if userIsInTheMiddleOfTypeing {
            let textCurrentlyDisplay = lblResult.text!
            lblResult.text = textCurrentlyDisplay + digit
        } else {
            lblResult.text = digit
        }
        userIsInTheMiddleOfTypeing = true
        
    }
    
    private var displayValue : Double {
        get {
            return Double(lblResult.text!)!
        }
        set {
            lblResult.text = String(newValue)
        }
    }
    private var brain = CalculatorBrain()
    
    @IBAction private func performOperation(_ sender: UIButton) {
        if userIsInTheMiddleOfTypeing{
            brain.setOperand(operand: displayValue)
            userIsInTheMiddleOfTypeing = false
        }
        userIsInTheMiddleOfTypeing = false
        if let mathmaticalSymbol = sender.currentTitle {
            brain.performOperation(symbol: mathmaticalSymbol)
        }
        displayValue = brain.result
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
}

