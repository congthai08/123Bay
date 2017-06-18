//
//  UIColor.swift
//  123bay
//
//  Created by Os on 5/26/17.
//  Copyright © 2017 123bay. All rights reserved.
//

import UIKit

extension UIColor {
    static func rgbColor(red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat)->UIColor {
        return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: alpha)
    }
}
