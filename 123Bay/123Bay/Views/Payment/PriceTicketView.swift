//
//  PriceTicketView.swift
//  123bay
//
//  Created by MACOS on 6/17/17.
//  Copyright © 2017 123bay. All rights reserved.
//

import UIKit

class PriceTicketView: BaseUIView {
    
    //MARK: Create Object
    private var imageLogo: UIImageView = {
        let imageConfig = UIImageView()
        
        imageConfig.contentMode = .left
        imageConfig.image = UIImage(named: "VietJetAirlogo")
        return imageConfig
    }()
    
    private var labelPrice: UILabel = {
        let labelConfig = UILabel()
        
        labelConfig.text = "1.384.000 VNĐ"
        labelConfig.font = UIFont.systemFont(ofSize: Dimension.shared.mediumContentFontSize, weight: 0.1)
        labelConfig.textColor = Theme.shared.highlightTextColor
        return labelConfig
    }()
    
    //MARK: Initialize function
    override func setupView() {
        super.setupView()
        setupViewImagelogo()
        setupViewLabelPrice()
    }
    
    private func setupViewImagelogo() {
        addSubview(imageLogo)
        imageLogo.snp.makeConstraints { (make) in
            make.width.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.3)
            make.top.equalToSuperview()
            make.left.equalToSuperview()
        }
    }
    
    private func setupViewLabelPrice() {
        addSubview(labelPrice)
        labelPrice.snp.makeConstraints { (make) in
            make.height.equalToSuperview().multipliedBy(0.3)
            make.left.equalToSuperview()
            make.top.equalTo(self.imageLogo.snp.bottom).offset(5)
            make.width.equalToSuperview()
        }
    }
    
    //MARK: Other function
    func setupAlignment(textAlignment: NSTextAlignment, imageContentMode: UIViewContentMode) {
        labelPrice.textAlignment = textAlignment
        imageLogo.contentMode = imageContentMode
    }
    
}
