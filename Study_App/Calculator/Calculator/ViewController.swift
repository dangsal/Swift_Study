//
//  ViewController.swift
//  Calculator
//
//  Created by 이성호 on 2021/02/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var lblResult: UILabel!
    
    var currentNum = 0
    var tempNum = 0
    var op = ""
    var isOperation = false
    
    
    func resultChange(_ a: Int) {
        
        if isOperation == true {
            currentNum = currentNum * 10 + a
            lblResult.text = String(currentNum)
        } else {
            
            
        }
   

    }


    func operation(_ a: Double , _ b: Double, _ op: String) -> Double {
        switch op {
        case "+":
            return (a + b)
        case "-":
            return (a - b)
        case "*":
            return (a * b)
        case "/":
            return (a / b)
        case "%":
            return a.truncatingRemainder(dividingBy: b)
        default:
            return 0
        }
    }
    
    
    @IBAction func btn0(_ sender: UIButton) {
        resultChange(0)
        
    }
    @IBAction func btn1(_ sender: UIButton) {
        resultChange(1)

    }
    @IBAction func btn2(_ sender: UIButton) {
        resultChange(2)

    }
    @IBAction func btn3(_ sender: UIButton) {
        resultChange(3)

    }
    @IBAction func btn4(_ sender: UIButton) {
        resultChange(4)

    }
    @IBAction func btn5(_ sender: UIButton) {
        resultChange(5)

    }
    @IBAction func btn6(_ sender: UIButton) {
        resultChange(6)

    }
    @IBAction func btn7(_ sender: UIButton) {
        resultChange(7)

    }
    @IBAction func btn8(_ sender: UIButton) {
        resultChange(8)

    }
    @IBAction func btn9(_ sender: UIButton) {
        resultChange(9)

    }
    @IBAction func btnDot(_ sender: UIButton) {
        
    }
    @IBAction func btnResult(_ sender: UIButton) {
    }
    
    @IBAction func btnPlus(_ sender: UIButton) {
        op = "+"
        isOperation = true
        
        
    }
    @IBAction func btnMinus(_ sender: UIButton) {
        op = "-"
        isOperation = true
    }
    @IBAction func btnMulti(_ sender: UIButton) {
        op = "*"
        isOperation = true
    }
    @IBAction func btnDivide(_ sender: UIButton) {
        op = "/"
        isOperation = true
    }
    @IBAction func btnPercent(_ sender: UIButton) {
        op = "%"
        isOperation = true
    }
    @IBAction func btnAbs(_ sender: UIButton) {
        currentNum = currentNum * (-1)
        lblResult.text = String(currentNum)
    }
    @IBAction func btnReset(_ sender: UIButton) {
        currentNum = 0
        lblResult.text = String(currentNum)
    }
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
}

