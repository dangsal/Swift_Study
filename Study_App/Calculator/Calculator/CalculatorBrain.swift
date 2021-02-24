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
    
    private var operations: Dictionary<String,Double> = [
        "π" : Double.pi,
        "e" : M_E
        
    ]
    
    
    func performOperation(symbol : String) {
        if let constant = operations[symbol]{
            accumulator = constant
        }
    }
    
    var result : Double {        // read only property
        get {
            return accumulator
        }
    }
    
}


