//
//  Extensions.swift
//  MessengerApp
//
//  Created by 이성호 on 2021/05/25.
//

import UIKit

extension UIViewController {
    
    //MARK: 아무데나 탭 시 키보드 사라지게하기
    func hidekeyboardWhenTappedAround(){

        let tap = UITapGestureRecognizer(target: self, action: #selector(dissmissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dissmissKeyboard(){
        view.endEditing(true)

    }
    
    
    //MARK: 키보드 높이에 따라 UI 변경하기
    @objc func keyboardWillShow(notification:NSNotification){
        print("Show")
        
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y == 0 {
                self.view.frame.origin.y -= keyboardSize.height
            }
        }
    }
    
    @objc func keyboardWillHide(notification:NSNotification){
        print("Hide")
        if self.view.frame.origin.y != 0{
            self.view.frame.origin.y = 0
        }
    }
    
    func moveViewWithKeyboard(){
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
}
