//
//  BaseTableViewCell.swift
//  123bay
//
//  Created by Os on 5/31/17.
//  Copyright © 2017 123bay. All rights reserved.
//

import Foundation
import UIKit

/*
    SuperClass for all supClass of UITableViewCell
 */

class BaseTableViewCell: UITableViewCell {
    
    //MARK: Initialize function
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupview()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: SetupView function
    func setupview() {
        
    }
    
}
