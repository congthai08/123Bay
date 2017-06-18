//
//  ContentOptionsCollectionViewCell.swift
//  123bay
//
//  Created by Huỳnh Công Thái on 6/4/17.
//  Copyright © 2017 123bay. All rights reserved.
//

import UIKit
import SnapKit

/*
    This class is display icon and tittle of collection view into
    class DisplayOptionsForListFlightsView
*/

class ContentOptionsCollectionViewCell: BaseCollectionViewCell{
    
    // MARK: Define controls
    private let iconImageView: UIImageView = {
        let imageView: UIImageView = UIImageView()
        
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = Theme.defaultColor
        
        return imageView
    }()
    
    private let titleLabel: UILabel = {
        let label: UILabel = UILabel()
        
        label.text = "title"
        label.textColor = Theme.defaultColor
        label.textAlignment = .center
        label.font = label.font.withSize(Dimension.shared.subContentFontSize)
        
        return label
    }()
    
    // MARK: Setup layout
    private func setupIconImageView() {
        self.addSubview(self.iconImageView)
        
        self.iconImageView.snp.makeConstraints { (make) in
            make.top.left.right.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(2.0 / 5.0)
        }
    }
    
    private func setupTitleLabel() {
        self.addSubview(self.titleLabel)
        
        self.titleLabel.snp.makeConstraints { (make) in
            make.left.right.height.equalTo(self.iconImageView)
            make.bottom.equalToSuperview()
        }
    }
    
    func setValue(_ icon: icon) {
        self.iconImageView.image = icon.image
        self.titleLabel.text = icon.title
    }
    
    override func setupview() {
        self.setupIconImageView()
        self.setupTitleLabel()
    }
}
