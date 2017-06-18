//
//  CelebrationCell.swift
//  123bay
//
//  Created by hai on 6/11/17.
//  Copyright © 2017 123bay. All rights reserved.
//

import UIKit
import SnapKit

//This cell shows special days in each month

class CelebrationCell: UITableViewCell {
    
    //Date of special day
    var showSpecialDayLabel: UILabel = {
        let showSpecialDayLabel = UILabel()
        
        showSpecialDayLabel.font = Theme.shared.normalSizeOfFont
        showSpecialDayLabel.numberOfLines = 0
        showSpecialDayLabel.textColor = Theme.shared.specialDayLabel
        return showSpecialDayLabel
    }()
    
    //Name of special day
    var showSpecialNameLabel: UILabel = {
        let showSpecialNameLabel = UILabel()
        
        showSpecialNameLabel.font = Theme.shared.normalSizeOfFont
        showSpecialNameLabel.numberOfLines = 0
        showSpecialNameLabel.textColor = Theme.shared.specialNameDayLabel
        return showSpecialNameLabel
    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupForSpecialDayLabel()
        setupForSpecialNameLabel()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    //Set text for special day
    func setTextForSpecialDay(day: String, month: String, name: String) {
        showSpecialDayLabel.text = "thg " + month + " " + day
        showSpecialNameLabel.text = name
    }
    
    //Layout for special day
    func setupForSpecialDayLabel() {
        self.addSubview(showSpecialDayLabel)
        showSpecialDayLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.snp.top)
            make.bottom.equalTo(self.snp.bottom)
            make.left.equalTo(self.snp.left).offset(15)
            make.width.equalTo(self).dividedBy(6)
        }
    }
    
    //Layout for special name day
    func setupForSpecialNameLabel() {
        self.addSubview(showSpecialNameLabel)
        showSpecialNameLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.snp.top)
            make.bottom.equalTo(self.snp.bottom)
            make.left.equalTo(self.showSpecialDayLabel.snp.right).offset(5)
        }
    }
}
