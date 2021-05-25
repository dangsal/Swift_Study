//
//  SceneDelegate.swift
//  TabBar
//
//  Created by 이성호 on 2021/05/25.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        guard let scene = (scene as? UIWindowScene) else { return }
        self.window = UIWindow(windowScene: scene)
        
        // 탭바 컨트롤러 객체 생성
        let tabBarVC = UITabBarController()
        
        
        // 5개의 뷰 객체 생성(네비게이션컨트롤러형식)
        // 네비게이션 아니여도 됨
        // let vc1 = FirstTabViewController()
        let vc1 = UINavigationController(rootViewController: FirstTabViewController())
        let vc2 = UINavigationController(rootViewController: SecondTabViewController())
        let vc3 = UINavigationController(rootViewController: ThirdTabViewController())
        let vc4 = UINavigationController(rootViewController: FourthTabViewController())
        let vc5 = UINavigationController(rootViewController: FifthTabViewController())

        // 5개의 뷰 객체를 탭바 컨트롤러가 제어하도록 만들기
        tabBarVC.viewControllers = [vc1,vc2,vc3,vc4,vc5]
        
        
        // 탭 바 아이템 만들기
        let vc1Item = UITabBarItem(title: "Home", image: UIImage(systemName: "house"), tag: 0)
        let vc2Item = UITabBarItem(title: "Contact", image: UIImage(systemName: "bell"), tag: 0)
        let vc3Item = UITabBarItem(title: "Help", image: UIImage(systemName: "person.circle"), tag: 0)
        let vc4Item = UITabBarItem(title: "About", image: UIImage(systemName: "star"), tag: 0)
        let vc5Item = UITabBarItem(title: "Settings", image: UIImage(systemName: "gear"), tag: 0)
        
        // 탭 바 아이템 꾸미기
        vc1Item.badgeValue = "1"
        vc2Item.badgeValue = "2"
        vc2Item.badgeColor = .systemGreen
        
        // 탭 바 아이템 적용
        vc1.tabBarItem = vc1Item
        vc2.tabBarItem = vc2Item
        vc3.tabBarItem = vc3Item
        vc4.tabBarItem = vc4Item
        vc5.tabBarItem = vc5Item
        
        
        
        window?.rootViewController = tabBarVC
        window?.makeKeyAndVisible()
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}

