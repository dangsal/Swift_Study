//
//  ViewController.swift
//  HorizontalScrollView
//
//  Created by 이성호 on 2021/04/17.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet var scrollView: UIScrollView!
    
    var images = [
        "image1.jpg",
        "image2.jpg",
        "image3.jpg",
        "image4.jpg",
        "image5.jpg",
        "image6.jpg"
    ]
    
    func scrollRandomImages(){
        for i in 0..<images.count{
            let imageView = UIImageView()   // 이미지를 보여줄거기 때문에 UIImageView 생성
            imageView.image = UIImage(named: images[i]) // UIImageView 에 image 넣기
            imageView.contentMode = .scaleAspectFit // 사진의 비율 맞추기
            let xPosition = self.view.frame.width * CGFloat(i)  // 우리가 만들 scrollView 는 Horizontal 이기 때문에 각각의 UIImageView 는 가로로 배치된다. 이렇게 가로로 배치시키기 위해서는 각 뷰의 x좌표를 설정해 주어야한다. 하나의 화면에 하나의 이미지만 보이도록 설정
            
            imageView.frame = CGRect(x: xPosition, y: 0, width: self.view.frame.width, height: self.view.frame.height)  // 이미지뷰가 화면 전체를 덮
            
            scrollView.contentSize.width = self.view.frame.width * CGFloat(i+1)
            // 크기는 이미지의 갯수만큼 반복문을 돌면서 그때그때 각각의 이미지의 크기에 맟춰 scrollView 사이즈를 늘려줘야한다.
            // Horiaontal ScrollView 이기 때문에 width 값을 이미지의 갯수와 크기에 맞춰 늘려주어야한다.
            // ScrollView의 width값은 UIImageView 의 width값에 의해 결정이 되고 화면에서 이미지를 하나만 보여주기 때문에 UIimageView의 width값은 화면의 width 값이다.
            
            scrollView.addSubview(imageView)    // 스크롤뷰의 크기가 결정되면 이미지를 scrollView 에 올려준다.
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollRandomImages()
        
    }


}

