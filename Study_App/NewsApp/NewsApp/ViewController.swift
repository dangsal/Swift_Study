//
//  ViewController.swift
//  NewsApp
//
//  Created by 이성호 on 2021/04/07.
//

import UIKit

class ViewController: UIViewController {
    
    var model = NewsModel()
    var news = [News]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        model.delegate = self
        model.getNews()
    }


}

extension ViewController: NewsModelProtocol {
    
    func newsRetrieved(articles: [News]) {
        print("articles 를 NewsModel 에서 가져옴")
        self.news = articles
    }
}
