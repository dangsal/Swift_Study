//
//  TableViewController.swift
//  NewsApp_without_Storyboard
//
//  Created by 이성호 on 2021/05/18.
//

import UIKit
import SafariServices

private let reuseableIdentifier = "cell"

class TableViewController : UITableViewController {
    //MARK: Property
    
    let newsService = NewsService()
    var articles = [Articles](){
        didSet{
            tableView.reloadData()
        }
    }
    
    //MARK: Init
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureComponent()

    }
    //MARK: Selector
    
    
    
    //MARK: Helper

    
    //MARK: ConfigureComponent
    func configureComponent(){
        navigationItem.title = "News"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        tableView.register(TableViewCell.self, forCellReuseIdentifier: reuseableIdentifier)
        tableView.separatorStyle = .none
        newsService.fetchNews()
        newsService.delegate = self
        

    }
}


extension TableViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseableIdentifier, for: indexPath) as! TableViewCell
        
        let article = self.articles[indexPath.row]
        cell.articles = article
        cell.layer.borderWidth = 0.3
        cell.layer.borderColor = UIColor.systemGray.cgColor
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        let article = articles[indexPath.row]
        
        if let url = URL(string: article.url!){
            let vc = SFSafariViewController(url: url)
            present(vc, animated: true, completion: nil)
        }
    }
    
}
extension TableViewController {
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
}

extension TableViewController: NewsServiceProtocol {
    func newsService(articles: [Articles]) {
        self.articles = articles
    }
    

    
    
}
