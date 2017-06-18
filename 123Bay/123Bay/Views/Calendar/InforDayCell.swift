//
//  InforDayCell.swift
//  123bay
//
//  Created by hai on 6/11/17.
//  Copyright © 2017 123bay. All rights reserved.
//

import UIKit

//This cell shows days per week

class InforDayCell: UICollectionViewCell {
    
    var labelDay: UILabel = {
        let labelDay = UILabel()
        
        labelDay.textAlignment = .center
        labelDay.font = Theme.shared.boldLessSizeOfFont
        return labelDay
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupForLabelDay()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    //Set text for label day
    func setTextForDayPerWeek(text: String) {
        labelDay.text = text
    }
    
    //Setup for the day: CN - TH2 - TH3 - ....
    func setupForLabelDay() {
        self.addSubview(labelDay)
        labelDay.snp.makeConstraints { (make) in
            make.centerX.equalTo(self.snp.centerX)
            make.centerY.equalTo(self.snp.centerY)
            make.width.equalTo(self.snp.width)
            make.height.equalTo(self.snp.height)
        }
    }
}
