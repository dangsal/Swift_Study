//
//  File.swift
//  Calculator
//
//  Created by 이성호 on 2021/02/24.
//

import Foundation 

class CalculatorBrain {
    private var accumulator = 0.0
    
    func setOperand(operand: Double) {
        accumulator = operand
    }
    
    func performOperation(symbol : String) {
        switch symbol {
        case "π":
            accumulator = Double.pi
        case "√":
            accumulator = sqrt(accumulator)
        default: break          // 어느  case에도 속하지 않을때  
        }
    }
    
    var result : Double{        // read only property
        get{
            return accumulator
        }
    }
    
}

