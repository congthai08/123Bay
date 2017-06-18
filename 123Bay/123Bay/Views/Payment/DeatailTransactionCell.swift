//
//  DeatailTransactionCell.swift
//  123bay
//
//  Created by MACOS on 6/17/17.
//  Copyright © 2017 123bay. All rights reserved.
//

import UIKit

class DeatailTransactionCell: NameDayOfBirthCell {
    
    override func setNeedsLayout() {
        setupViewLabelTitle()
        setupViewLabelContent()
    }
    
    override func setupViewLabelTitle() {
        self.addSubview(self.labelTitle)
        self.labelTitle.snp.makeConstraints { (make) in
            make.width.equalToSuperview().multipliedBy(0.65)
            make.height.equalToSuperview()
            make.left.equalToSuperview()
            make.centerY.equalToSuperview()
        }
    }
    
    override func setupViewLabelContent() {
        self.addSubview(self.labeContent)
        self.labeContent.snp.makeConstraints { (make) in
            make.width.equalToSuperview().multipliedBy(0.35)
            make.height.equalToSuperview()
            make.left.equalTo(self.labelTitle.snp.right)
            make.centerY.equalToSuperview()
        }
    }

    //MARK: Other function
    override func setupTitleLabel(title string: String) {
        labelTitle.text = string
        labelTitle.font = UIFont.systemFont(ofSize: Dimension.shared.mediumContentFontSize)
    }
    
    func setupBoldTitleLabel(title string: String) {
        labelTitle.text = string
        labelTitle.font = UIFont.systemFont(ofSize: Dimension.shared.mediumContentFontSize, weight: 0.15)
    }
    
    func setupHighlightContent(content string: String) {
        labeContent.text = ": \(string)"
        labeContent.textColor = Theme.shared.highlightTextColor
        labeContent.font = UIFont.systemFont(ofSize: Dimension.shared.mediumContentFontSize, weight: 0.3)
    }
    
}
