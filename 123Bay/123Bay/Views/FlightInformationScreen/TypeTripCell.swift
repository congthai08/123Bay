//
//  TypeTripCell.swift
//  123bay
//
//  Created by hai on 6/16/17.
//  Copyright © 2017 123bay. All rights reserved.
//

import UIKit

//This cell shows type of trips

class TypeTripCell: BaseCollectionViewCell {
    
    //MARK:
    //MARK: Create variables
    var typeTripButton: UIButton = {
        let btn = UIButton()
        
        btn.setTitleColor(Theme.mainColor, for: UIControlState.normal)
        btn.titleLabel?.font = Theme.shared.boldLargeFontSize
        btn.backgroundColor = Theme.defaultColor
        btn.alpha = Theme.smallAlpha
        return btn
    }()
    
    override func setupview() {
        setupForTypeTripButton()
    }
    
    func setTitleForButtonTrip(text: String) {
        typeTripButton.setTitle(text, for: UIControlState.normal)
    }
    
    func setTagForButton(tag: Int) {
        typeTripButton.tag = tag
    }
    
    func fullAlphaForFirstRow() {
        typeTripButton.alpha = 1.0
    }
    
    func minAlphaForOtherRow() {
        typeTripButton.alpha = 0.25
    }
    
    //MARK:
    //MARK: Autolayout for elements
    func setupForTypeTripButton() {
        self.addSubview(typeTripButton)
        typeTripButton.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
            make.left.equalToSuperview()
            make.right.equalToSuperview()
        }
    }
}
