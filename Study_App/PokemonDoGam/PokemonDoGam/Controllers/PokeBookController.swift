//
//  PokeBookController.swift
//  PokemonDoGam
//
//  Created by 이성호 on 2021/05/03.
//

import UIKit

let reuseableIdentifier = "pokebookCell"

class PokeBookController: UICollectionViewController {
    // MARK: Init
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configViewControllers()
    }
    // MARK: 시스템 테마가 변경되어있을때마다 자동으로 호출되는 함수
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        adjustColor()
    }
    
    // MARK: Selectors 함수를 추가할 때는 @objc 붙여야함
    @objc func searchTapped(){
        print("search tapped")
    }
    
    
    func adjustColor(){
        if self.traitCollection.userInterfaceStyle == .dark {
            // 다크모드일때
            navigationController?.navigationBar.tintColor = .white
        } else {
            // 라이트모드일때
            navigationController?.navigationBar.tintColor = .black
        }
    }
    // MARK: Helper
    func configViewControllers(){
        collectionView.backgroundColor = .systemBackground
        navigationController?.navigationBar.barTintColor = UIColor.mainColor
        navigationController?.navigationBar.isTranslucent = false // 원래 네비게이션바 색상으로 바꾸려면 false 로 바꾸면 됨
        
        self.title = "포켓몬도감"
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(searchTapped)) //selector 부분은
            
        
        adjustColor()
        
        collectionView.register(PokemonCell.self, forCellWithReuseIdentifier: reuseableIdentifier)
    }
}

// MARK: collectionViewCell delegate functions
extension PokeBookController {
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseableIdentifier, for: indexPath) as! PokemonCell
        
        return cell
    }
}


extension PokeBookController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (view.frame.width - 36) / 3
        return CGSize(width: width, height: width)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 32, left: 8, bottom: 8, right: 8)
    }
}
