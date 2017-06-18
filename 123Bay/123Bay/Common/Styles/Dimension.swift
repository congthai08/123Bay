//
//  Dimension.swift
//  123bay
//
//  Created by Huỳnh Công Thái on 6/3/17.
//  Copyright © 2017 123bay. All rights reserved.
//

import UIKit

/*
    This class set default margin, padding, font size, ...
 */

class Dimension {
    class var shared : Dimension {
        struct Static {
            static let instance : Dimension = Dimension()
        }
        return Static.instance
    }
    
    var widthScreen: CGFloat = 1.0
    var heightScreen: CGFloat = 1.0
    var widthScale: CGFloat = 1.0
    var heightScale: CGFloat = 1.0
    
    private init() {
        widthScale = UIScreen.main.bounds.width / 375
        heightScale = UIScreen.main.bounds.height / 667
        widthScreen = UIScreen.main.bounds.width
        heightScreen = UIScreen.main.bounds.height
    }
    
    var titleFontSize: CGFloat {
        return 15 * widthScale
    }
    
    var subTitleFontSize: CGFloat {
        return 14 * widthScale
    }
    
    var smallTitleButtonFontSize: CGFloat {
        return 13 * widthScale
    }
    
    var mediumButtonFontSize: CGFloat {
        return 14 * widthScale
    }
    
    var largeButtonFontSize: CGFloat {
        return 15 * widthScale
    }
    
    var largeContentFontSize: CGFloat {
        return 15 * widthScale
    }
    
    var mediumContentFontSize: CGFloat {
        return 14 * widthScale
    }
    
    var smallContentFontSize: CGFloat {
        return 13 * widthScale
    }
    
    var placeholherTextfieldFontSize: CGFloat {
        return 13 * widthScale
    }
    
    var pageLeftMarging: CGFloat {
        return 16 * widthScale
    }
    
    var pageRightMarging: CGFloat {
        return 16 * widthScale
    }
    
    var cornerRadius: CGFloat {
        return 5 * widthScale
    }
    
    var bottomMargin: CGFloat {
        return 15 * widthScale
    }
    
    var topMargin: CGFloat {
        return 15 * widthScale
    }
    
    var sideContentPadding: CGFloat {
        return 18 * widthScale
    }
    
    var sideTablePadding: CGFloat {
        return 8 * widthScale
    }
    
    var topCellPadding: CGFloat {
        return 15 * heightScale
    }
    
    var sideCellPadding: CGFloat {
        return 16 * widthScale
    }
    
    func defaultSidePadding() -> CGFloat {
        return 16 * widthScale
    }
    
//    var titleFontSize: CGFloat {
//        return 18 * widthScale
//    }
    
//    var subTitleFontSize: CGFloat {
//        return 17 * widthScale
//    }
    
    var contentFontSize: CGFloat {
        return 16 * widthScale
    }
    
    var subContentFontSize: CGFloat {
        return 13 * widthScale
    }
    
    func scaleFont(_ size: CGFloat) -> CGFloat {
        return size * widthScale
    }
    
    static let smallMargin = 8
    static let smallMarginInverse = -1 * smallMargin
    static let normalMargin = 16
    static let normalMarginInverse = -1 * normalMargin
    
    static let lagreAlpha: CGFloat = 0.75
    static let mediumAlpha: CGFloat = 0.5
    static let smallAlpha: CGFloat = 0.25
}
