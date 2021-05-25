//
//  MainController.swift
//  TabBar
//
//  Created by 이성호 on 2021/05/25.
//

import UIKit

class MainController : UIViewController {
    
    //MARK:Init
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARK: Override Function
    override func viewDidAppear(_ animated: Bool) {
        configure()
    }
    
    //MARK: Function
    func configure(){
        view.backgroundColor = .systemBackground
        
        let tabBarVC = UITabBarController()
        
        let vc1 = UINavigationController(rootViewController: FirstTabViewController())
        let vc2 = UINavigationController(rootViewController: SecondTabViewController())
        let vc3 = UINavigationController(rootViewController: ThirdTabViewController())
        let vc4 = UINavigationController(rootViewController: FourthTabViewController())
        let vc5 = UINavigationController(rootViewController: FifthTabViewController())
        
        vc1.title = "Home"
        vc2.title = "Contact"
        vc3.title = "Help"
        vc4.title = "About"
        vc5.title = "Settings"
        
        tabBarVC.setViewControllers([vc1,vc2,vc3,vc4,vc5], animated: false)
        
        guard let items = tabBarVC.tabBar.items else {return}
        
        let images = ["house","bell","person.circle","star","gear"]
        
        for x in 0..<items.count {
            items[x].badgeValue = "m"
            items[x].image = UIImage(systemName: images[x])
        }
        
        tabBarVC.modalPresentationStyle = .fullScreen
        present(tabBarVC, animated: true, completion: nil)
        
    }
}
