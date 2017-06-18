//
//  ChangeDateOptionsContentCellView.swift
//  123bay
//
//  Created by Huỳnh Công Thái on 6/17/17.
//  Copyright © 2017 123bay. All rights reserved.
//

import UIKit
import SnapKit

/*
 User can see date of flight and price
 */
class ChangeDateOptionsContentCellView: BaseUIView {
    
    // MARK: Define controls
    private let dateLabel: UILabel = {
        let label: UILabel = UILabel()
        
        label.textAlignment = .center
        label.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        label.numberOfLines = 2
        label.font = label.font.withSize(Dimension.shared.contentFontSize)
        
        return label
    }()
    
    private let priceLabel: UILabel = {
        let label: UILabel = UILabel()
        
        label.textAlignment = .center
        label.textColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
        label.font = label.font.withSize(Dimension.shared.contentFontSize)
        
        return label
    }()
    
    // MARK: Setup layout
    private func setupDateLabel() {
        self.addSubview(self.dateLabel)
        
        self.dateLabel.snp.makeConstraints { (make) in
            make.top.left.right.equalToSuperview()
        }
    }
    
    private func setupPriceLabel() {
        self.addSubview(self.priceLabel)
        
        self.priceLabel.snp.makeConstraints { (make) in
            make.left.right.equalTo(self.dateLabel)
            make.top.equalTo(self.dateLabel.snp.bottom).offset(Dimension.smallMargin)
            make.bottom.equalToSuperview()
        }
    }
    
    // MARK: Setup
    override func setupView() {
        setupDateLabel()
        setupPriceLabel()
    }
    
    func setValue(_ date: String, price: Int) {
        self.dateLabel.text = date
        self.priceLabel.text = "\(price) VNĐ"
    }
}
