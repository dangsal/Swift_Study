//
//  CustomTableViewCell.swift
//  NewsApp
//
//  Created by 이성호 on 2021/04/07.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    @IBOutlet weak var headLineText: UILabel!
    @IBOutlet weak var headLineImage: UIImageView!
    
    
    
    var newsDisplay: News?
    
    func displayNews(news:News){
        
        headLineText.text=""
        headLineImage.image = nil
        
        newsDisplay = news
        
        headLineText.text = newsDisplay!.title
        
        guard newsDisplay!.urlToImage != nil else {return}
        let urlString = newsDisplay!.urlToImage!
        let url = URL(string: urlString)
        
        guard url != nil else {return}
        let session = URLSession.shared
        
        let dataTask = session.dataTask(with: url!) { (data, response, error) in
            if(error == nil && data != nil){
                
                if(self.newsDisplay!.urlToImage == urlString){
                    DispatchQueue.main.async {
                        self.headLineImage.image = UIImage(data: data!)
                    }
                }
            }
        }
        dataTask.resume()
    }
    
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
