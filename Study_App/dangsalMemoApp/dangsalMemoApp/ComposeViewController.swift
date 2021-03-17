//
//  ComposeViewController.swift
//  dangsalMemoApp
//
//  Created by 이성호 on 2021/03/15.
//

import UIKit

class ComposeViewController: UIViewController {
    
    var editTarget: Memo?

    @IBOutlet var memoTextView: UITextView!
    
    
    @IBAction func close(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil) // modal 화면 끌때 사용하는 메소드 ,<#T##(() -> Void)?##(() -> Void)?##() -> Void#> 화면이 닫을때 실행할 코드를 클로져로
    }
    
    @IBAction func save(_ sender: UIBarButtonItem) {
        
        guard let memo = memoTextView.text, memo.count > 0 else {
            alert(message: "메모를 입력하세요")
            return
        }
        
//        let newMemo = Memo(content: memo)
//        Memo.dummyMemoList.append(newMemo)
        if let target = editTarget {
            target.content = memo
            DataManager.shared.saveContext()
            NotificationCenter.default.post(name: ComposeViewController.memoDidChange, object: nil)
        } else {
            DataManager.shared.addNewMemo(memo)
            NotificationCenter.default.post(name: ComposeViewController.newMemoDidInsert, object: nil)
        }
        
        
        
        
        
        dismiss(animated: true, completion: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let memo = editTarget {
            navigationItem.title = "메모 편집"
            memoTextView.text = memo.content
        } else {
            navigationItem.title = "새 메모"
            memoTextView.text = ""
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension ComposeViewController {
    static let newMemoDidInsert = Notification.Name(rawValue: "newMemoDidInsert")
    static let memoDidChange = Notification.Name(rawValue: "memoDidChange")
}
