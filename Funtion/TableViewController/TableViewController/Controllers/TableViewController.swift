//
//  TableViewController.swift
//  TableViewController
//
//  Created by 이성호 on 2021/06/21.
//

import UIKit

private let reuseableIdentifier = "cell"

class TableViewController: UITableViewController {
    
    //MARK: Property
    let items = ["1","2","3","4","5","6","7","8","9","10"]
    
    //MARK: Init
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    //MARK: Configure
    func configure(){
        tableView.register(TableCell.self, forCellReuseIdentifier: reuseableIdentifier)
    }
}


extension TableViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseableIdentifier, for: indexPath) as! TableCell
        
        let item = self.items[indexPath.row]
        cell.item = item
        return cell
    }
}
