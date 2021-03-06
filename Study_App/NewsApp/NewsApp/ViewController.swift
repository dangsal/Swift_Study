//
//  ViewController.swift
//  NewsApp
//
//  Created by 이성호 on 2021/04/07.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    
    
    var model = NewsModel()
    var news = [News]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        model.delegate = self
        model.getNews()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let indexPath = tableView.indexPathForSelectedRow
        
        guard indexPath != nil else{return}
        let selectedAtNews = news[indexPath!.row]
        
        let detailVC = segue.destination as! DetailViewController
        detailVC.url = selectedAtNews.url!
    }
}

extension ViewController: NewsModelProtocol {
    
    func newsRetrieved(articles: [News]) {
        print("articles 를 NewsModel 에서 가져옴")
        self.news = articles
        tableView.reloadData()
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.news.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomTableViewCell
        let new = self.news[indexPath.row]
        
        cell.displayNews(news: new)
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}
