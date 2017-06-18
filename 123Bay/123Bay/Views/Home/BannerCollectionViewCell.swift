//
//  ContentCollectionViewCell.swift
//  123bay
//
//  Created by Huỳnh Công Thái on 5/23/17.
//  Copyright © 2017 123bay. All rights reserved.
//

import UIKit

class BannerCollectionViewCell: BaseCollectionViewCell {
    
    //MARK: Variable
    fileprivate let cellSlideImageId = "cellSlideImageId"
    
    //MARK: Create Object
    var labelTitle: UILabel = {
        let label = UILabel()
        label.text = "Chặng bay nhiều nhất"
        label.textColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        label.textAlignment = .left
        label.font = UIFont.systemFontSizeDevide(ofSize: 14)
        return label
    }()
    
    lazy var collectionViewSlideImage: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        var collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        collectionView.isScrollEnabled = true
        collectionView.showsVerticalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.backgroundColor = UIColor.clear
        collectionView.register(SlideImageCell.self, forCellWithReuseIdentifier: "cellSlideImageId")
        collectionView.delegate = self
        collectionView.dataSource = self
        return collectionView
    }()
    
    var lineDivider: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1).withAlphaComponent(0.3)
        return view
    }()
    
    //MARK: Initialize function
    override func setupview() {
        super.setupview()
        setupViewLabelTitle()
        setupViewCollectionViewSlideImage()
        setupupViewLineDevider()
    }
    
    //MARK: Setup view funtion
    
    func setupViewLabelTitle() {
        addSubview(labelTitle)
        labelTitle.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.left.equalToSuperview().offset(15)
            make.height.equalTo(self.snp.height).multipliedBy(0.2)
            make.width.equalToSuperview()
        }
    }
    
    func setupViewCollectionViewSlideImage() {
        addSubview(collectionViewSlideImage)
        collectionViewSlideImage.snp.makeConstraints { (make) in
            make.top.equalTo(labelTitle.snp.bottom)
            make.width.equalTo(self.snp.width)
            make.height.equalTo(self.snp.height).multipliedBy(0.7)
            make.left.equalToSuperview()
        }
    }
    
    func setupupViewLineDevider() {
        addSubview(lineDivider)
        lineDivider.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(15)
            make.right.equalToSuperview().offset(-15)
            make.height.equalTo(1)
            make.bottom.equalToSuperview().offset(-5)
        }
    }
    
}

extension BannerCollectionViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    //MARK: - Number item for collectionViewSlideImage
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    //MARK: - Setup View for collectionViewSlideImage
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellSlideImageId, for: indexPath) as! SlideImageCell
        return cell
    }
    
    //MARK: - Size for item of CollectionViewSlideImage
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.frame.width / 2 - 15, height: self.frame.height * 0.6)
    }
    
    //MARK: - Set line spacing 2 items in collectionViewSlideImage
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    //MARK: - Set edge for collectionViewCell
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 0)
    }
}
