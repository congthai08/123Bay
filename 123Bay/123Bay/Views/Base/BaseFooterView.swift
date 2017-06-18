//
//  BaseFooterView.swift
//  123bay
//
//  Created by hai on 6/17/17.
//  Copyright © 2017 123bay. All rights reserved.
//

import Foundation
import UIKit

class BaseFooterView: UITableViewHeaderFooterView {
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        setupFooterView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func setupFooterView() {
        
    }
}
