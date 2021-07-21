//
//  NotesViewController.swift
//  NotesApp
//
//  Created by 이성호 on 2021/07/21.
//

import UIKit

private let reuseIdentifier = "Tablecell"

protocol NotesProtocol {
    func cellTapped(title: String, content: String)
}

class NotesViewController : UIViewController {
    //MARK: Property
    var notes = [Notes]()
    var delegate : NotesProtocol?
    
    let newVC = NewNoteViewController()
    
    lazy var label : UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.text = "메모가 없습니다."
        return label
    }()
    
    lazy var tableView : UITableView = {
        let tv = UITableView()
        return tv
    }()
    //MARK: Selectors
    @objc func addTapped(){
        navigationController?.pushViewController(newVC, animated: true)
    }
    //MARK: Functions
    //MARK: Init
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        configureComponent()
    }
    //MARK: Configure
        func configure(){
            view.backgroundColor = .systemBackground
            self.title = "Notes"
            navigationController?.navigationBar.prefersLargeTitles = true
            navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addTapped))
            navigationController?.navigationBar.tintColor = .black
            
            tableView.delegate = self
            tableView.dataSource = self
            
            newVC.delegate = self
        }
        
        func configureComponent(){
            view.addSubview(label)
            label.translatesAutoresizingMaskIntoConstraints = false
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
            
            tableView.isHidden = true
            tableView.register(TableCell.self, forCellReuseIdentifier: reuseIdentifier)
            
            view.addSubview(tableView)
            tableView.translatesAutoresizingMaskIntoConstraints = false
            tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        }

}
//MARK: Extensions
extension NotesViewController : UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notes.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! TableCell
  

        cell.titleLabel.text = notes[indexPath.row].title
        cell.contentLabel.text = notes[indexPath.row].content
        
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let title = notes[indexPath.row].title
        let content = notes[indexPath.row].content
        delegate?.cellTapped(title: title, content: content)
        navigationController?.pushViewController(ShowNoteViewController(), animated: true)
    }
}

extension NotesViewController : NewNoteProtocol {
    func saveTapped(title: String, content: String) {
        self.notes.append(Notes(title: title, content: content))
        label.isHidden = true
        tableView.isHidden = false
        tableView.reloadData()
    }
}
