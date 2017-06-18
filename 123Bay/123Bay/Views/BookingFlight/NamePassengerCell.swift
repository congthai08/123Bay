//
//  namePassengerCell.swift
//  123bay
//
//  Created by MACOS on 6/16/17.
//  Copyright © 2017 123bay. All rights reserved.
//

import UIKit

class NamePassengerCell: BaseCollectionViewCell {
    
    //MARK: Create Object
    private var labelNamePassenger: UILabel = {
        let labelConfig = UILabel()
        
        labelConfig.text = "1. Hành khách người lớn"
        labelConfig.textColor = Theme.shared.contentTextColor
        labelConfig.font = UIFont.systemFont(ofSize: Dimension.shared.mediumContentFontSize, weight: 0.1)
        return labelConfig
    }()
    
    private var lineDevider: UIView = {
        let viewConfig = UIView()
        
        viewConfig.backgroundColor = Theme.shared.lineWhileDeviderColor
        return viewConfig
    }()
    
    //MARK: Initialize function
    override func setupview() {
        super.setupview()
        self.backgroundColor = Theme.shared.darkBackgroundColor.withAlphaComponent(Dimension.smallAlpha)
        setupViewLabelNamePassenger()
        setupViewLineDevider()
    }
    
    //MARK: SetupView function
    private func setupViewLabelNamePassenger() {
        addSubview(labelNamePassenger)
        labelNamePassenger.snp.makeConstraints { (make) in
            make.width.equalToSuperview().multipliedBy(0.8)
            make.height.equalToSuperview()
            make.left.equalToSuperview().offset(Dimension.shared.pageLeftMarging)
            make.centerY.equalToSuperview()
        }
    }
    
    private func setupViewLineDevider() {
        addSubview(lineDevider)
        lineDevider.snp.makeConstraints { (make) in
            make.width.equalToSuperview()
            make.height.equalTo(3)
            make.bottom.equalToSuperview()
            make.centerX.equalToSuperview()
        }
    }
    
    //MARK: Other funtion
    func setupTitle(title: String) {
        self.labelNamePassenger.text = title
    }
    
}
