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
        
        guard let url = URL(string: "https://m.naver.com") else {return}
        let request = URLRequest(url: url)
        webView.load(request)
        
        
    }
    

}
