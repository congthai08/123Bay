//
//  BaseCollectionViewCell.swift
//  123bay
//
//  Created by Os on 5/25/17.
//  Copyright © 2017 123bay. All rights reserved.
//

import UIKit

/*
    Super class for all supclass of UICollectionViewCell
 */
class BaseCollectionViewCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupview()
    }
    
    func setupview() {
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
