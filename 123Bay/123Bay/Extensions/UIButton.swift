//
//  UIButton.swift
//  123bay
//
//  Created by hai on 6/15/17.
//  Copyright © 2017 123bay. All rights reserved.
//

import Foundation
import UIKit

//border for button
extension UIButton {
    func border(radius: CGFloat, width: CGFloat, color: UIColor) {
        self.layer.cornerRadius = radius
        self.layer.borderWidth = width
        self.layer.borderColor = color.cgColor
    }
}
