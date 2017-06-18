//
//  RefundMoneyCell.swift
//  123bay
//
//  Created by MACOS on 6/16/17.
//  Copyright © 2017 123bay. All rights reserved.
//

import UIKit

class RefundMoneyCell: BaseCollectionViewCell {
    
    private var labelContent: UILabel = {
        let labelConfig = UILabel()
        
        labelConfig.text = "Không hoàn tiền"
        labelConfig.font = UIFont.systemFont(ofSize: Dimension.shared.mediumContentFontSize, weight: 0.2)
        let alpha = Dimension.mediumAlpha
        labelConfig.textColor = Theme.shared.titleTextColor.withAlphaComponent(alpha)
        return labelConfig
    }()
    
    override func setupview() {
        super.setupview()
        self.backgroundColor = Theme.shared.darkBackgroundColor.withAlphaComponent(Dimension.smallAlpha)
        setupViewLabelContent()
    }
    
    private func setupViewLabelContent() {
        addSubview(labelContent)
        labelContent.snp.makeConstraints { (make) in
            make.height.equalToSuperview()
            make.left.equalToSuperview().offset(15)
            make.centerY.equalToSuperview()
            make.width.equalToSuperview().offset(-15)
        }
    }

}
