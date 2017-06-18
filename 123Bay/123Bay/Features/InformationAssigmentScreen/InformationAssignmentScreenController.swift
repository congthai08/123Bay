//
//  InformationAssignmentScreenController.swift
//  123bay
//
//  Created by hai on 6/18/17.
//  Copyright © 2017 123bay. All rights reserved.
//

import UIKit

//This controller presents how users can assign their email to get information from 123bay.vn

class InformationAssignmentScreenController: UIViewController {

    //MARK: - Create variables
    private var infoLabel: UILabel = {
        let infoLabel = UILabel()
        
        infoLabel.textColor = Theme.subColor
        infoLabel.font = Theme.shared.boldNormalFontSize
        infoLabel.numberOfLines = 0
        
        return infoLabel
    }()
    
    private var cachedEmailLabel: UILabel = {
        let cachedEmailLabel = UILabel()
        
        cachedEmailLabel.textColor = Theme.subColor
        cachedEmailLabel.alpha = 0
        cachedEmailLabel.font = Theme.shared.lessFontSize
        
        return cachedEmailLabel
    }()
    
    private var emailTextField: UITextField = {
        let emailTextField = UITextField()
        
        emailTextField.textColor = Theme.subColor
        emailTextField.font = Theme.shared.normalFontSize
        emailTextField.keyboardType = .emailAddress
        
        return emailTextField
    }()
    
    private var cachedLineLabel: UILabel = {
        let cachedLineLabel = UILabel()
        
        cachedLineLabel.backgroundColor = Theme.shared.viewBoundPickerBackground
        cachedLineLabel.alpha = Theme.smallAlpha
        
        return cachedLineLabel
    }()
    
    private var assignButton: UIButton = {
        let assignButton = UIButton()
        
        assignButton.setTitleColor(Theme.defaultColor, for: UIControlState.normal)
        assignButton.titleLabel?.font = Theme.shared.boldLargeFontSize
        assignButton.border(radius: 5, width: 0, color: UIColor.clear)
        assignButton.backgroundColor = Theme.shared.buttonContinueColor
        
        return assignButton
    }()
    
    //MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        setupForInfoLabel()
        setupForEmailLabel()
        setupForCachedEmail()
        setupForCachedLine()
        setupForAssignButton()
        //Set data
        setData()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        emailTextField.resignFirstResponder()
    }
    //MARK: - Set data
    private func setData() {
        infoLabel.text = "Đăng ký ngay để nhận giảm giá khi đặt vé máy bay và khách sạn lên đến 70%. MIỄN PHÍ!"
        emailTextField.placeholder = "Email"
        cachedEmailLabel.text = "Email"
        assignButton.setTitle("ĐĂNG KÝ", for: UIControlState.normal)
    }
    
    //MARK: - Autolayout for elements
    
    private func setupForInfoLabel() {
        self.view.addSubview(infoLabel)
        infoLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.topLayoutGuide.snp.bottom).offset(Dimension.shared.topMargin)
            make.left.equalToSuperview().offset(Dimension.shared.pageLeftMarging)
            make.right.equalToSuperview().offset(Dimension.shared.pageRightMarging)
        }
    }
    
    private func setupForEmailLabel() {
        self.view.addSubview(emailTextField)
        emailTextField.snp.makeConstraints { (make) in
            make.top.equalTo(self.infoLabel.snp.bottom).offset(30)
            make.left.equalTo(self.infoLabel)
            make.right.equalTo(self.infoLabel)
            make.height.equalTo(30)
        }
    }
    
    private func setupForCachedEmail() {
        self.view.addSubview(cachedEmailLabel)
        cachedEmailLabel.snp.makeConstraints { (make) in
            make.bottom.equalTo(self.emailTextField.snp.top).offset(2)
            make.left.equalTo(self.emailTextField)
            make.height.equalTo(20)
        }
    }
    
    private func setupForCachedLine() {
        self.view.addSubview(cachedLineLabel)
        cachedLineLabel.snp.makeConstraints { (make) in
            make.bottom.equalTo(self.emailTextField)
            make.left.equalTo(self.emailTextField)
            make.right.equalTo(self.emailTextField)
            make.height.equalTo(1)
        }
    }
    
    private func setupForAssignButton() {
        self.view.addSubview(assignButton)
        assignButton.snp.makeConstraints { (make) in
            make.top.equalTo(self.emailTextField.snp.bottom).offset(20)
            make.width.equalToSuperview().multipliedBy(0.8)
            make.centerX.equalToSuperview()
            make.height.equalTo(50 * Dimension.shared.widthScale)
        }
    }
}
