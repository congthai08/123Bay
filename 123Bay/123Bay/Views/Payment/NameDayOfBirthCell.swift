//
//  NamePassengerCell.swift
//  123bay
//
//  Created by MACOS on 6/17/17.
//  Copyright © 2017 123bay. All rights reserved.
//

import UIKit

class NameDayOfBirthCell: BaseCollectionViewCell {
    
    //MARK: Create Object
    var labelTitle: UILabel = {
        let labelConfig = UILabel()
        
        labelConfig.text = "Họ và tên"
        labelConfig.font = UIFont.systemFont(ofSize: Dimension.shared.mediumContentFontSize, weight: 0.15)
        labelConfig.textColor = Theme.shared.titleTextColor
        return labelConfig
    }()

    var labeContent: UILabel = {
        let labelConfig = UILabel()
        
        labelConfig.text = ": Nguyễn Đình Triều"
        labelConfig.font = UIFont.systemFont(ofSize: Dimension.shared.mediumContentFontSize, weight: 0.1)
        labelConfig.textColor = Theme.shared.titleTextColor
        return labelConfig
    }()
    
    //MARK: Initialize function
    override func setupview() {
        super.setupview()
        setupViewLabelTitle()
        setupViewLabelContent()
    }
    
    
    //MARK: SetupView function
    func setupViewLabelTitle() {
        self.addSubview(self.labelTitle)
        self.labelTitle.snp.makeConstraints { (make) in
            make.width.equalToSuperview().multipliedBy(0.4)
            make.height.equalToSuperview()
            make.left.equalToSuperview()
            make.centerY.equalToSuperview()
        }
    }
    
    func setupViewLabelContent() {
        self.addSubview(self.labeContent)
        self.labeContent.snp.makeConstraints { (make) in
            make.width.equalToSuperview().multipliedBy(0.5)
            make.height.equalToSuperview()
            make.left.equalTo(self.labelTitle.snp.right)
            make.centerY.equalToSuperview()
        }
    }
    
    //MARK: Other function
    func setupTitleLabel(title string: String) {
        labelTitle.text = string
    }
    
    func setupContent(content string: String) {
        labeContent.text = ": \(string)"
    }
}
