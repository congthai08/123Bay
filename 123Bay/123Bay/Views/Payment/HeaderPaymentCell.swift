//
//  HeaderPaymentCell.swift
//  123bay
//
//  Created by MACOS on 6/17/17.
//  Copyright © 2017 123bay. All rights reserved.
//

import UIKit

class HeaderPaymentCell: BaseCollectionViewCell {
    
    //MARK: Create Object
    private var departureView: ViewFlight = {
        let viewConfig = ViewFlight()
        return viewConfig
    }()
    
    private var arriveView: ViewFlight = {
        let viewConfig = ViewFlight()
        
        viewConfig.setupTextAlignmentLabel(alignment: .right)
        viewConfig.setupContent(title: "CHUYẾN BAY VỀ", infoFlight: "HÀ NỘI > NHA TRANG")
        
        return viewConfig
    }()
    
    private var lineDevider: UIView = {
        let viewConfig = UIView()
        viewConfig.backgroundColor = Theme.shared.lineDeviderColor
        return viewConfig
    }()
    
    private var departurePriceView: PriceTicketView = {
        let viewConfig = PriceTicketView()
        return viewConfig
    }()
    
    private var arrivePriceView: PriceTicketView = {
        let viewConfig = PriceTicketView()
        viewConfig.setupAlignment(textAlignment: .right, imageContentMode: .right)
        return viewConfig
    }()
    
    //MARK: Initialize funtion
    override func setupview() {
        super.setupview()
        setupViewLineDevider()
        setupViewViewDeparture()
        setupViewArrive()
        setupViewDeparturePriceView()
        setupViewArrivePriceView()
    }
    
    //MARK: setupView function
    private func setupViewLineDevider() {
        addSubview(lineDevider)
        lineDevider.snp.makeConstraints { (make) in
            make.width.equalToSuperview()
            make.height.equalTo(2)
            make.centerY.equalToSuperview()
            make.centerX.equalToSuperview()
        }
    }
    
    private func setupViewViewDeparture() {
        addSubview(departureView)
        departureView.snp.makeConstraints { (make) in
            make.width.equalToSuperview().multipliedBy(0.4)
            make.centerY.equalToSuperview().multipliedBy(0.5)
            make.left.equalTo(self.snp.left).offset(Dimension.shared.pageLeftMarging)
            make.height.equalToSuperview().multipliedBy(0.3)
        }
    }
    
    private func setupViewArrive() {
        addSubview(arriveView)
        arriveView.snp.makeConstraints { (make) in
            make.width.equalToSuperview().multipliedBy(0.4)
            make.centerY.equalToSuperview().multipliedBy(0.5)
            make.right.equalTo(self.snp.right).offset(-Dimension.shared.pageRightMarging)
            make.height.equalToSuperview().multipliedBy(0.3)
        }
    }
    
    private func setupViewDeparturePriceView() {
        addSubview(departurePriceView)
        departurePriceView.snp.makeConstraints { (make) in
            make.width.equalToSuperview().multipliedBy(0.4)
            make.height.equalToSuperview().multipliedBy(0.45)
            make.centerY.equalToSuperview().multipliedBy(1.5).offset(10)
            make.left.equalToSuperview().offset(Dimension.shared.pageLeftMarging)
        }
    }
    
    private func setupViewArrivePriceView() {
        addSubview(arrivePriceView)
        arrivePriceView.snp.makeConstraints { (make) in
            make.width.equalToSuperview().multipliedBy(0.4)
            make.height.equalToSuperview().multipliedBy(0.45)
            make.top.equalTo(self.departurePriceView.snp.top)
            make.right.equalToSuperview().offset(-Dimension.shared.pageRightMarging)
        }
    }
    
}









