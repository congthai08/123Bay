//
//  DepartureInfoCell.swift
//  123bay
//
//  Created by MACOS on 6/16/17.
//  Copyright © 2017 123bay. All rights reserved.
//

import UIKit

class DepartureInfoCell: BaseCollectionViewCell {
    
    //MARK: Variable
    private var labelDate: UILabel = {
        let labelConfig = UILabel()
        
        labelConfig.text = "Th 5, 22 thg 6 2017"
        labelConfig.font = UIFont.systemFont(ofSize: Dimension.shared.mediumContentFontSize, weight: 0.2)
        labelConfig.textColor = Theme.shared.contentTextColor
        return labelConfig
    }()
    
    private var labelTypeclass: UILabel = {
        let labelConfig = UILabel()
        
        labelConfig.text = "Economy"
        labelConfig.font = UIFont.systemFont(ofSize: Dimension.shared.smallContentFontSize, weight: 0.2)
        let alpha = Dimension.mediumAlpha
        
        labelConfig.textColor = Theme.shared.contentTextColor.withAlphaComponent(alpha)
        return labelConfig
    }()
    
    private var labelTimeDeparture: UILabel = {
        let labelConfig = UILabel()
        
        labelConfig.text = "05:45"
        labelConfig.font = UIFont.systemFont(ofSize: Dimension.shared.largeContentFontSize, weight: 0.05)
        labelConfig.textColor = Theme.shared.contentTextColor
        return labelConfig
    }()
    
    private var imageFlight: UIImageView = {
        let imageConfig = UIImageView()
        
        imageConfig.contentMode = .scaleAspectFit
        imageConfig.image = UIImage(named: "Planeicon")
        return imageConfig
    }()
    
    private var labelTimeArrive: UILabel = {
        let labelConfig = UILabel()
        
        labelConfig.text = "07:50"
        labelConfig.font = UIFont.systemFont(ofSize: Dimension.shared.largeContentFontSize, weight: 0.05)
        labelConfig.textColor = Theme.shared.contentTextColor
        return labelConfig
    }()
    
    private var labelDeparture: UILabel = {
        let labelConfig = UILabel()
        
        labelConfig.text = "SGN"
        labelConfig.font = UIFont.systemFont(ofSize: Dimension.shared.smallContentFontSize, weight: 0.5)
        let alpha = Dimension.smallAlpha
        labelConfig.textColor = Theme.shared.titleTextColor.withAlphaComponent(alpha)
        return labelConfig
    }()
    
    private var labelTime: UILabel = {
        let labelConfig = UILabel()
        
        labelConfig.text = "2h 5m"
        labelConfig.font = UIFont.systemFont(ofSize: Dimension.shared.smallContentFontSize, weight: 0.1)
        let alpha = Dimension.mediumAlpha
        labelConfig.textColor = Theme.shared.titleTextColor.withAlphaComponent(alpha)
        labelConfig.textAlignment = .center
        return labelConfig
    }()
    
    private var labelArrive: UILabel = {
        let labelConfig = UILabel()
        
        labelConfig.text = "HAN"
        labelConfig.font = UIFont.systemFont(ofSize: Dimension.shared.smallContentFontSize, weight: 0.5)
        let alpha = Dimension.smallAlpha
        labelConfig.textColor = Theme.shared.titleTextColor.withAlphaComponent(alpha)
        return labelConfig
    }()
    
    private var lineDevider: UIView = {
        let viewConfig = UIView()
        
        viewConfig.backgroundColor = Theme.shared.lineDeviderColor
        return viewConfig
    }()
    
    //MARK: Initialize funtion
    override func setupview() {
        super.setupview()
        setupViewLabelDate()
        setupViewLineDevider()
        setupViewTypeClass()
        setupViewLabelTimeDeparture()
        setupViewImageFlight()
        setupViewLabelTimeArrive()
        setupViewLabelDeparture()
        setupViewLabelArrive()
        setupViewLabelTime()
    }
    
    //MARK: setupView function
    private func setupViewLabelDate() {
        addSubview(labelDate)
        labelDate.snp.makeConstraints { (make) in
            make.height.equalTo(30)
            make.left.equalToSuperview().offset(15)
            make.centerY.equalToSuperview().multipliedBy(0.5).offset(5)
            make.width.equalToSuperview().multipliedBy(0.45)
        }
    }
    private func setupViewTypeClass() {
        addSubview(labelTypeclass)
        labelTypeclass.snp.makeConstraints { (make) in
            make.height.equalToSuperview().offset(20)
            make.left.equalToSuperview().offset(15)
            make.centerY.equalToSuperview().multipliedBy(1.5).offset(-5)
            make.width.equalToSuperview().multipliedBy(0.45)
        }
    }
    
    private func setupViewLabelTimeDeparture() {
        addSubview(labelTimeDeparture)
        labelTimeDeparture.snp.makeConstraints { (make) in
            make.height.equalToSuperview().offset(40)
            make.left.equalTo(self.labelDate.snp.right).offset(30)
            make.centerY.equalTo(self.labelDate.snp.centerY)
            make.width.equalTo(50).multipliedBy(Dimension.shared.widthScale)
        }
    }
    
    private func setupViewImageFlight() {
        addSubview(imageFlight)
        imageFlight.snp.makeConstraints { (make) in
            make.width.equalTo(30).multipliedBy(Dimension.shared.widthScale)
            make.height.equalTo(15).multipliedBy(Dimension.shared.widthScale)
            make.left.equalTo(self.labelTimeDeparture.snp.right)
            make.centerY.equalTo(self.labelTimeDeparture.snp.centerY)
        }
    }
    
    private func setupViewLabelTimeArrive() {
        addSubview(labelTimeArrive)
        labelTimeArrive.snp.makeConstraints { (make) in
            make.height.equalToSuperview().offset(30)
            make.left.equalTo(self.imageFlight.snp.right).offset(6)
            make.centerY.equalTo(self.labelDate.snp.centerY)
            make.width.equalTo(50)
        }
    }
    
    private func setupViewLabelDeparture() {
        addSubview(labelDeparture)
        labelDeparture.snp.makeConstraints { (make) in
            make.height.equalToSuperview().offset(20)
            make.left.equalTo(self.labelTimeDeparture.snp.left)
            make.centerY.equalTo(self.labelTypeclass.snp.centerY)
            make.width.equalTo(40)
        }
    }
    
    private func setupViewLabelArrive() {
        addSubview(labelArrive)
        labelArrive.snp.makeConstraints { (make) in
            make.height.equalToSuperview().offset(20)
            make.right.equalTo(self.labelTimeArrive.snp.right)
            make.centerY.equalTo(self.labelTypeclass.snp.centerY)
            make.width.equalTo(40)
        }
    }
    
    private func setupViewLabelTime() {
        addSubview(labelTime)
        labelTime.snp.makeConstraints { (make) in
            make.height.equalToSuperview().offset(20)
            make.right.equalTo(self.labelArrive.snp.left)
            make.left.equalTo(self.labelDeparture.snp.right)
            make.centerY.equalTo(self.labelTypeclass.snp.centerY)
        }
    }
    
    private func setupViewLineDevider() {
        addSubview(lineDevider)
        lineDevider.snp.makeConstraints { (make) in
            make.width.equalToSuperview()
            make.height.equalTo(1)
            make.bottom.equalToSuperview()
            make.centerX.equalToSuperview()
        }
    }
}






