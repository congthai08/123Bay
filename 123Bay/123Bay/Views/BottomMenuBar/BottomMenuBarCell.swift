//
//  BottomMenuBarCell.swift
//  123bay
//
//  Created by Os on 5/26/17.
//  Copyright © 2017 123bay. All rights reserved.
//

import UIKit

/*
    This class display cell for Bottom Menu Bar
 */
class BottomMenuBarCell: BaseCollectionViewCell {
    
    //MARK: Create Object
    var imageIcons: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "2-6")
        return imageView
    }()
    
    var labelTitle: UILabel = {
        let label = UILabel()
        label.text = "Trang chủ"
        label.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        label.textAlignment = .center
        label.font = UIFont.systemFontSizeDevide(ofSize: 11)
        return label
    }()
    
    //MARK: Initialize funtion
    override func setupview() {
        super.setupview()
        setUpImageIcons()
        setupLabelTitile()
    }
    
    //MARK: Setupview function
    func setUpImageIcons() {
        addSubview(imageIcons)
        imageIcons.snp.makeConstraints { (make) in
            make.width.equalTo(self.snp.height).multipliedBy(0.4)
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








