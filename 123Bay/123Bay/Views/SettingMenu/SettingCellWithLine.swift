//
//  SettingCellWithLine.swift
//  123bay
//
//  Created by Os on 5/26/17.
//  Copyright © 2017 123bay. All rights reserved.
//

import UIKit

class SettingCellWithLine: SettingCell {
    
    var lineDevider: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(white: 1, alpha: 0.5)
        return view
    }()
    
    override func setupview() {
        super.setupview()
        setupViewlinedevider()
    }
    
    func setupViewlinedevider() {
        addSubview(lineDevider)
        lineDevider.snp.makeConstraints { (make) in
            make.height.equalTo(0.5)
            make.right.equalToSuperview().offset(-15)
            make.left.equalToSuperview().offset(50)
            make.bottom.equalToSuperview()
        }
    }
    
}
