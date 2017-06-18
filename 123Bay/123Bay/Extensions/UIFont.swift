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
    
    class func titleFont(weight: CGFloat = UIFontWeightMedium) -> UIFont? {
        return UIFont.systemFont(ofSize: Dimension.shared.titleFontSize, weight: weight)
    }
    
    class func subTitleFont() -> UIFont? {
        return UIFont.systemFont(ofSize: Dimension.shared.subTitleFontSize, weight: UIFontWeightRegular)
    }
    
    class func contentFont() -> UIFont? {
        return UIFont.systemFont(ofSize: Dimension.shared.contentFontSize, weight: UIFontWeightRegular)
    }
    
    class func smallContentFont() -> UIFont? {
        return UIFont.systemFont(ofSize: Dimension.shared.subContentFontSize, weight: UIFontWeightRegular)
    }
    
    class func mediumFont(size: CGFloat = 12) -> UIFont? {
        return UIFont.systemFont(ofSize: Dimension.shared.scaleFont(size), weight: UIFontWeightMedium)
    }
    
    class func regularFont(size: CGFloat = 12) -> UIFont? {
        return UIFont.systemFont(ofSize: Dimension.shared.scaleFont(size), weight: UIFontWeightRegular)
    }
    
    class func semiBoldFont(_ size: CGFloat = 12) -> UIFont? {
        return UIFont.systemFont(ofSize: Dimension.shared.scaleFont(size), weight: UIFontWeightSemibold)
    }
    
    class func boldFont(_ size: CGFloat = 12) -> UIFont? {
        return UIFont.systemFont(ofSize: Dimension.shared.scaleFont(size), weight: UIFontWeightBold)
    }
}
