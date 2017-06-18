//
//  ChangeDateOptionsCollectionViewCell.swift
//  123bay
//
//  Created by Huỳnh Công Thái on 6/17/17.
//  Copyright © 2017 123bay. All rights reserved.
//

import UIKit
import SnapKit

/*
    User can see date of flight
 */
class ChangeDateOptionsCollectionViewCell: BaseCollectionViewCell {
    
    // MARK: Define controls
    private let contentDateView: ChangeDateOptionsContentCellView = ChangeDateOptionsContentCellView()
    
    // MARK: Setup layout
    private func setupContentDateView() {
        self.addSubview(self.contentDateView)
        
        self.contentDateView.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
        }
    }
    
    func setupBorder() {
        self.layer.borderWidth = 0.5
        self.layer.borderColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1).cgColor
    }
    
    // MARK: Setup
    override func setupview() {
        self.backgroundColor = Theme.defaultColor
        setupContentDateView()
        setupBorder()
    }
    
    func setValue(_ date: String, price: Int) {
        self.contentDateView.setValue(date, price: price)
    }
}
