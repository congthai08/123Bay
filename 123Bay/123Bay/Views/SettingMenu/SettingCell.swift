//
//  SettingCell.swift
//  123bay
//
//  Created by Os on 5/26/17.
//  Copyright © 2017 123bay. All rights reserved.
//

import UIKit

class SettingCell: BaseCollectionViewCell {
    
    //MARK: Create Object
    var imageMenu: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "2-7")
        imageView.contentMode = .scaleAspectFit
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    var lablelTitle: UILabel = {
        let label = UILabel()
        label.text = "Trợ giúp"
        label.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        label.textAlignment = .right
        label.font = UIFont.systemFontSizeDevide(ofSize: 13)
        return label
    }()
    
    //MARK: Initialize function
    override func setupview() {
        super.setupview()
        self.backgroundColor = UIColor.rgbColor(red: 25, green: 160, blue: 288, alpha: 1)
        setupViewImageLogo()
        setupViewLabelTitle()
    }
    
    //MARK: SetupView function
    func setupViewImageLogo() {
        addSubview(imageMenu)
        imageMenu.snp.makeConstraints { (make) in
            make.height.equalToSuperview().multipliedBy(0.5)
            make.width.equalTo(self.imageMenu.snp.height)
            make.centerY.equalToSuperview()
            make.right.equalToSuperview().offset(-15)
        }
    }
    
    func setupViewLabelTitle() {
        addSubview(lablelTitle)
        lablelTitle.snp.makeConstraints { (make) in
            make.height.equalTo(self.snp.height).multipliedBy(0.4)
            make.width.equalToSuperview().multipliedBy(0.6)
            make.centerY.equalToSuperview()
            make.right.equalTo(self.imageMenu.snp.left).offset(-7)
        }
    }
    
}
