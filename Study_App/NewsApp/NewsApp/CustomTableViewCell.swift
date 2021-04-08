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
        
        headLineText.alpha = 0
        headLineImage.alpha = 0
        headLineImage.layer.cornerRadius = 15
        headLineImage.layer.shadowRadius = 10
        headLineImage.layer.shadowOffset = .init(width: 0 , height: 10)
        headLineImage.layer.shadowOpacity = 0.5
        headLineImage.layer.shadowColor = UIColor.black.cgColor
        headLineImage.layer.shadowPath = UIBezierPath(rect: self.headLineImage.bounds).cgPath
        headLineImage.layer.masksToBounds = false
        
        newsDisplay = news
        
        headLineText.text = newsDisplay!.title
        
        UIView.animate(withDuration: 0.6, delay: 0, options: .curveEaseOut, animations: {
            self.headLineText.alpha = 1
        }, completion: nil)
        
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
                        UIView.animate(withDuration: 0.6, delay: 0, options: .curveEaseOut, animations: {
                            self.headLineImage.alpha = 1

                        }, completion: nil)
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
