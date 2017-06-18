//
//  TypeClass Cell.swift
//  123bay
//
//  Created by Os on 5/31/17.
//  Copyright © 2017 123bay. All rights reserved.
//

import Foundation
import UIKit

/*
 This class to display type class for customer
 */

class TypeClassCell: BaseTableViewCell {
    
    
    //MARK: Create Object
    var labelTitle: UILabel = {
        let label = UILabel()
        
        label.text = "Doanh Nhân"
        label.font = UIFont.systemFontSizeDevide(ofSize: 14)
        label.textAlignment = .left
        return label
    }()
    
    var lineDevider: UIView = {
        let view = UIView()
        
        view.backgroundColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1).withAlphaComponent(0.3)
        return view
    }()
    
    //MARK: Initialize function
    override func setupview() {
        super.setupview()
        setupViewLableTitle()
        setupViewLineDevider()
    }
    
    override var isSelected: Bool {
        didSet {
            if isSelected {
                selectedCell()
            } else {
                normalcell()
            }
        }
    }
    
    //MARK: SetupView function
    func setupViewLableTitle() {
        addSubview(labelTitle)
        labelTitle.snp.makeConstraints { (make) in
            make.width.equalToSuperview().multipliedBy(0.6)
            make.left.equalToSuperview().offset(15)
            make.height.equalTo(20)
            make.centerY.equalToSuperview()
        }
    }
    
    func setupViewLineDevider() {
        addSubview(lineDevider)
        lineDevider.snp.makeConstraints { (make) in
            make.width.equalToSuperview().multipliedBy(0.97)
            make.centerX.equalToSuperview()
            make.height.equalTo(1)
            make.bottom.equalToSuperview()
        }
    }
    
    //MARK: Other function
    func selectedCell() {
        labelTitle.font = UIFont.systemFont(ofSize: 15, weight: 0.3)
        self.accessoryType = .checkmark
    }
    
    func normalcell() {
        labelTitle.font = UIFont.systemFont(ofSize: 15, weight: 0)
        self.accessoryType = .none
    }
}
