//
//  UIImageView.swift
//  123bay
//
//  Created by hai on 6/11/17.
//  Copyright © 2017 123bay. All rights reserved.
//

import Foundation
import UIKit

extension UIImageView {
    //add border for image view
    func border(borderW: CGFloat, corner: CGFloat, color: UIColor) {
        self.layer.borderColor = color.cgColor
        self.layer.borderWidth = borderW
        self.layer.cornerRadius = corner
        self.clipsToBounds = true
    }
    
    func makeCircle(borderWidth: CGFloat, Color: UIColor) {
        self.layer.cornerRadius = self.frame.width/2
        self.layer.borderWidth = borderWidth
        self.layer.borderColor = Color.cgColor
        self.clipsToBounds = true
    }
}
