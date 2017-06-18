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
    
    //add border for label
    func border(borderW: CGFloat, corner: CGFloat, color: UIColor) {
        self.layer.borderColor = color.cgColor
        self.layer.borderWidth = borderW
        self.layer.cornerRadius = corner
        self.clipsToBounds = true
    }
    
    func getHeigh(width: CGFloat) -> CGFloat {
        let size = CGSize(width: width, height: 1000)
        let option = NSStringDrawingOptions.usesFontLeading.union(NSStringDrawingOptions.usesLineFragmentOrigin)
        let estimatedRect = NSString(string: self.text!).boundingRect(with: size, options: option, attributes: nil, context: nil)
        
        return estimatedRect.size.height
    }
    
    func getWidth(height: CGFloat) -> CGFloat {
        let size = CGSize(width: 1000, height: height)
        let option = NSStringDrawingOptions.usesFontLeading.union(NSStringDrawingOptions.usesLineFragmentOrigin)
        let estimatesRect = NSString(string: self.text!).boundingRect(with: size, options: option, attributes: nil, context: nil)
        
        return estimatesRect.size.width
    }

}

func doubleTextAttribute(text1: String, text2: String, color1: UIColor, color2: UIColor) -> NSMutableAttributedString {
    let text1: String = text1
    let text2: String = text2
    let attrColor1 = [NSForegroundColorAttributeName: color1]
    let attrColor2 = [NSForegroundColorAttributeName: color2]
    let showText1 = NSAttributedString(string: text1, attributes: attrColor1)
    let showText2 = NSAttributedString(string: text2, attributes: attrColor2)
    let combination = NSMutableAttributedString()
    
    combination.append(showText1)
    combination.append(showText2)
    
    return combination
}

