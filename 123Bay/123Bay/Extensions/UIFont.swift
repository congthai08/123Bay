//
//  UIFont.swift
//  123bay
//
//  Created by Huỳnh Công Thái on 5/23/17.
//  Copyright © 2017 123bay. All rights reserved.
//

import UIKit

extension UIFont {
    static func fontBoldOfSize(ofSize size: CGFloat) -> UIFont {
        let devideType = UIDevice.current.modelName
        print(devideType)
        switch devideType {
        case .iPhone5:
            return UIFont.boldSystemFont(ofSize: size)
        case .iPhone5c:
            return UIFont.boldSystemFont(ofSize: size)
        case .iPhone5s:
            return UIFont.boldSystemFont(ofSize: size)
        case .iPhone6:
            return UIFont.boldSystemFont(ofSize: size + 2)
        case .iPhone7:
            return UIFont.boldSystemFont(ofSize: size + 2)
        case .iPhone6Plus:
            return UIFont.boldSystemFont(ofSize: size + 3)
        case .iPhone7Plus:
            return UIFont.boldSystemFont(ofSize: size + 3)
        default:
            return UIFont.boldSystemFont(ofSize: size)
        }
    }
    
    static func systemFontSizeDevide(ofSize size: CGFloat) -> UIFont {
        let devideType = UIDevice.current.modelName
        switch devideType {
        case .iPhone5:
            return UIFont.systemFont(ofSize: size)
        case .iPhone5c:
            return UIFont.systemFont(ofSize: size)
        case .iPhone5s:
            return UIFont.systemFont(ofSize: size)
        case .iPhone6:
            return UIFont.systemFont(ofSize: size + 2)
        case .iPhone6s:
            return UIFont.systemFont(ofSize: size + 2)
        case .iPhone7:
            return UIFont.systemFont(ofSize: size + 2)
        case .iPhone6Plus:
            return UIFont.systemFont(ofSize: size + 3)
        case .iPhone7Plus:
            return UIFont.systemFont(ofSize: size + 3)
        default:
            return UIFont.systemFont(ofSize: size)
        }
    }
}
