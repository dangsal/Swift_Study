//
//  NewsModel.swift
//  NewsApp
//
//  Created by 이성호 on 2021/04/07.
//

import Foundation

protocol NewsModelProtocol{
    func newsRetrieved(articles:[News])
}

class NewsModel{
    
    var delegate: NewsModelProtocol?
    
    func getNews(){
        
        let urlString = "https://newsapi.org/v2/top-headlines?country=kr&apiKey=543b7956cdde4668975988bb38180bb0"
        
        let url = URL(string: urlString)
        
        guard url != nil else {return}
        let session = URLSession.shared
        
        let dataTask = session.dataTask(with: url!) { (data, response, error) in
            if error == nil && data != nil {
                let decoder = JSONDecoder()
                do{
                    let newsService = try decoder.decode(NewsService.self, from: data!)
                    DispatchQueue.main.async {
                        self.delegate?.newsRetrieved(articles: newsService.articles!)
                    }
                }catch{
                    print(error.localizedDescription)
                }
            }
        }
        dataTask.resume()
        
        
    }

}
