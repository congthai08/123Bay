//
//  UITextView.swift
//  123bay
//
//  Created by MACOS on 6/17/17.
//  Copyright © 2017 123bay. All rights reserved.
//

import UIKit

extension UITextView {
    func setStyleTitle(title : String, content: String, fontsizeTiltle: CGFloat, colorTitle: UIColor, fontsizeContent: CGFloat, colorContent: UIColor, lineSpacing: CGFloat) {
        let attributedText = NSMutableAttributedString(string: "\(title) \n", attributes: [NSFontAttributeName: UIFont.systemFont(ofSize: fontsizeTiltle, weight: 0.3), NSForegroundColorAttributeName: colorTitle])
        
        let style = NSMutableParagraphStyle()
        style.lineSpacing = lineSpacing
        
        let range: NSRange = NSRange(location: 0, length: attributedText.string.characters.count)
        
        attributedText.addAttribute(NSParagraphStyleAttributeName, value: style, range: range)
        
        attributedText.append(NSMutableAttributedString(string: content, attributes: [NSFontAttributeName: UIFont.systemFont(ofSize: fontsizeContent), NSForegroundColorAttributeName: colorContent]))
        
        self.attributedText = attributedText
    }
    
    func getHeigh(width: CGFloat) -> CGFloat {
        let size = CGSize(width: width, height: 1000)
        let option = NSStringDrawingOptions.usesFontLeading.union(NSStringDrawingOptions.usesLineFragmentOrigin)
        let estimatedRect = NSString(string: self.text!).boundingRect(with: size, options: option, attributes: nil, context: nil)
        
        return estimatedRect.size.height
    }

    
}
