//
//  MainMenuCollectionViewcell.swift
//  123bay
//
//  Created by Os on 5/25/17.
//  Copyright © 2017 123bay. All rights reserved.
//

import UIKit

class MainMenuCollectionViewCell: BaseCollectionViewCell {
    
    var homeController: HomeViewController?
    
    //MARK: Data test
    let arrayNameicons = ["2-2", "2-3", "2-4", "2-5"]
    let arrayTitle = ["Tìm chuyến bay", "Chặng bay phổ biến", "Khuyến mãi", "Trợ giúp"]
    fileprivate let cellMenuButton = "cellMenuButton"
    
    
    //MARK: Create Object
    var topBlueImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "2-0")
        imageView.contentMode = .scaleAspectFill
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    var imageBackground: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "Travel2-1")
        image.contentMode = .scaleAspectFit
        image.layer.masksToBounds = true
        return image
    }()
    
    lazy var collectionViewMenu: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        var collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        collectionView.isUserInteractionEnabled = true
        collectionView.isScrollEnabled = false
        collectionView.showsVerticalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.backgroundColor = UIColor.clear
        collectionView.register(MenuButtonCell.self, forCellWithReuseIdentifier: "cellMenuButton")
        collectionView.delegate = self
        collectionView.dataSource = self
        return collectionView
    }()
    
    //MARK: Initialize function
    override func setupview() {
        super.setupview()
        setupImageBackground()
        setupTopBlueImage()
        setupViewCollectionViewMenu()
    }
    
    //MARK: SetupView for cell
    func setupImageBackground() {
        addSubview(imageBackground)
        imageBackground.snp.makeConstraints { (make) in
            make.width.equalTo(self.snp.width)
            make.height.equalTo(self.snp.height).multipliedBy(0.5)
            make.centerX.equalTo(self.snp.centerX)
            make.top.equalToSuperview()
        }
    }
    
    func setupTopBlueImage() {
        addSubview(topBlueImage)
        topBlueImage.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.width.equalToSuperview()
            make.centerX.equalToSuperview()
            make.height.equalTo(self.topBlueImage.snp.width).multipliedBy(0.094)
        }
    }
    
    func setupViewCollectionViewMenu() {
        addSubview(collectionViewMenu)
        collectionViewMenu.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.52)
            make.top.equalTo(self.imageBackground.snp.bottom).offset(-16)
            make.left.equalTo(self.snp.left).offset(10)
            make.right.equalTo(self.snp.right).offset(-10)
        }
    }
}


//MARK: - Extension MainmenuCollectionViewcell
extension MainMenuCollectionViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    //MARK: - Number Item
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    //MARK: - Setup view for cell
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellMenuButton, for: indexPath) as! MenuButtonCell
        cell.imageIcons.image = UIImage(named: arrayNameicons[indexPath.item])
        cell.labelTitle.text = arrayTitle[indexPath.item]
        return cell
    }
    
    //MARK: - Size for item
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.frame.width / 2 - 15, height: self.frame.width * 0.25)
    }
    
    //MARK: - function will call when select item collectionView
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let index = indexPath.item
        homeController?.showMainMenu(index: index)
    }
}




