//
//  BottomMenuBar.swift
//  123bay
//
//  Created by Os on 5/25/17.
//  Copyright © 2017 123bay. All rights reserved.
//

import UIKit

/*
    This class display Bottom Menu Bar
 */
class BottomMenuBar: BaseCollectionViewCell {
    
    //MARK: Variable
    fileprivate let cellMenuBarId = "cellMenuBarId"
    fileprivate let arrayNameIcon = ["2-6", "2-7", "2-8"]
    fileprivate let arrayTitle = ["Trang chủ", "Hướng dẫn", "Khuyến mãi"]
    
    //MARK: Create Object
    lazy var collectionViewMenuBar: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        var collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        collectionView.isScrollEnabled = false
        collectionView.showsVerticalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.backgroundColor = UIColor.clear
        collectionView.register(BottomMenuBarCell.self, forCellWithReuseIdentifier: "cellMenuBarId")
        collectionView.delegate = self
        collectionView.dataSource = self
        return collectionView
    }()

    
    //MARK: Initialize fucntion
    override func setupview() {
        super.setupview()
        self.backgroundColor = UIColor.rgbColor(red: 25, green: 160, blue: 288, alpha: 1)
        setupCollectionViewMeunuBar()
    }
    
    //MARK: setupView function
    func setupCollectionViewMeunuBar() {
        addSubview(collectionViewMenuBar)
        collectionViewMenuBar.snp.makeConstraints { (make) in
            make.width.equalToSuperview()
            make.height.equalToSuperview()
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
        }
    }
}

//MARK: - Extension BottomMenuBar
extension BottomMenuBar: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    //MARK: - Number of Item
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    //MARK: - SetupView for cell
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellMenuBarId, for: indexPath) as! BottomMenuBarCell
        cell.imageIcons.image = UIImage(named: arrayNameIcon[indexPath.item])
        cell.labelTitle.text = arrayTitle[indexPath.item]
        cell.backgroundColor = UIColor.rgbColor(red: 25, green: 160, blue: 288, alpha: 1)
        return cell
    }
    
    //MARK: - Size for Item
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.frame.width / 3, height: self.frame.height)
    }
    
    //MARK: - Line Spacing for Item
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        switch indexPath.item {
        case 0:
            //PromotionController: Man hinh khuyen mai
            //let promotionController = PromotionController()
            break
        case 1:
            break
        case 2:
            break
        default:
            break
        }
        
        //SuccessBookingController: Man hinh hoan tat dat ve may bay
    }
}









