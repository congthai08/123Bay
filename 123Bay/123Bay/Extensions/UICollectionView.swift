//
//  UICollectionView.swift
//  123bay
//
//  Created by hai on 6/11/17.
//  Copyright © 2017 123bay. All rights reserved.
//

import Foundation
import UIKit

extension UICollectionView {
    //add border for collectionview
    func border(cornerRadius c: CGFloat, borderWidth b: CGFloat, borderColor color: UIColor) {
        self.layer.cornerRadius = c
        self.layer.borderWidth = b
        self.layer.borderColor = color.cgColor
        self.clipsToBounds = true
    }
}
