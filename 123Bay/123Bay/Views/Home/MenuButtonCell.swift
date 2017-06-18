//
//  MenuButtonCell.swift
//  123bay
//
//  Created by Os on 5/26/17.
//  Copyright © 2017 123bay. All rights reserved.
//

import UIKit

class MenuButtonCell: BaseCollectionViewCell {
    
    //MARK: Create Object
    var imageIcons: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "2-2")
        return imageView
    }()
    
    var labelTitle: UILabel = {
        let label = UILabel()
        label.text = "Tìm chuyến bay"
        label.textColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        label.textAlignment = .center
        label.font = UIFont.systemFontSizeDevide(ofSize: 11)
        return label
    }()
    
    //MARK: Initialize funtion
    override func setupview() {
        super.setupview()
        self.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        
        setupViewForMenuButtonCell()
        setUpImageIcons()
        setupLabelTitile()
    }
    
    //MARK: - SetupView function
    func setupViewForMenuButtonCell() {
        self.layer.cornerRadius = 5
        self.layer.masksToBounds = true
        //Create shadow
        self.layer.shadowColor = UIColor.gray.cgColor
        self.layer.shadowOffset = CGSize(width: 2.0, height: 3.0)
        self.layer.shadowOpacity = 0.4
        self.layer.shadowRadius = 3.0
        self.clipsToBounds = false
        self.layer.masksToBounds = false
    }
    
    func setUpImageIcons() {
        addSubview(imageIcons)
        imageIcons.snp.makeConstraints { (make) in
            make.width.equalTo(self.snp.height).multipliedBy(0.5)
            make.height.equalTo(self.imageIcons.snp.width)
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().inset(self.frame.height / 8)
        }
    }
    
    func setupLabelTitile() {
        addSubview(labelTitle)
        labelTitle.snp.makeConstraints { (make) in
            make.width.equalToSuperview()
            make.left.equalToSuperview()
            make.top.equalTo(self.imageIcons.snp.bottom).offset(2)
            make.bottom.equalToSuperview()
        }
    }
}









