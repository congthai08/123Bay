//
//  ChooseFlightCell.swift
//  123bay
//
//  Created by Os on 6/6/17.
//  Copyright © 2017 123bay. All rights reserved.
//

import Foundation
import UIKit

class ChooseFlightCell: BaseTableViewCell {
    
    private var labelPlace: UILabel = {
        let labelConfig = UILabel()
        
        labelConfig.text = "Đà lạt, Việt Nam"
        labelConfig.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        labelConfig.textAlignment = .left
        labelConfig.font = UIFont.systemFontSizeDevide(ofSize: 14)
        return labelConfig
    }()
    
    private var labelAirport: UILabel = {
        let labelConfig = UILabel()
        
        labelConfig.text = "DLI - Sân bay Liên Khương"
        labelConfig.textColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        labelConfig.textAlignment = .left
        labelConfig.font = UIFont.systemFontSizeDevide(ofSize: 13)
        return labelConfig
    }()
    
    override func setupview() {
        super.setupview()
        setupViewlabelPlace()
        setupViewlabelAirport()
    }
    
    
    
    private func setupViewlabelPlace() {
        let topContraintLabelPlace: CGFloat = 0.26 * self.frame.height
        addSubview(labelPlace)
        labelPlace.snp.makeConstraints { (make) in
            make.height.equalToSuperview().multipliedBy(0.3)
            make.width.equalToSuperview().multipliedBy(0.8)
            make.left.equalToSuperview().offset(20)
            make.top.equalToSuperview().offset(topContraintLabelPlace)
        }
    }
    
    private func setupViewlabelAirport() {
        addSubview(labelAirport)
        labelAirport.snp.makeConstraints { (make) in
            make.height.equalToSuperview().multipliedBy(0.15)
            make.width.equalToSuperview().multipliedBy(0.8)
            make.left.equalTo(self.labelPlace.snp.left)
            make.top.equalTo(self.labelPlace.snp.bottom).offset(5)
        }
    }
}
