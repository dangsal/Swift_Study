//
//  WebViewController.swift
//  WebView
//
//  Created by 이성호 on 2021/07/20.
//

import UIKit
import WebKit

class WebKitController : UIViewController {
    //MARK: Property
    lazy var webkit : WKWebView = {
        let wk = WKWebView()
        wk.load(URLRequest(url: URL(string: "https://dangsalcoding.tistory.com/m")!))
        return wk
    }()
    

    
    //MARK: Selectors

    //MARK: Functions
    //MARK: Init
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        configureComponent()
    }
    //MARK: Configure
        func configure(){
            view.backgroundColor = .systemGroupedBackground
        }
        
        func configureComponent(){
            
            view.addSubview(webkit)
            webkit.translatesAutoresizingMaskIntoConstraints = false
            webkit.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
            webkit.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor).isActive = true
            webkit.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor).isActive = true
            webkit.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true

        }
}
//MARK: Extensions
