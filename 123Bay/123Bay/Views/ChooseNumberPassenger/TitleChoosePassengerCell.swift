//
//  TitleChoosePassengerCell.swift
//  123bay
//
//  Created by Os on 6/7/17.
//  Copyright © 2017 123bay. All rights reserved.
//

import UIKit

class TitleChoosePassengerCell: BaseCollectionViewCell {
    
    //MARK: Variable
    fileprivate let TitleTypePassenger = [TypePassenger.init(_nameType: "Người lớn", _oldPassenger: "Trên 12 tuổi"), TypePassenger.init(_nameType: "Trẻ em", _oldPassenger: "Từ 2 - 11 tuổi"), TypePassenger.init(_nameType: "Em bé", _oldPassenger: "Dưới 2 tuổi")]
    
    fileprivate let cellTitleDetailId = "cellTitleDetailId"
    
    //MARK: Create Object
    lazy private var collectionViewTitle: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionviewConfig = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        collectionviewConfig.register(TitleDetailCell.self,
                                      forCellWithReuseIdentifier: "cellTitleDetailId")
        
        collectionviewConfig.delegate = self
        collectionviewConfig.dataSource = self
        collectionviewConfig.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        collectionviewConfig.showsVerticalScrollIndicator = false
        collectionviewConfig.showsVerticalScrollIndicator = false
        collectionviewConfig.isScrollEnabled = false
        return collectionviewConfig
    }()
    
    //MARK: Initialize funtion
    override func setupview() {
        super.setupview()
        setupViewcollectionViewTitle()
    }
    
    //MARK: SetupView function
    private func setupViewcollectionViewTitle() {
        addSubview(collectionViewTitle)
        collectionViewTitle.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
    
}

extension TitleChoosePassengerCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
         return TitleTypePassenger.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellTitleDetailId, for: indexPath) as? TitleDetailCell else { return UICollectionViewCell() }
   
        cell.typePassenger = TitleTypePassenger[indexPath.item]
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let widthCellTitle = self.frame.width / 3
        return CGSize(width: widthCellTitle, height: self.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
