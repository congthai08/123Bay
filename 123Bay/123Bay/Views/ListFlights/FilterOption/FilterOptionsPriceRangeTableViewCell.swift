//
//  FilterOptionsPriceRangeTableViewCell.swift
//  123bay
//
//  Created by Huỳnh Công Thái on 6/17/17.
//  Copyright © 2017 123bay. All rights reserved.
//

import UIKit
import SnapKit

/*
    User can drag price into range
 */
class FilterOptionsPriceRangeTableViewCell: BaseTableViewCell {
    
    // MARK: Define controls
    private let priceSlider: UISlider = {
        let slider: UISlider = UISlider()
        
        slider.setThumbImage(#imageLiteral(resourceName: "emptycircle"), for: .normal)
        slider.minimumTrackTintColor = #colorLiteral(red: 0.05737688392, green: 0.5678743124, blue: 0.8214818239, alpha: 1)
        slider.maximumTrackTintColor = #colorLiteral(red: 0.05737688392, green: 0.5678743124, blue: 0.8214818239, alpha: 1)
        
        return slider
    }()
    
    
    private let minPriceLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        return label
    }()
    
    private let maxPriceLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .right
        label.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        return label
    }()
    
    // MARK: Setup layout
    private func setupSliderPrice() {
        self.addSubview(self.priceSlider)
        
        self.priceSlider.snp.makeConstraints { (make) in
            make.top.left.equalToSuperview().offset(Dimension.normalMargin)
            make.right.equalToSuperview().offset(Dimension.normalMarginInverse)
        }
        self.priceSlider.addTarget(
            self,
            action: #selector(FilterOptionsPriceRangeTableViewCell.thumbSliderDragged(_:)),
            for: .valueChanged
        )
    }
    
    private func setupMinPriceLabel() {
        self.addSubview(self.minPriceLabel)
        
        self.minPriceLabel.snp.makeConstraints { (make) in
            make.left.equalTo(self.priceSlider)
            make.top.equalTo(self.priceSlider.snp.bottom).offset(Dimension.smallMargin)
            make.width.equalTo(self.priceSlider).multipliedBy(0.45)
            make.bottom.equalToSuperview().offset(Dimension.normalMarginInverse)
        }
    }
    
    private func setupMaxPriceLabel() {
        self.addSubview(self.maxPriceLabel)
        
        self.maxPriceLabel.snp.makeConstraints { (make) in
            make.right.equalTo(self.priceSlider)
            make.top.bottom.width.equalTo(self.minPriceLabel)
        }
    }
    
    // MARK: Setup
    override func setupview() {
        setupSliderPrice()
        setupMinPriceLabel()
        setupMaxPriceLabel()
    }
    
    func setValue(_ minPrice: Int, maxPrice: Int, setValue: Int) {
        self.priceSlider.minimumValue = Float(minPrice)
        self.priceSlider.maximumValue = Float(maxPrice)
        self.priceSlider.value = Float(setValue)
        self.minPriceLabel.text = "\(minPrice.description) VNĐ"
        self.maxPriceLabel.text = "\(maxPrice.description) VNĐ"
    }
    
    func thumbSliderDragged(_ slider: UISlider) {
    }
}
