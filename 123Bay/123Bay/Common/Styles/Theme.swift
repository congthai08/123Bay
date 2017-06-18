//
//  Theme.swift
//  123bay
//
//  Created by Huỳnh Công Thái on 6/8/17.
//  Copyright © 2017 123bay. All rights reserved.
//

import UIKit

/*
 This class set default color, alpha for app
 */

class Theme {
    class var shared : Theme {
        struct Static {
            static let instance : Theme = Theme()
        }
        return Static.instance
    }
    
    private init() {
        
    }
    
    // Alert
    var alertBackgroundColor: UIColor {
        return #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.8)
    }
    
    // ListFights
    var idPlaneColor: UIColor {
        return #colorLiteral(red: 0.6429485083, green: 0.6470428109, blue: 0.651107192, alpha: 1)
    }
    
    var priceTicketColor: UIColor {
        return #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
    }
    
    var sourceAndDestinationColor: UIColor {
        return #colorLiteral(red: 0.1005552337, green: 0.6265580654, blue: 0.8926903605, alpha: 1)
    }
    
    var backgroundButtonColor: UIColor {
        return #colorLiteral(red: 0.9661940932, green: 0.4309073687, blue: 0, alpha: 1)
    }
    
    var lineColor: UIColor {
        return #colorLiteral(red: 0.9174302816, green: 0.9215688705, blue: 0.9255864024, alpha: 1)
    }
    
    var arrangeOptionColor: UIColor {
        return #colorLiteral(red: 0.4756349325, green: 0.4756467342, blue: 0.4756404161, alpha: 1)
    }
    
    static let mainColor: UIColor = #colorLiteral(red: 0.1005552337, green: 0.6265580654, blue: 0.8926903605, alpha: 1)
    static let defaultColor: UIColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    static let lagreAlpha: CGFloat = 0.75
    static let mediumAlpha: CGFloat = 0.5
    static let smallAlpha: CGFloat = 0.25
}
