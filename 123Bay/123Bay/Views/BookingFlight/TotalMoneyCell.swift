//
//  TotalMoneyCell.swift
//  123bay
//
//  Created by MACOS on 6/16/17.
//  Copyright © 2017 123bay. All rights reserved.
//

import UIKit

class TotalMoneyCell: BaseTableViewCell {
    //MARK: Create Object
    var bookingController: BookingFlightController?
    
    var labelTitleSale: UILabel = {
        let labelConfig = UILabel()
        
        labelConfig.text = "Nhập mã khuyến mãi:"
        labelConfig.textColor = Theme.shared.contentTextColor
        labelConfig.textAlignment = .left
        labelConfig.font = UIFont.systemFont(ofSize: Dimension.shared.mediumContentFontSize)
        return labelConfig
    }()
    
    lazy private var textFieldSale: UITextField = {
        let textFieldConfig = UITextField()
        
        textFieldConfig.delegate = self
        textFieldConfig.layer.borderWidth = 1
        textFieldConfig.layer.borderColor = Theme.shared.borderBoxColor.cgColor
        return textFieldConfig
    }()
    
    private var labelTitleMoney: UILabel = {
        let labelConfig = UILabel()
        
        labelConfig.text = "TỔNG TIỀN"
        labelConfig.textColor = Theme.shared.highlightTextColor
        labelConfig.font = UIFont.systemFont(ofSize: Dimension.shared.largeContentFontSize, weight: 0.3)
        return labelConfig
    }()
    
    private var labelTotalMoney: UILabel = {
        let labelConfig = UILabel()
        
        labelConfig.text = "3.423.000 VNĐ"
        labelConfig.textColor = Theme.shared.highlightTextColor
        labelConfig.textAlignment = .right
        labelConfig.font = UIFont.systemFont(ofSize: Dimension.shared.largeContentFontSize, weight: 0.3)
        return labelConfig
    }()
    
    private var buttonNext: UIButton = {
        let buttonConfig = UIButton()
        
        buttonConfig.setTitle("Tiếp tục", for: .normal)
        buttonConfig.titleLabel?.font = UIFont.systemFont(ofSize: Dimension.shared.largeButtonFontSize)
        buttonConfig.backgroundColor = Theme.shared.yellowButtonColor
        buttonConfig.layer.cornerRadius = Dimension.shared.cornerRadius
        buttonConfig.layer.masksToBounds = true
        return buttonConfig
    }()
    
    //MARK: Initialize funtion
    override func setupview() {
        super.setupview()
        setupViewTextFieldSale()
        setupViewLabelTitleSale()
        setupViewLabelTitleMoney()
        setupViewLabelTotalMoney()
        setupViewButtonNext()
        addTarGetButtonnext()
    }
    
    private func addTarGetButtonnext() {
        buttonNext.addTarget(self, action: #selector(TotalMoneyCell.showpaymentController), for: .touchUpInside)
    }
    
    //MARK: SetupView function
    private func setupViewTextFieldSale() {
        addSubview(textFieldSale)
        textFieldSale.snp.makeConstraints { (make) in
            make.width.equalToSuperview().multipliedBy(0.5)
            make.height.equalToSuperview().multipliedBy(0.2)
            make.top.equalToSuperview().offset(Dimension.shared.topMargin)
            make.right.equalToSuperview().offset(-Dimension.shared.pageRightMarging)
        }
    }
    
    private func setupViewLabelTitleSale() {
        addSubview(labelTitleSale)
        labelTitleSale.snp.makeConstraints { (make) in
            make.width.equalToSuperview().multipliedBy(0.4)
            make.height.equalTo(self.textFieldSale.snp.height)
            make.centerY.equalTo(self.textFieldSale.snp.centerY)
            make.right.equalTo(self.textFieldSale.snp.left).offset(-5)
        }
    }
    
    private func setupViewLabelTitleMoney() {
        addSubview(labelTitleMoney)
        labelTitleMoney.snp.makeConstraints { (make) in
            make.width.equalToSuperview().multipliedBy(0.3)
            make.height.equalTo(40)
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().offset(Dimension.shared.pageLeftMarging)
        }
    }
    
    private func setupViewLabelTotalMoney() {
        addSubview(labelTotalMoney)
        labelTotalMoney.snp.makeConstraints { (make) in
            make.width.equalToSuperview().multipliedBy(0.4)
            make.height.equalTo(40)
            make.centerY.equalToSuperview()
            make.right.equalToSuperview().offset(-Dimension.shared.pageRightMarging)
        }
    }
    
    private func setupViewButtonNext() {
        addSubview(buttonNext)
        buttonNext.snp.makeConstraints { (make) in
            make.width.equalToSuperview().multipliedBy(0.8)
            make.height.equalToSuperview().multipliedBy(0.25)
            make.bottom.equalToSuperview().offset(-Dimension.shared.bottomMargin)
            make.centerX.equalToSuperview()
        }
    }
    
    func showpaymentController() {
        bookingController?.showpaymentController()
    }
    
}

extension TotalMoneyCell: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.endEditing(true)
        return false
    }
    
}







