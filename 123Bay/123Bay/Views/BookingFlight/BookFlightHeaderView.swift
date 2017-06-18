//
//  BookFlightHeaderView.swift
//  123bay
//
//  Created by MACOS on 6/15/17.
//  Copyright © 2017 123bay. All rights reserved.
//

import UIKit

class BookFlightHeaderView: BaseHeaderFooterTableView {
    
    var title: TitleBookingFlight? {
        didSet {
            if let imageName = title?.imageName {
                imageIcon.image = UIImage(named: imageName)
            }
            
            if let text = title?.title {
                labelTitle.text = text.uppercased()
            }
        }
    }
    
    private var imageIcon: UIImageView = {
        let imageConfig = UIImageView()
        imageConfig.image = UIImage(named: "5-0")
        imageConfig.contentMode = .scaleAspectFit
        return imageConfig
    }()
    
    private var labelTitle: UILabel = {
        let labelConfig = UILabel()
        labelConfig.text = "CHUYẾN BAY CỦA BẠN"
        labelConfig.textColor = Theme.shared.titleColor
        labelConfig.font = UIFont.systemFont(ofSize: Dimension.shared.subTitleFontSize, weight: 0.2)
        return labelConfig
    }()
    
    override func setupView() {
        super.setupView()
        self.backgroundColor = Theme.shared.navigationBarTintColor
        setupViewImageIcon()
        setupLabelTitle()
    }
    
    private func setupViewImageIcon() {
        addSubview(imageIcon)
        imageIcon.snp.makeConstraints { (make) in
            make.height.equalToSuperview().multipliedBy(0.6)
            make.width.equalTo(self.imageIcon.snp.height)
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().offset(10)
        }
    }
    
    private func setupLabelTitle() {
        addSubview(labelTitle)
        labelTitle.snp.makeConstraints { (make) in
            make.width.equalToSuperview().multipliedBy(0.8)
            make.height.equalToSuperview()
            make.centerY.equalToSuperview()
            make.left.equalTo(self.imageIcon.snp.right).offset(10)
        }
    }
    
}
