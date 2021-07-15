//
//  ViewController.swift
//  CustomSwipeAction
//
//  Created by 이성호 on 2021/05/12.
//

import UIKit

class User {
    let name: String
    var isFavorite: Bool
    var isMuted: Bool
    
    init(name: String,
         isFavorite: Bool,
         isMuted: Bool) {
        self.name = name
        self.isFavorite = isFavorite
        self.isMuted = isMuted
    }
}

class ViewController: UIViewController {
    
    lazy var tableView : UITableView = {
        let table = UITableView()
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return table
    }()
    
    var users: [User] = [
        "John Smith",
        "Ban Smith",
        "Ace Smith",
        "Twid Smith",
        "SWE Smith",
        "Bob Smith",
        "Yahn Smith",
    ].compactMap({
        User(name: $0,
             isFavorite: false,
             isMuted: false)
    })
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        title = "Swipe Actions"
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }

}


extension ViewController : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: "삭제") { aciton, view, success in
            // 코드
            self.users.remove(at: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: .automatic)
            success(true)
        }
        
        let shareAction = UIContextualAction(style: .normal, title: "공유") { action, view, success in
            print("공유")
            success(true)
        }
        shareAction.image = UIImage(named: "share.png")
        
        

        return UISwipeActionsConfiguration(actions: [deleteAction,shareAction])
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: "삭제") { aciton, view, success in
            // 코드
            self.users.remove(at: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: .automatic)
            success(true)
        }
        
        let shareAction = UIContextualAction(style: .normal, title: "공유") { action, view, success in
            print("공유")
            success(true)
        }
        
        shareAction.backgroundColor = .systemBlue
        shareAction.title = "제목"
        

        return UISwipeActionsConfiguration(actions: [deleteAction,shareAction])
    }
    


    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = users[indexPath.row].name
        
        return cell
    }
}
