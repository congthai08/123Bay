//
//  CollectionViewSlideImageCell.swift
//  123bay
//
//  Created by Os on 5/26/17.
//  Copyright © 2017 123bay. All rights reserved.
//

import UIKit

class SlideImageCell: BaseCollectionViewCell {
    
    //MARK: Create Object
    var imageSlide: UIImageView = {
        var imageView = UIImageView()
        imageView.image = UIImage(named: "Travel2")
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 8
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    var labelLocation: UILabel = {
       let label = UILabel()
        label.text = "Hà Nội > Nha Trang"
        label.textColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
        label.font = UIFont.fontBoldOfSize(ofSize: 12)
        label.textAlignment = .center
        return label
    }()
    
    //MARK: Initialize function
    override func setupview() {
        super.setupview()
        setupViewImageSlide()
        setupLabelLoacation()
    }
    
    //MARK: Setup View function
    func setupViewImageSlide() {
        addSubview(imageSlide)
        imageSlide.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.centerX.equalToSuperview()
            make.width.equalToSuperview()
            make.height.equalTo(self.imageSlide.snp.width).multipliedBy(0.5)
        }
    }
    
    func setupLabelLoacation() {
        addSubview(labelLocation)
        labelLocation.snp.makeConstraints { (make) in
            make.top.equalTo(self.imageSlide.snp.bottom).offset(5)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview()
            make.height.equalTo(self.snp.height).multipliedBy(0.15)
        }
    }
}












