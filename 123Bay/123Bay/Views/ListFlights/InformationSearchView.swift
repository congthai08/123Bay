//
//  InformationSearchView.swift
//  123bay
//
//  Created by Huỳnh Công Thái on 6/3/17.
//  Copyright © 2017 123bay. All rights reserved.
//

import UIKit
import SnapKit

/*
    This class display source and destination flight
    This class display day, number of ticket, ticket type
*/
class InformationSearchView: BaseUIView {
    
    // MARK: Define controls
    let sourceAndDestinationLabel: UILabel = {
        let label: UILabel = UILabel()
        
        label.text = "HÀ NỘI → ĐÀ NẴNG"
        label.textColor = Theme.shared.sourceAndDestinationColor
        label.font = UIFont.boldFont(Dimension.shared.titleFontSize)
        
        return label
    }()
    
    let descriptionLabel: UILabel = {
        let label: UILabel = UILabel()
        
        label.text = "Thứ 5, 11 tháng 4 năm 2017 - 1 vé - Phổ thông"
        label.font = label.font.withSize(Dimension.shared.contentFontSize)
        
        return label
    }()
    
    // MARK: Setup layout
    func setupSourceAndDestinationLabel() {
        self.addSubview(self.sourceAndDestinationLabel)
        
        self.sourceAndDestinationLabel.snp.makeConstraints { (make) in
            make .top.left.equalToSuperview().offset(Dimension.normalMargin)
            make.right.equalToSuperview().offset(Dimension.normalMarginInverse)
        }
    }
    
    func setupDescriptionLabel() {
        self.addSubview(self.descriptionLabel)
        
        self.descriptionLabel.snp.makeConstraints { (make) in
            make.left.right.equalTo(self.sourceAndDestinationLabel)
            make.top.equalTo(self.sourceAndDestinationLabel.snp.bottom).offset(Dimension.shared.sideTablePadding)
            make.bottom.equalToSuperview().offset(Dimension.normalMarginInverse)
        }
    }
    
    override func setupView() {
        self.backgroundColor = Theme.shared.lineColor
        self.setupSourceAndDestinationLabel()
        self.setupDescriptionLabel()
    }
}
