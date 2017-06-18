//
//  PromotionController.swift
//  123bay
//
//  Created by hai on 6/11/17.
//  Copyright © 2017 123bay. All rights reserved.
//

import UIKit

//This controller show the promotion from 123bay.vn

class PromotionController: UIViewController {
    
    //MARK:
    //MARK: Create variables
    fileprivate let promotionCell = "PromotionCell"
    
    private lazy var promotionCollection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let promotionCollection = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        promotionCollection.backgroundColor = Theme.shared.promotionScreenBackground
        promotionCollection.register(PromotionCell.self, forCellWithReuseIdentifier: "PromotionCell")
        promotionCollection.delegate = self
        promotionCollection.dataSource = self
        
        return promotionCollection
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = Theme.defaultColor
        setupForPromotionCollection()
    }
    
    //MARK:
    //MARK: Autolayout for elements
    private func setupForPromotionCollection() {
        view.addSubview(promotionCollection)
        promotionCollection.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(60)
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.bottom.equalToSuperview().offset(-80)
        }
    }
}

//MARK:
//MARK: Promotion Collection datasoure and delegate
extension PromotionController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: promotionCell, for: indexPath) as? PromotionCell else {
            return PromotionCell()
        }
        
        cell.showPromotion()
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.view.frame.width, height: 170)
    }
}
