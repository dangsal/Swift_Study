//
//  WebViewController.swift
//  BMI_calculator
//
//  Created by 이성호 on 2021/02/23.
//

import UIKit
import WebKit

class WebViewController: UIViewController {

    
    @IBOutlet var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func btnGoNaver(_ sender: UIButton) {
        
        guard let url = URL(string: "https://m.naver.com") else {return} // guard <불리한표현식> else { 거짓일때 실행될코드, 빠져나가는 코드 }
        let request = URLRequest(url: url)                              // 표현식이 참일 경우에 실행되는 코드는 이곳에 위치
        webView?.load(request)
        
        
    }
    

}
