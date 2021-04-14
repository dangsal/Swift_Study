//
//  DetailViewController.swift
//  MovieApp
//
//  Created by 이성호 on 2021/04/14.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet var DetailImg: UIImageView!
    @IBOutlet var DetailTitle: UILabel!
    @IBOutlet var DetailYear: UILabel!
    @IBOutlet var DetailGenre: UILabel!
    @IBOutlet var DetailRating: UILabel!
    @IBOutlet var DetailUrl: UILabel!
    @IBOutlet var DetailTableView: UITableView!

    
    
    var movie : Movie?
    
    var detailTitle: String?
    var detailYear: String?
//    var detailGenre: String?
    var detailRating: String?
    var detailSummary: String?
    var detailUrl: String?
    var detailImage: String?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        DetailTitle.text = detailTitle
        DetailRating.text = detailRating
        DetailUrl.text = detailUrl
        DetailYear.text = detailYear
        
        
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
extension DetailViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = DetailTableView.dequeueReusableCell(withIdentifier: "summary", for: indexPath)
        
        cell.textLabel?.text = detailSummary
        return cell
    }
    
    
}
