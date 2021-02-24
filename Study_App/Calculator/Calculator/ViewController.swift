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
    
    private var displayValue : Double {         //computed property
        get {                                   //displayValue 값을 가져오기
            return Double(lblResult.text!)!
        }
        set {                                   //displayValue 값을 설정하기
            lblResult.text = String(newValue)       //newValue 는 누군가가 displayValue = 에 넣어주었을때 값을 칭하는 키워드
        }
    }
    private var brain = CalculatorBrain()          // brain을 통해서 controller 가 model 에 접근해, = CalculatorBrain() 은 이니셜라이즈하는거
    
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

