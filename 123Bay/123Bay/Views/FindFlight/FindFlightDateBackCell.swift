//
//  FindFlightDateBackCell.swift
//  123bay
//
//  Created by Os on 5/31/17.
//  Copyright © 2017 123bay. All rights reserved.
//

import Foundation
import UIKit

/*
    This class display info of date comeback
    It's a supclass of FindFlightDateCell to change size of image'iCon
 */

class FindFlightDateBackCell: FindFlightDateCell {
    
    //MARK: Initialize funtion
    override func setupview() {
        super.setupview()
        setupViewImageIcon()
    }
    
    override func setupViewImageIcon() {
        addSubview(imageIcon)
        imageIcon.snp.makeConstraints { (make) in
            make.height.equalToSuperview().multipliedBy(0.5)
            make.width.equalTo(self.imageIcon.snp.height)
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().offset(20)
        }
    }
    
}
