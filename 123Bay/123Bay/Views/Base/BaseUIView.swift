//
//  BaseUIView.swift
//  123bay
//
//  Created by Os on 5/31/17.
//  Copyright © 2017 123bay. All rights reserved.
//

import Foundation
import UIKit

class BaseUIView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        
    }
    
}
