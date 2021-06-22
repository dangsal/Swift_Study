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
        let alert = UIAlertController(title: "새로추가할 일", message: "해야하는 일을 추가하세요.", preferredStyle: .alert)
        alert.addTextField { field in
            field.placeholder = "해야하는 일을 추가하세요."
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
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // delete
            lists.remove(at: indexPath.row)
            var currentLists = UserDefaults.standard.stringArray(forKey: "lists") ?? []
            currentLists.remove(at: indexPath.row)
            UserDefaults.standard.setValue(currentLists, forKey: "lists")
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
}







