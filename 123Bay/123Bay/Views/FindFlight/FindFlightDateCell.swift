//
//  FindFlightDateCell.swift
//  123bay
//
//  Created by Os on 5/27/17.
//  Copyright © 2017 123bay. All rights reserved.
//

import Foundation

import UIKit

class FindFlightDateCell: BaseFindFlightCell {
    
    //MARK: Create Variable
    var dateTravel: DateTravel? {
        didSet {
            guard let date = dateTravel?.date else { return }
            guard let month = dateTravel?.month else { return }
            guard let year = dateTravel?.year else { return }
            self.labelDate.text = "Ngày \(date) tháng \(month) năm \(year)"
        }
    }
    
    //MARK: Craete Object
    var labelDate: UILabel = {
        let label = UILabel()
        label.text = "Ngày 1 tháng 6 năm 2017"
        label.textColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
        label.font = UIFont.fontBoldOfSize(ofSize: 14)
        label.textAlignment = .right
        return label
    }()
    
    //MARK: Initialize function
    override func setupview() {
        super.setupview()
        setupViewLabelDate()
    }
    
    //MARK: Setup view function
    func setupViewLabelDate() {
        addSubview(labelDate)
        labelDate.snp.makeConstraints { (make) in
            make.height.equalToSuperview().offset(3)
            make.width.equalToSuperview().multipliedBy(0.6)
            make.centerY.equalToSuperview()
            make.right.equalToSuperview().offset(-20)
        }
    }

    
}
