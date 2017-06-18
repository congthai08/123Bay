//
//  FindFlightPersonCell.swift
//  123bay
//
//  Created by Os on 5/27/17.
//  Copyright © 2017 123bay. All rights reserved.
//

import Foundation
import UIKit

class FindFlightPersonCell: BaseFindFlightCell {
    
    //MARK: Varibale
    var numberPasseger: NumberOfPassenger? {
        didSet {
            if let passenger = numberPasseger {
                var audults: Int = 1
                var childrens: Int = 0
                var babys: Int = 0
                
                if let m_audults = passenger.numberAudult {
                    audults = m_audults
                }
                if let m_children = passenger.numberChildren {
                    childrens = m_children
                }
                
                if let m_baby = passenger.numberBaby {
                    babys = m_baby
                }
                
                if childrens != 0 {
                    if babys != 0 {
                        self.labelPerson.text = "\(audults) Người lớn, \(childrens) Trẻ em, \(babys) Em bé"
                    } else {
                        self.labelPerson.text = "\(audults) Người lớn, \(childrens) Trẻ em"
                    }
                } else {
                    if babys != 0 {
                        self.labelPerson.text = "\(audults) Người lớn, \(babys) Em bé"
                    } else {
                        self.labelPerson.text = "\(audults) Người lớn"
                    }
                }
            }
        }
    }
    
    //MARK: Create Object
    var labelPerson: UILabel = {
        let label = UILabel()
        label.text = "Chọn số hành khách"
        label.textColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
        label.font = UIFont.fontBoldOfSize(ofSize: 14)
        label.textAlignment = .right
        return label
    }()
    
    //MARK: Initialize funtion
    override func setupview() {
        super.setupview()
        setupViewLabelPeson()
    }
    
    //MARK: Setup view function
    func setupViewLabelPeson() {
        addSubview(labelPerson)
        labelPerson.snp.makeConstraints { (make) in
            make.height.equalToSuperview().offset(3)
            make.width.equalToSuperview().multipliedBy(0.5)
            make.centerY.equalToSuperview()
            make.right.equalToSuperview().offset(-20)
        }
    }
}
