//
//  InformationFlightTableViewCell.swift
//  123bay
//
//  Created by Huỳnh Công Thái on 5/30/17.
//  Copyright © 2017 123bay. All rights reserved.
//

import UIKit
import SnapKit

//This class is display information for flight
class InformationFlightTableViewCell: BaseTableViewCell {
    
    // MARK: Define controls
    var logoAirlinesImageView: UIImageView = {
        let imageView: UIImageView = UIImageView(image: #imageLiteral(resourceName: "logo_airline"))
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    var idPlaneLabel: UILabel = {
        let label: UILabel = UILabel()
        
        label.text = "VietJetAir - VJ779"
        label.font = label.font.withSize(Dimension.shared.subContentFontSize)
        label.textColor = Theme.shared.idPlaneColor
        label.textAlignment = .center
        
        return label
    }()
    
    var timeLineAndFlightRouteLabel: UILabel = {
        let label: UILabel = UILabel()
        
        label.text = "1h30m Bay thẳng"
        label.font = UIFont.boldFont(Dimension.shared.subContentFontSize)
        label.textAlignment = .center
        
        return label
    }()
    
    var startTimeAndScrAirportLabel: UILabel = {
        let label: UILabel = UILabel()
        
        label.text = "11:40\nHAN"
        label.font = label.font.withSize(Dimension.shared.subContentFontSize)
        label.textAlignment = .center
        label.numberOfLines = 0
        
        return label
    }()
    
    var endTimeAndDesAirportLabel: UILabel = {
        let label: UILabel = UILabel()
        
        label.text = "13:30\nCXR"
        label.font = label.font.withSize(Dimension.shared.subContentFontSize)
        label.textAlignment = .center
        label.numberOfLines = 0
        
        return label
    }()
    
    var priceTicketLabel: UILabel = {
        let label: UILabel = UILabel()
        
        label.text = "1,500,000"
        label.font = UIFont.boldFont(Dimension.shared.subTitleFontSize)
        label.textColor = Theme.shared.priceTicketColor
        label.textAlignment = .center
        label.numberOfLines = 0
        
        return label
    }()
    
    var currencyLabel: UILabel = {
        let label: UILabel = UILabel()
        
        label.text = "VNĐ"
        label.font = label.font.withSize(Dimension.shared.subContentFontSize)
        label.textColor = Theme.shared.idPlaneColor
        label.textAlignment = .center
        
        return label
    }()
    
    // MARK: Setup layout
    func setupLogoAirlinesImageView() {
        self.addSubview(self.logoAirlinesImageView)
        
        self.logoAirlinesImageView.snp.makeConstraints { (make) in
            make.centerX.equalTo(self.idPlaneLabel)
            make.top.equalToSuperview().offset(Dimension.normalMargin)
            make.bottom.equalTo(self.idPlaneLabel.snp.top)
            make.width.equalTo(self.idPlaneLabel).multipliedBy(2.0/3.0)
            make.height.equalTo(Dimension.shared.subTitleFontSize)
        }
    }
    
    func setupIdPlaneLabel() {
        self.addSubview(self.idPlaneLabel)

        self.idPlaneLabel.snp.makeConstraints { (make) in
            make.left.right.equalTo(self.timeLineAndFlightRouteLabel)
            make.bottom.equalTo(self.timeLineAndFlightRouteLabel.snp.top)
        }
    }
    
    func setupTimeLineAndFlightRouteLabel() {
        self.addSubview(self.timeLineAndFlightRouteLabel)
        
        self.timeLineAndFlightRouteLabel.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview().multipliedBy(1.0/3.0)
            make.width.equalToSuperview().dividedBy(3)
            make.bottom.equalToSuperview().offset(Dimension.normalMarginInverse)
        }
    }
    
    func setupStartTimeAndScrAirportLabel() {
        self.addSubview(self.startTimeAndScrAirportLabel)
        
        self.startTimeAndScrAirportLabel.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview().multipliedBy(5.0/6.0)
            make.top.equalTo(self.logoAirlinesImageView.snp.top)
            make.width.equalToSuperview().dividedBy(6)
        }
    }
    
    func setupEndTimeAndDesAirportLabel() {
        self.addSubview(self.endTimeAndDesAirportLabel)
        
        self.endTimeAndDesAirportLabel.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview().multipliedBy(7.0/6.0)
            make.top.equalTo(self.startTimeAndScrAirportLabel.snp.top)
            make.width.equalTo(self.startTimeAndScrAirportLabel)
        }
    }
    
    func setupPriceTicketLabel() {
        self.addSubview(self.priceTicketLabel)
        
        self.priceTicketLabel.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview().multipliedBy(5.0/3.0)
            make.top.equalTo(self.endTimeAndDesAirportLabel)
            make.width.equalToSuperview().dividedBy(3)
        }
    }
    
    func setupCurrencyLabel() {
        self.addSubview(self.currencyLabel)
        
        self.currencyLabel.snp.makeConstraints { (make) in
            make.left.right.equalTo(self.priceTicketLabel)
            make.top.equalTo(self.priceTicketLabel.snp.bottom)
        }
    }
    
    override func setupview() {
        self.setupTimeLineAndFlightRouteLabel()
        self.setupIdPlaneLabel()
        self.setupLogoAirlinesImageView()
        self.setupStartTimeAndScrAirportLabel()
        self.setupEndTimeAndDesAirportLabel()
        self.setupPriceTicketLabel()
        self.setupCurrencyLabel()
    }
}
