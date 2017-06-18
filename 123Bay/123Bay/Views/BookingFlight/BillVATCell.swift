//
//  BillVATCell.swift
//  123bay
//
//  Created by MACOS on 6/16/17.
//  Copyright © 2017 123bay. All rights reserved.
//

import UIKit

class BillVATCell: BaseCollectionViewCell {
    
    var isCheckBillVAT = false
    
    //MARK: Craete Object
    var bookingFlightController: BookingFlightController?
    
    private var labelBox: UILabel = {
        var labelConfig = UILabel()
        
        labelConfig.layer.borderWidth = 1
        labelConfig.layer.borderColor = Theme.shared.borderBoxColor.cgColor
        labelConfig.isUserInteractionEnabled = true
        return labelConfig
    }()
    
    private var imageCheck: UIImageView = {
        var imageConfig = UIImageView()
        
        imageConfig.isUserInteractionEnabled = true
        imageConfig.contentMode = .scaleAspectFit
        imageConfig.image = UIImage(named: "5-7")
        imageConfig.isHidden = true
        return imageConfig
    }()
    
    private var labelBill: UILabel = {
        let labelConfig: UILabel = UILabel()
        
        labelConfig.text = "Xuất hoá đơn VAT"
        labelConfig.font = UIFont.systemFont(ofSize: Dimension.shared.mediumContentFontSize, weight: 0.3)
        labelConfig.textColor = Theme.shared.darkBlueTextColor
        labelConfig.textAlignment = .left
        labelConfig.isUserInteractionEnabled = true
        return labelConfig
    }()
    
    private var buttonDetail: UIButton = {
        let buttonConfig = UIButton()
        
        buttonConfig.backgroundColor = UIColor.clear
        buttonConfig.setTitle("CHI TIẾT", for: .normal)
        buttonConfig.setTitleColor(Theme.shared.darkBlueTextColor, for: .normal)
        buttonConfig.titleLabel?.font = UIFont.systemFont(ofSize: Dimension.shared.smallTitleButtonFontSize, weight: 0.3)
        return buttonConfig
    }()
    
    //MARK: Initialize funtion
    override func setupview() {
        super.setupview()
        setupViewLabelBox()
        setupViewLabelBill()
        setupViewImageCheck()
        setupViewButtonDetail()
        
        adTarget()
    }
    
    //MARK: SetupViewFunction
    private func setupViewLabelBill() {
        addSubview(labelBill)
        labelBill.snp.makeConstraints { (make) in
            make.height.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.5)
            make.left.equalTo(self.labelBox.snp.right).offset(15)
            make.centerY.equalToSuperview()
        }
    }
    
    private func setupViewLabelBox() {
        addSubview(labelBox)
        labelBox.snp.makeConstraints { (make) in
            make.height.equalToSuperview().multipliedBy(0.25)
            make.width.equalTo(self.labelBox.snp.height)
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().offset(15)
        }
    }
    
    private func setupViewImageCheck() {
        addSubview(imageCheck)
        imageCheck.snp.makeConstraints { (make) in
            make.width.equalTo(self.labelBox.snp.width).multipliedBy(1.1)
            make.height.equalTo(self.imageCheck.snp.width)
            make.bottom.equalTo(self.labelBox.snp.bottom).offset(-2)
            make.left.equalTo(self.labelBox.snp.left).offset(1)
        }
    }
    
    fileprivate func  setupViewButtonDetail() {
        buttonDetail.isHidden = true
        addSubview(buttonDetail)
        buttonDetail.snp.makeConstraints { (make) in
            make.height.equalToSuperview().multipliedBy(0.5)
            make.width.equalTo(60)
            make.centerY.equalToSuperview()
            make.right.equalToSuperview().offset(-15)
        }
        
        buttonDetail.addTarget(self, action: #selector(BillVATCell.buttonDetailPressed), for: .touchUpInside)
    }
    
    func buttonDetailPressed() {
        bookingFlightController?.showBillVATCONtroller()
    }
    
    //MARK: Other funtion
    private func adTarget() {
        let tapGesture1 = UITapGestureRecognizer(target: self, action: #selector(BillVATCell.reloadCheckBill))
        let tapGesture2 = UITapGestureRecognizer(target: self, action: #selector(BillVATCell.reloadCheckBill))
        let tapGesture3 = UITapGestureRecognizer(target: self, action: #selector(BillVATCell.reloadCheckBill))
        
        labelBill.addGestureRecognizer(tapGesture1)
        imageCheck.addGestureRecognizer(tapGesture2)
        labelBox.addGestureRecognizer(tapGesture3)
    }
    
    func reloadCheckBill() {
        if isCheckBillVAT {
            imageCheck.isHidden = true
            buttonDetail.isHidden = true
        } else {
            imageCheck.isHidden = false
            buttonDetail.isHidden = false
            bookingFlightController?.showBillVATCONtroller()
        }
        
        isCheckBillVAT = !isCheckBillVAT
    }
}
