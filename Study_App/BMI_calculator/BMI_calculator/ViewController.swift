//
//  ViewController.swift
//  BMI_calculator
//
//  Created by 이성호 on 2021/02/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var txtHeight: UITextField!
    @IBOutlet var txtWeight: UITextField!
    @IBOutlet var lblResult: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func btnResult(_ sender: UIButton) {
        

        if txtHeight.text == "" || txtWeight.text == "" {
            print("error")
            lblResult.text = "키와 체중을 입력하세요."
            return
            
        } else {
            
            
            let weight = Double(txtWeight.text!)!       // text 는 옵셔널 스트링형, 170입력하면 옵셔널 스트링형이야. 그래서! 붙여야해
            let height = Double(txtHeight.text!)!       // Double 로 바꿔줬는데 옵셔널 더블형이라 ! 필요해
            // **** textfield 의 text 프로퍼티는 String? 형 ****

    //        print(Int("10")) -> optional(10)
    //        print(Int("10!")) -> 10
    //        print(Int("HI")) -> nil
    //        print(Double(10)) -> 10
    //        print(Double("10.5")) -> optional(10.5)
    //        print(Double("Hi")) -> nil  // print(Double("Hi")!) -> crash
            
            let bmi = weight / (height * height * 0.0001)
            let shortenedBmi = String(format: "%.1f", bmi)
            var body = ""
            var color = UIColor.white
            
            if bmi >= 40 {
                body = "3단계 비만"
                color = UIColor(displayP3Red: 1.0, green: 0.0, blue: 0.0, alpha: 1.0)
                } else if bmi >= 30 && bmi < 40 {
                body = "2단계 비만"
                color = UIColor(displayP3Red: 0.7, green: 0.0, blue: 0.0, alpha: 1.0)
                } else if bmi >= 25 && bmi < 30 {
                body = "1단계 비만"
                color = UIColor(displayP3Red: 0.4, green: 0.0, blue: 0.0, alpha: 1.0)
                } else if bmi >= 18.5 && bmi < 25 {
                body = "정상"
                color = UIColor(displayP3Red: 0.0, green: 0.0, blue: 1.0, alpha: 1.0)
                } else {
                body = "저체중"
                color = UIColor(displayP3Red: 0.0, green: 1.0, blue: 0.0, alpha: 1.0)
                }
            print("BMI: \(shortenedBmi) , 판정: \(body)")
            lblResult.textColor = color
            
//            lblResult.clipsToBounds = true
//            lblResult.layer.cornerRadius = 10 // 라벨 둥글게 둥글게
            
            lblResult.text = "BMI: \(shortenedBmi) , 판정: \(body)"
        }

    }
    
}

