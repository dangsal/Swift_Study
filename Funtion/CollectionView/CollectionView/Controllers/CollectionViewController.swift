//
//  CollectionViewController.swift
//  CollectionView
//
//  Created by 이성호 on 2021/06/21.
//

import UIKit

private let collectionCellIdentifier = "cell"
private let collectionHeaderIdentifier = "header"

class CollectionViewController: UICollectionViewController {
    
    //MARK: Property
    let items = ["1","2","3","4","5","6","7","8","9","10"]
    
    
    //MARK: Init
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    //MARK: Configure
    func configure(){
        
        collectionView.register(CollectionCell.self, forCellWithReuseIdentifier: collectionCellIdentifier)
        // 해더 등록시 forsupplementary 있는거
        collectionView.register(CollectionHeaderCell.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: collectionHeaderIdentifier)
    }
}


extension CollectionViewController {
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: collectionCellIdentifier, for: indexPath) as! CollectionCell
        
        cell.item = items[indexPath.row]
        return cell
    }
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
            //Header
            let cell = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: collectionHeaderIdentifier, for: indexPath) as! CollectionHeaderCell
            return cell
       
    }
}

// FlowLayout
extension CollectionViewController : UICollectionViewDelegateFlowLayout {
    //셀 크기 조정
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (view.frame.width / 3) - 2, height: (view.frame.width / 3) - 2)
    }
    //셀들간의 가로 거리 조정
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    //셀들간의 세로 거리 조정
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    //헤더 사이즈 조정
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.width, height: (view.frame.width / 3) * 2)
    }
}
