//
//  NewsService.swift
//  NewsApp_without_Storyboard
//
//  Created by 이성호 on 2021/05/18.
//

import Foundation

protocol NewsServiceProtocol {
    func newsService(articles: [Articles])
}

class NewsService {
    
    var delegate : NewsServiceProtocol?
    
    let url = "https://newsapi.org/v2/top-headlines?country=kr&apiKey=543b7956cdde4668975988bb38180bb0"
    
    func fetchNews(){
        if let url = URL(string: url){
            URLSession.shared.dataTask(with: url) { data, response, error in
                if let error = error {
                    print(error.localizedDescription)
                } else {
                    if let data = data {
                        do{
                            let news = try JSONDecoder().decode(News.self, from: data)
                            DispatchQueue.main.async {
                                self.delegate?.newsService(articles: news.articles!)
                            }
                        }catch {
                            print(error.localizedDescription)
                        }
                    }
                }
            }.resume()
        }
    }
}
