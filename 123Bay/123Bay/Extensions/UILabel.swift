//
//  UILabel.swift
//  123bay
//
//  Created by Huỳnh Công Thái on 6/17/17.
//  Copyright © 2017 123bay. All rights reserved.
//

import UIKit

extension UILabel {
    // This func config text in label
    func setDateStyle(_ title: String, content: String) -> NSAttributedString {
        let attributeText = NSMutableAttributedString(string: title, attributes: [NSFontAttributeName : UIFont.systemFont(ofSize: Dimension.shared.subTitleFontSize)])
        let attribute2 = NSAttributedString(string: content, attributes: [NSFontAttributeName: UIFont.boldFont(Dimension.shared.subTitleFontSize)!])
        attributeText.append(attribute2)
        
        return attributeText
    }
    
    
    func descriptionAttributedtext(_ title: String, info: String)->NSAttributedString {
        let attributedText = NSMutableAttributedString(string: "\(title) \n", attributes: [NSFontAttributeName: UIFont.systemFont(ofSize: 15)])
        
        let style = NSMutableParagraphStyle()
        style.lineSpacing = 10
        
        let range: NSRange = NSRange(location: 0, length: attributedText.string.characters.count)
        
        attributedText.addAttribute(NSParagraphStyleAttributeName, value: style, range: range)
        
        attributedText.append(NSAttributedString(string: info, attributes: [NSFontAttributeName: UIFont.systemFont(ofSize: 14), NSForegroundColorAttributeName: UIColor.darkGray]))
        
        return attributedText
    }
}
