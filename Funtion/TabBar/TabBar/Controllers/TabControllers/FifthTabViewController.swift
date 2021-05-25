//
//  FifthTabViewController.swift
//  TabBar
//
//  Created by 이성호 on 2021/05/25.
//

import UIKit

class FifthTabViewController : UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemYellow
        title = "Settings"
        print("ViewDidLoad")
    }
    override func viewDidDisappear(_ animated: Bool) {
        print("ViewDidDisaapear")
    }
    override func viewWillAppear(_ animated: Bool) {
        print("viewWillAppear")
    }
}
