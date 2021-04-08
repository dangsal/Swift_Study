//
//  DetailViewController.swift
//  NewsApp
//
//  Created by 이성호 on 2021/04/07.
//

import UIKit
import WebKit

class DetailViewController: UIViewController, WKNavigationDelegate {
    
    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    
    var url: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        webView.navigationDelegate = self
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        guard self.url != nil else {return}
        
        let url = URL(string: self.url!)
        
        guard self.url != nil else{return}
        let urlRequest = URLRequest(url: url!)
        self.spinner.alpha = 1
        self.spinner.startAnimating()
        webView.load(urlRequest)
        
        
    }


}
