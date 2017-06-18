//
//  FindFlightTextCell.swift
//  123bay
//
//  Created by Os on 5/27/17.
//  Copyright © 2017 123bay. All rights reserved.
//

import Foundation
import UIKit

class FindFlightTextCell: BaseFindFlightCell {
    
    //MARK: Create variable
    var place: String? {
        didSet {
            
            if let text = place {
                self.labelPlace.text = text.uppercased()
            }
        }
    }
    
    var typeClass: String? {
        didSet {
            
            if let type = typeClass {
                labelPlace.text = type.uppercased()
            }
        }
    }
    
    //MARK: Craete Object
    var labelPlace: UILabel = {
        let label = UILabel()
        
        label.text = "HÀ NỘI (HAN)"
        label.textColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
        label.font = UIFont.fontBoldOfSize(ofSize: 14)
        label.textAlignment = .right
        return label
    }()
    
    //MARK: Initialize functon
    override func setupview() {
        super.setupview()
        setupViewLabelPlace()
    }
    
    //MARK: Setup view function
    func setupViewLabelPlace() {
        addSubview(labelPlace)
        labelPlace.snp.makeConstraints { (make) in
            make.height.equalToSuperview().offset(3)
            make.width.equalToSuperview().multipliedBy(0.3)
            make.centerY.equalToSuperview()
            make.right.equalToSuperview().offset(-20)
        }
    }
    
}
