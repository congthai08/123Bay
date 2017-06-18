//
//  BookingCodeView.swift
//  123bay
//
//  Created by MACOS on 6/17/17.
//  Copyright © 2017 123bay. All rights reserved.
//

import UIKit

class BookingCodeView: BaseUIView {
    
    //MARK: Create Object
    private var imageIcon: UIImageView = {
        let imageConfig = UIImageView()
        
        imageConfig.contentMode = .scaleAspectFit
        imageConfig.image = UIImage(named: "BookingCode")
        return imageConfig
    }()
    
    private var labelTitle: UILabel = {
        let labelConfig = UILabel()
        
        labelConfig.text = "MÃ ĐẶT CHỖ"
        labelConfig.font = UIFont.systemFont(ofSize: Dimension.shared.mediumContentFontSize, weight: 0.1)
        labelConfig.textColor = Theme.shared.titleColor
        return labelConfig
    }()
    
    private var labelCode: UILabel = {
        let labelConfig = UILabel()
        
        labelConfig.text = "ASDC2345"
        labelConfig.textAlignment = .right
        labelConfig.font = UIFont.systemFont(ofSize: Dimension.shared.mediumContentFontSize, weight: 0.1)
        labelConfig.textColor = Theme.shared.titleColor
        return labelConfig
    }()
    
    //MARK: Initialize function
    override func setupView() {
        super.setupView()
        self.backgroundColor = Theme.shared.navigationBarTintColor
        setupViewImageIcon()
        setupViewLabelTitle()
        setupViewLabelCode()
    }
    
    //MARK: Setupview function
    private func setupViewImageIcon() {
        addSubview(imageIcon)
        imageIcon.snp.makeConstraints { (make) in
            make.height.equalTo(self.snp.height).multipliedBy(0.6)
            make.width.equalTo(self.imageIcon.snp.height)
            make.left.equalToSuperview().offset(Dimension.shared.pageLeftMarging)
            make.centerY.equalToSuperview()
        }
    }
    
    private func setupViewLabelTitle() {
        addSubview(labelTitle)
        labelTitle.snp.makeConstraints { (make) in
            make.height.equalToSuperview()
            make.centerY.equalToSuperview()
            make.left.equalTo(self.imageIcon.snp.right).offset(5)
            make.width.equalToSuperview().multipliedBy(0.3)
        }
    }
    
    private func setupViewLabelCode() {
        addSubview(labelCode)
        labelCode.snp.makeConstraints { (make) in
            make.height.equalToSuperview()
            make.centerY.equalToSuperview()
            make.right.equalToSuperview().offset(-Dimension.shared.pageRightMarging)
            make.width.equalToSuperview().multipliedBy(0.4)
        }
    }
    
}
