//
//  Extension.swift
//  Movie_App_without_Storyboard
//
//  Created by 이성호 on 2021/05/19.
//

import UIKit

extension UIColor {
    static let mainColor = UIColor.systemIndigo
}

extension UICollectionViewController {
    
    //MARK: 아무데나 탭 시 키보드 사라지게하기
    func hidekeyboardWhenTappedAround(){

        let tap = UITapGestureRecognizer(target: self, action: #selector(dissmissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dissmissKeyboard(){
        view.endEditing(true)

    }
}
