//
//  SettingHeadercell.swift
//  123bay
//
//  Created by Os on 5/26/17.
//  Copyright © 2017 123bay. All rights reserved.
//

import UIKit

class SettingHeaderCell: BaseCollectionViewCell {
    
    //MARK: Create Object
    var settingMenuController: SettingMenuController?
    
    var imageLogo: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Logo")
        imageView.contentMode = .scaleAspectFit
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    var buttoncacel: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor.clear
        button.setBackgroundImage(UIImage(named: "Cancel"), for: UIControlState.normal)
        return button
    }()
    
    var lineDevider: UIView = {
        let view = UIView()
        
        view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1).withAlphaComponent(0.8)
        return view
    }()
    
    //MARK: Initialize function
    override func setupview() {
        super.setupview()
        self.backgroundColor = UIColor.rgbColor(red: 25, green: 160, blue: 288, alpha: 1)
        setupImageLogo()
        setupButtonCanCel()
        setupLineDevider()
        
        buttoncacel.addTarget(self, action: #selector(SettingHeaderCell.hideMenuSetting), for: UIControlEvents.touchUpInside)
    }
    
    //MARK: Setupview function
    func setupImageLogo() {
        addSubview(imageLogo)
        imageLogo.snp.makeConstraints { (make) in
            make.height.equalToSuperview().multipliedBy(0.9)
            make.width.equalToSuperview().multipliedBy(0.3)
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().offset(10)
        }
    }
    
    func setupButtonCanCel() {
        addSubview(buttoncacel)
        buttoncacel.snp.makeConstraints { (make) in
            make.height.equalToSuperview().multipliedBy(0.3)
            make.width.equalTo(self.buttoncacel.snp.height)
            make.centerY.equalToSuperview()
            make.right.equalToSuperview().offset(-15)
        }
    }
    
    func setupLineDevider() {
        addSubview(lineDevider)
        lineDevider.snp.makeConstraints { (make) in
            make.width.equalToSuperview()
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.height.equalTo(2)
            make.bottom.equalToSuperview()
        }
    }
    
    //MARK: Other function
    func hideMenuSetting() {
        settingMenuController?.hideMenuSetting()
    }
}









