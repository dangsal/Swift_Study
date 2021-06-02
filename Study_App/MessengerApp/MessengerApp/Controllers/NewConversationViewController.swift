//
//  NewConversationViewController.swift
//  MessengerApp
//
//  Created by 이성호 on 2021/05/25.
//

import UIKit
import JGProgressHUD

class NewConversationViewController: UIViewController {
    
    //MARK: Property
    
    lazy var spinner = JGProgressHUD()
    
    lazy var searchBar : UISearchBar = {
        let bar = UISearchBar()
        bar.placeholder = "유저를 검색하세요"
        return bar
    }()
    
    lazy var tableView: UITableView = {
        let table = UITableView()
        table.isHidden = true
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return table
    }()
    
    lazy var noResultsLable: UILabel = {
        let label = UILabel()
        label.isHidden = true
        label.text = "No Results"
        label.textAlignment = .center
        label.textColor = .green
        label.font = UIFont.systemFont(ofSize: 21, weight: .medium)
        return label
    }()
    
    //MARK: Init
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    //MARK: Selector
    @objc func didTapCancel(){
        dismiss(animated: true, completion: nil)
    }
    //MARK: Configure
    func configure(){
        view.backgroundColor = .systemBackground
        searchBar.delegate = self
        navigationController?.navigationBar.topItem?.titleView = searchBar
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Cancel", style: .done, target: self, action: #selector(didTapCancel))
        
        searchBar.becomeFirstResponder()
    }
}

extension NewConversationViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
    }
}
