//
//  ToDoListViewController.swift
//  ToDoList
//
//  Created by 이성호 on 2021/06/21.
//

import UIKit

private let reuseIdentifier = "cell"

class ToDoListViewController : UITableViewController {
    
    //MARK: Property
    var lists = [String]()
    
    //MARK: Init
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    //MARK: Selectior
    @objc func didTapAdd(){
        alertPopUp()
    }
    
    //MARK: Function
    func alertPopUp(){
        let alert = UIAlertController(title: "새로 추가할 일", message: "해야하는 일을 추가하십쇼.", preferredStyle: .alert)
        
        alert.addTextField { field in
            field.placeholder = "할일을 입력하세요."
        }
        alert.addAction(UIAlertAction(title: "취소", style: .cancel, handler: nil))
        alert.addAction(UIAlertAction(title: "확인", style: .default, handler: { [weak self](_) in
            if let field = alert.textFields?.first {
                if let text = field.text, !text.isEmpty {
                    DispatchQueue.main.async {
                        var currentLists = UserDefaults.standard.stringArray(forKey: "lists") ?? []
                        currentLists.append(text)
                        UserDefaults.standard.setValue(currentLists, forKey: "lists")
                        self?.lists.append(text)
                        self?.tableView.reloadData()
                    }
                }
            }
        }))
        present(alert,animated: true)
    }
    
    //MARK: Configure
    func configure(){
        
        self.lists = UserDefaults.standard.stringArray(forKey: "lists") ?? []
        
        title = "To Do List"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(didTapAdd))
        tableView.register(ToDoCell.self, forCellReuseIdentifier: reuseIdentifier)
        
    }
    
}



extension ToDoListViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return lists.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! ToDoCell
        cell.textLabel?.text = lists[indexPath.row]
        return cell
    }
}
