//
//  ViewFlight.swift
//  123bay
//
//  Created by MACOS on 6/17/17.
//  Copyright © 2017 123bay. All rights reserved.
//

import UIKit

class ViewFlight: BaseUIView {
    
    //MARK: Create Object
    private var labelTitle: UILabel = {
        let labelConfig = UILabel()
        
        labelConfig.text = "CHUYẾN BAY ĐI"
        labelConfig.font = UIFont.systemFont(ofSize: Dimension.shared.mediumContentFontSize, weight: 0.3)
        labelConfig.textColor = Theme.shared.blueTextColor
        return labelConfig
    }()
    
    private var labelInfoFlight: UILabel = {
        let labelConfig = UILabel()
        
        labelConfig.text = "HÀ NỘI > NHA TRANG"
        labelConfig.font = UIFont.systemFont(ofSize: Dimension.shared.smallContentFontSize, weight: 0.1)
        labelConfig.textColor = Theme.shared.darkTextColor
        return labelConfig
    }()
    
    //MARK: Initialize funtion
    override func setupView() {
        super.setupView()
        setupViewLabelTitle()
        setupViewLabelInfoFlight()
    }
    
    //MARK: SetupView funtion
    private func setupViewLabelTitle() {
        addSubview(labelTitle)
        labelTitle.snp.makeConstraints { (make) in
            make.width.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.5)
            make.top.equalToSuperview()
            make.centerX.equalToSuperview()
        }
    }
    
    private func setupViewLabelInfoFlight() {
        addSubview(labelInfoFlight)
        labelInfoFlight.snp.makeConstraints { (make) in
            make.width.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.5)
            make.bottom.equalToSuperview()
            make.centerX.equalToSuperview()
        }
    }
    
    func setupTextAlignmentLabel(alignment: NSTextAlignment = .left) {
        labelInfoFlight.textAlignment = alignment
        labelTitle.textAlignment = alignment
    }
    
    //MARK: Other function
    func setupContent(title: String, infoFlight: String) {
        self.labelTitle.text = title
        self.labelInfoFlight.text = infoFlight
    }
}
