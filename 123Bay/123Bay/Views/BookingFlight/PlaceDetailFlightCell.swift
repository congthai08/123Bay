//
//  PlaceDetailFlightCell.swift
//  123bay
//
//  Created by MACOS on 6/16/17.
//  Copyright © 2017 123bay. All rights reserved.
//

import UIKit

class PlaceDetailFlightCell: BaseCollectionViewCell {
    
    //MARK: Variable
    private var labelDeparture: UILabel = {
        let labelConfig = UILabel()
        
        labelConfig.text = "TP HCM"
        labelConfig.font = UIFont.systemFont(ofSize: Dimension.shared.subTitleFontSize, weight: 0.1)
        labelConfig.textColor = Theme.shared.titleTextColor
        return labelConfig
    }()
    
    private var labelArrive: UILabel = {
        let labelConfig = UILabel()
        
        labelConfig.text = "Hà Nội"
        labelConfig.font = UIFont.systemFont(ofSize: Dimension.shared.subTitleFontSize, weight: 0.1)
        labelConfig.textColor = Theme.shared.titleTextColor
        return labelConfig
    }()
    
    private var imageArow: UIImageView = {
        let imageConfig = UIImageView()
        
        imageConfig.contentMode = .scaleAspectFit
        imageConfig.image = UIImage(named: "Arrows")
        return imageConfig
    }()
    
    private var buttonDetail: UIButton = {
        let buttonConfig = UIButton()
        
        buttonConfig.backgroundColor = UIColor.clear
        buttonConfig.setTitle("CHI TIẾT", for: .normal)
        buttonConfig.setTitleColor(Theme.shared.darkBlueTextColor, for: .normal)
        buttonConfig.titleLabel?.font = UIFont.systemFont(ofSize: Dimension.shared.smallTitleButtonFontSize, weight: 0.3)
        return buttonConfig
    }()
    
    private var lineDevider: UIView = {
        let viewConfig = UIView()
        
        viewConfig.backgroundColor = Theme.shared.lineDeviderColor
        return viewConfig
    }()
    
    //MARK: Initialize funtion
    override func setupview() {
        super.setupview()
        self.backgroundColor = Theme.shared.baseViewBackgroundColor
        setupViewLabelDeparture()
        setupViewImageArrow()
        setupViewLabelArrive()
        setupViewButtonDetail()
        setupViewLineDevider()
    }
    
    //MARK: SetupView function
    private func setupViewLabelDeparture() {
        addSubview(labelDeparture)
        labelDeparture.snp.makeConstraints { (make) in
            make.height.equalToSuperview()
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().offset(15)
            make.width.equalTo(55)
        }
    }
    
    private func setupViewImageArrow() {
        addSubview(imageArow)
        imageArow.snp.makeConstraints { (make) in
            make.width.equalTo(30).multipliedBy(Dimension.shared.widthScale)
            make.height.equalTo(15)
            make.left.equalTo(self.labelDeparture.snp.right)
            make.centerY.equalTo(self.labelDeparture.snp.centerY)
        }
    }
    
    private func setupViewLabelArrive() {
        addSubview(labelArrive)
        labelArrive.snp.makeConstraints { (make) in
            make.height.equalToSuperview()
            make.centerY.equalToSuperview()
            make.left.equalTo(self.imageArow.snp.right).offset(5)
            make.width.equalTo(70)
        }
    }
    
    fileprivate func  setupViewButtonDetail() {
        addSubview(buttonDetail)
        buttonDetail.snp.makeConstraints { (make) in
            make.height.equalToSuperview().multipliedBy(0.5)
            make.width.equalTo(60)
            make.centerY.equalToSuperview()
            make.right.equalToSuperview().offset(-15)
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
