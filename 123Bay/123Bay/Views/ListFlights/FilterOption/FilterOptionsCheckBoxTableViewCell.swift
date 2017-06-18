//
//  FilterOptionsCheckBoxTableViewCell.swift
//  123bay
//
//  Created by Huỳnh Công Thái on 6/17/17.
//  Copyright © 2017 123bay. All rights reserved.
//

import UIKit
import SnapKit

enum FilterOptionsCheckBoxType: Int {
    case title, image
}

/*
    User can check or uncheck filter option
 */
class FilterOptionsCheckBoxTableViewCell: BaseTableViewCell {
    
    // MARK: Define variable
    private var type: FilterOptionsCheckBoxType = .title
    static var isChecked: Bool = false
    
    // MARK: Define control
    private let checkBoxImage: UIImageView = {
        let imageView = UIImageView(image: #imageLiteral(resourceName: "checkbox"))
        imageView.contentMode = .scaleToFill
        return imageView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        label.font = label.font.withSize(Dimension.shared.subTitleFontSize)
        return label
    }()
    
    private let airlineImage: UIImageView = {
        let imageView: UIImageView = UIImageView(image: #imageLiteral(resourceName: "logo_airline"))
        imageView.contentMode = .scaleAspectFit
        imageView.isHidden = true
        return imageView
    }()
    
    // MARK: Define setup
    private func setupCheckBoxImage() {
        self.addSubview(self.checkBoxImage)
        
        self.checkBoxImage.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(Dimension.normalMargin)
            make.top.equalToSuperview().offset(Dimension.normalMargin)
            make.bottom.equalToSuperview().offset(Dimension.normalMarginInverse)
            make.width.equalTo(self.checkBoxImage.snp.height)
        }
    }
    
    private func setupTitleTitle() {
        self.addSubview(self.titleLabel)
        
        self.titleLabel.snp.makeConstraints { (make) in
            make.left.equalTo(self.checkBoxImage.snp.right).offset(Dimension.normalMargin)
            make.top.bottom.equalTo(self.checkBoxImage)
            make.right.equalToSuperview().offset(Dimension.normalMarginInverse)
        }
    }
    
    private func setupAirlineImage() {
        self.addSubview(self.airlineImage)
        
        self.airlineImage.snp.makeConstraints { (make) in
            make.left.equalTo(self.checkBoxImage.snp.right).offset(Dimension.normalMargin)
            make.top.bottom.equalTo(self.checkBoxImage)
            make.width.equalToSuperview().dividedBy(4)
        }
    }
    
    // MARK: Setup
    override func setupview() {
        self.setupCheckBoxImage()
        self.setupTitleTitle()
        self.setupAirlineImage()
    }
    
    private func setType(_ isTitleType: Bool) {
        self.titleLabel.isHidden = !isTitleType
        self.airlineImage.isHidden = isTitleType
    }
    
    func setValue(_ title: String?, image: UIImage?) {
        
        if let title = title {
            self.setType(true)
            self.titleLabel.text = title
            return
        }
        
        if let image = image {
            self.setType(false)
            self.airlineImage.image = image
            return
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        if !selected {
            return
        }
        
        FilterOptionsCheckBoxTableViewCell.isChecked = !FilterOptionsCheckBoxTableViewCell.isChecked
        
        if FilterOptionsCheckBoxTableViewCell.isChecked {
            self.checkBoxImage.image = #imageLiteral(resourceName: "checkboxChecked")
            self.titleLabel.textColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
        } else {
            self.checkBoxImage.image = #imageLiteral(resourceName: "checkbox")
            self.titleLabel.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        }
    }
}
