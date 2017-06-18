//
//  FooterForDetailPriceView.swift
//  123bay
//
//  Created by hai on 6/17/17.
//  Copyright © 2017 123bay. All rights reserved.
//

import UIKit

//This View shows the things in table detail footer

class FooterForDetailPriceView: BaseFooterView {
    
    //Title label
    var firstCachedLine: UILabel = {
        let firstCachedLine = UILabel()
        firstCachedLine.backgroundColor = Theme.shared.viewControlKeyboardBackground
        return firstCachedLine
    }()
    
    var sumaryLabel: UILabel = {
        let sumaryLabel = UILabel()
        
        sumaryLabel.text = "Tổng"
        sumaryLabel.textColor = Theme.subColor
        sumaryLabel.font = Theme.shared.boldNormalFontSize
        return sumaryLabel
    }()
    
    var taxLabel: UILabel = {
        let taxLabel = UILabel()
        
        taxLabel.text = "Thuế"
        taxLabel.textColor = Theme.subColor
        taxLabel.font = Theme.shared.normalFontSize
        return taxLabel
    }()
    
    var secondCachedLine: UILabel = {
        let secondCachedLine = UILabel()
        secondCachedLine.backgroundColor = Theme.shared.viewControlKeyboardBackground
        return secondCachedLine
    }()
    
    var totalLabel: UILabel = {
        let totalLabel = UILabel()
        
        totalLabel.text = "Tổng cộng"
        totalLabel.textColor = Theme.subColor
        totalLabel.font = Theme.shared.boldNormalFontSize
        return totalLabel
    }()
    
    //Show label
    var sumanyShowLabel: UILabel = {
        let sumanyLabel = UILabel()
        
        sumanyLabel.textColor = Theme.subColor
        sumanyLabel.font = Theme.shared.boldNormalFontSize
        return sumanyLabel
    }()
    
    var taxShowLabel: UILabel = {
        let taxLabel = UILabel()
        
        taxLabel.textColor = Theme.subColor
        taxLabel.font = Theme.shared.normalFontSize
        return taxLabel
    }()
    
    var totalShowLabel: UILabel = {
        let totalLabel = UILabel()
        
        totalLabel.textColor = Theme.subColor
        totalLabel.font = Theme.shared.boldNormalFontSize
        return totalLabel
    }()
    
    override func setupFooterView() {
        self.contentView.backgroundColor = Theme.defaultColor
        setupForFirstLine()
        setupForSumanyLabel()
        setupForTaxLabel()
        setupForSecondLine()
        setupForTotalLabel()
        
        setupForShowSumany()
        setupForShowTax()
        setupForShowTotal()
    }
    
    //Set text
    func setData(sumany: Int, tax: String, total: Int) {
        sumanyShowLabel.text = sumany.description
        taxShowLabel.text = tax
        totalShowLabel.text = total.description
    }
    
    //Autolayout for elements
    func setupForFirstLine() {
        self.addSubview(firstCachedLine)
        firstCachedLine.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.height.equalTo(1)
        }
    }
    
    func setupForSumanyLabel() {
        self.addSubview(sumaryLabel)
        sumaryLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.firstCachedLine.snp.bottom)
            make.height.equalTo(40)
            make.left.equalToSuperview().offset(15)
        }
    }
    
    func setupForTaxLabel() {
        self.addSubview(taxLabel)
        taxLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.sumaryLabel.snp.bottom)
            make.height.equalTo(40)
            make.left.equalToSuperview().offset(15)
        }
    }
    
    func setupForSecondLine() {
        self.addSubview(secondCachedLine)
        secondCachedLine.snp.makeConstraints { (make) in
            make.top.equalTo(self.taxLabel.snp.bottom)
            make.height.equalTo(1)
            make.left.equalToSuperview()
            make.right.equalToSuperview()
        }
    }
    
    func setupForTotalLabel() {
        self.addSubview(totalLabel)
        totalLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.secondCachedLine.snp.bottom)
            make.left.equalToSuperview().offset(15)
            make.height.equalTo(40)
        }
    }
    
    func setupForShowSumany() {
        self.addSubview(sumanyShowLabel)
        sumanyShowLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.sumaryLabel)
            make.bottom.equalTo(self.sumaryLabel)
            make.right.equalToSuperview().inset(15)
        }
    }
    
    func setupForShowTax() {
        self.addSubview(taxShowLabel)
        taxShowLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.taxLabel)
            make.bottom.equalTo(self.taxLabel)
            make.right.equalToSuperview().inset(15)
        }
    }
    
    func setupForShowTotal() {
        self.addSubview(totalShowLabel)
        totalShowLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.totalLabel)
            make.bottom.equalTo(self.totalLabel)
            make.right.equalToSuperview().inset(15)
        }
    }
}
