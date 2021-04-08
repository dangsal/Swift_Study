//
//  MemoViewController.swift
//  MemoApp_6
//
//  Created by 이성호 on 2021/03/30.
//

import UIKit

class MemoViewController: UIViewController {
    
    var memo: Memo?
    
    @IBOutlet var memoTableView: UITableView!
    
    @IBAction func share(_ sender: UIBarButtonItem) {
        guard let memo = memo?.content else {return}
        let vc = UIActivityViewController(activityItems: [memo], applicationActivities: nil)
        present(vc, animated: true, completion: nil)
        
        if let pc = popoverPresentationController {
            pc.barButtonItem = sender
        }
    }
    
    
    @IBAction func deleteMemo(_ sender: Any) {
    
        let alert = UIAlertController(title: "알림", message: "메모를 삭제할까요?", preferredStyle: .alert)
        let deleteAction = UIAlertAction(title: "삭제", style: .destructive) {(action) in
            DataManager.shared.deleteMemo(self.memo)
            self.navigationController?.popViewController(animated: true)
        }
        let cancelAction = UIAlertAction(title: "취소", style: .cancel, handler: nil)
        
        alert.addAction(deleteAction)
        alert.addAction(cancelAction)
        
        present(alert, animated: true, completion: nil)
    }
    
    
    let formatter: DateFormatter = {
       let f = DateFormatter()
        f.dateStyle = .long
        f.timeStyle = .short
        f.locale = Locale(identifier: "Ko_kr")
        
        return f
    }()

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination.children.first as? ComposeViewController{
            vc.editTarget = memo
        }
    }
    
    var token: NSObjectProtocol?
    
    deinit {
        if let token = token {
            NotificationCenter.default.removeObserver(token)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        NotificationCenter.default.addObserver(forName: ComposeViewController.memoDidChange, object: nil, queue: OperationQueue.main) { [weak self] (noti) in
            self?.memoTableView.reloadData()
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

extension MemoViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row{
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "memoCell", for: indexPath)
            
            cell.textLabel?.text = memo?.content
            
            return cell
            
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "dateCell", for:indexPath)
            
            cell.textLabel?.text = formatter.string(for: memo?.insertDate)
            
            return cell
            
        default:
            fatalError()
        }
    }
    
    
    
}
