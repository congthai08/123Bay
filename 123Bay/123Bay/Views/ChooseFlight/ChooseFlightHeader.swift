//
//  ChooseFlightHeader.swift
//  123bay
//
//  Created by Os on 6/6/17.
//  Copyright © 2017 123bay. All rights reserved.
//

import Foundation
import UIKit

class ChooseFlightHeader: UITableViewHeaderFooterView {
    
    var labelTile: UILabel = {
       let labelConfig = UILabel()
        
        labelConfig.text = "Điểm đến phổ biến"
        labelConfig.textColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        labelConfig.font = UIFont.fontBoldOfSize(ofSize: 14)
        return labelConfig
    }()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        setupViewLabeltitle()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViewLabeltitle() {
        addSubview(labelTile)
        labelTile.snp.makeConstraints { (make) in
            make.height.equalToSuperview()
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview()
            
        }
    }
    
}
