//
//  ComposeViewController.swift
//  dangsalMemoApp
//
//  Created by 이성호 on 2021/03/15.
//

import UIKit

class ComposeViewController: UIViewController {


    
    @IBAction func close(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil) // modal 화면 끌때 사용하는 메소드 ,<#T##(() -> Void)?##(() -> Void)?##() -> Void#> 화면이 닫을때 실행할 코드를 클로져로 
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
