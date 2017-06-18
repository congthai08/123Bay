
//
//  BaseHeaderFooterTableView.swift
//  123bay
//
//  Created by MACOS on 6/15/17.
//  Copyright © 2017 123bay. All rights reserved.
//

import UIKit

class BaseHeaderFooterTableView: UITableViewHeaderFooterView {
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        
    }
}
