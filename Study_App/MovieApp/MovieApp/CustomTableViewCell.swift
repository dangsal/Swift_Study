//
//  CustomTableViewCell.swift
//  MovieApp
//
//  Created by 이성호 on 2021/04/13.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    @IBOutlet var movieTitle: UILabel!
    @IBOutlet var movieYear: UILabel!
    @IBOutlet var movieImage: UIImageView!
    
    
    var movieDisplay: Movie?
    
    func displayMovie(movie:Movie){
        
        
        
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
