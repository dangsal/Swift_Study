//
//  ComposeViewController.swift
//  MemoApp_6
//
//  Created by 이성호 on 2021/03/30.
//

import UIKit

class ComposeViewController: UIViewController {
    
    var editTarget: Memo?
    var originalMemoContent: String?
    
    @IBAction func btnCancel(_ sender: Any?) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBOutlet var textView: UITextView!
    
    @IBAction func btnSave(_ sender: Any?) {
        
        if let memo = textView.text , memo.count > 0 {
            // 저장
            
            if let target = editTarget {
                target.content = memo
                DataManager.shared.saveContext()
                NotificationCenter.default.post(name: ComposeViewController.memoDidChange, object: nil)
            } else {
                DataManager.shared.addNewMemo(memo)
                NotificationCenter.default.post(name: ComposeViewController.newMemoDidInsert, object: nil)
            }
            
            
            
            
            dismiss(animated: true, completion: nil)
        } else {
            // 경고 알림
            alert(message: "메모를 입력하세여")
            
        }
        
    
    }
    
    var willShowToken: NSObjectProtocol?
    var willHideToken: NSObjectProtocol?
    
    deinit {
        if let token = willShowToken {
            NotificationCenter.default.removeObserver(token)
        }
        if let token = willHideToken {
            NotificationCenter.default.removeObserver(token)
        }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let memo = editTarget {
            navigationItem.title = "메모편집"
            textView.text = memo.content
            originalMemoContent = memo.content
        } else {
            navigationItem.title = "새 메모"
            textView.text = ""
        }
        textView.delegate = self
        
        willShowToken = NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillShowNotification, object: nil, queue: OperationQueue.main, using: { [weak self](noti) in
            guard let strongSelf = self else {return}
        
            if let frame = noti.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
                let height = frame.cgRectValue.height
                
                var inset = strongSelf.textView.contentInset
                inset.bottom = height
                strongSelf.textView.contentInset = inset

                inset = strongSelf.textView.verticalScrollIndicatorInsets
                inset.bottom = height
                strongSelf.textView.scrollIndicatorInsets = inset
            }
        })
        
        willHideToken = NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillHideNotification, object: nil, queue: OperationQueue.main, using: { [weak self] (noti) in
            guard let strongSelf = self else {return}

            var inset = strongSelf.textView.contentInset
            inset.bottom = 0
            strongSelf.textView.contentInset = inset

            inset = strongSelf.textView.verticalScrollIndicatorInsets
            strongSelf.textView.scrollIndicatorInsets = inset
        })
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.presentationController?.delegate = self
        
        textView.becomeFirstResponder()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.presentationController?.delegate = nil
        
        textView.resignFirstResponder()
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

extension ComposeViewController: UITextViewDelegate {
    func textViewDidChange(_ textView: UITextView) {
        if let original = originalMemoContent, let edited = textView.text {
            isModalInPresentation = original != edited
        }
    }
}

extension ComposeViewController: UIAdaptivePresentationControllerDelegate{
    func presentationControllerDidAttemptToDismiss(_ presentationController: UIPresentationController) {
        let alert = UIAlertController(title: "알림", message: "편집한 내용을 저장할까요?", preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "확인", style: .default) { (action) in
            self.btnSave(action)
        }
        alert.addAction(okAction)
        let cancelAction = UIAlertAction(title: "취소", style: .cancel) { [weak self] (action) in
            self?.btnCancel(action)
        }
        alert.addAction(cancelAction)
        
        present(alert, animated: true, completion: nil)
    }
}
