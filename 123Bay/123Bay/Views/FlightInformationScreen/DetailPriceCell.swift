//
//  DetailPriceCell.swift
//  123bay
//
//  Created by hai on 6/17/17.
//  Copyright © 2017 123bay. All rights reserved.
//

import UIKit

class DetailPriceCell: BaseTableViewCell {
    
    //Create variables
    var airplaneCompanyLabel: UILabel = {
        let airplaneCompanyLabel = UILabel()
        
        airplaneCompanyLabel.textColor = Theme.subColor
        airplaneCompanyLabel.font = Theme.shared.normalFontSize
        return airplaneCompanyLabel
    }()
    
    var typeGuestLabel: UILabel = {
        let typeGuestLabel = UILabel()
        
        typeGuestLabel.textColor = Theme.subColor
        typeGuestLabel.font = Theme.shared.normalFontSize
        return typeGuestLabel
    }()
    
    var numberOfGuestLabel: UILabel = {
        let numberOfGuestLabel = UILabel()
        
        numberOfGuestLabel.textColor = Theme.subColor
        numberOfGuestLabel.font = Theme.shared.normalFontSize
        return numberOfGuestLabel
    }()
    
    var priceLabel: UILabel = {
        let priceLabel = UILabel()
        
        priceLabel.textColor = Theme.subColor
        priceLabel.font = Theme.shared.normalFontSize
        return priceLabel
    }()
    
    override func setupview() {
        setupForAirplaneCompany()
        setupForTypeGuest()
        setupForPrice()
        setupForNumerOfGuest()
    }
    
    func setContentForCell(airplaneCompany: String, typeGuest: String, numberOfGuest: Int, price: Int) {
        airplaneCompanyLabel.text = airplaneCompany
        if typeGuest == "" {
            typeGuestLabel.text = ""
        } else {
            typeGuestLabel.text = "(" + typeGuest + ")"
        }
        if numberOfGuest == 0 {
            numberOfGuestLabel.text = ""
        } else {
            numberOfGuestLabel.text = "(" + numberOfGuest.description + "x" + ")"
        }
        
        priceLabel.text = price.description + " VND"
    }
    
    //Autolayout for elements
    private func setupForAirplaneCompany() {
        self.addSubview(airplaneCompanyLabel)
        airplaneCompanyLabel.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
            make.left.equalToSuperview().offset(15)
        }
    }
    
    private func setupForTypeGuest() {
        self.addSubview(typeGuestLabel)
        typeGuestLabel.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.left.equalTo(self.airplaneCompanyLabel.snp.right).offset(2)
            make.bottom.equalToSuperview()
        }
    }
    
    private func setupForNumerOfGuest() {
        self.addSubview(numberOfGuestLabel)
        numberOfGuestLabel.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
            make.left.equalTo(self.typeGuestLabel.snp.right).offset(2)
        }
    }
    
    private func setupForPrice() {
        self.addSubview(priceLabel)
        priceLabel.snp.makeConstraints { (make) in
            make.right.equalToSuperview().inset(15)
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
}
