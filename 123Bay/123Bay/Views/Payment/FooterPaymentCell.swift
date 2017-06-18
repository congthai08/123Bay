//
//  FooterPaymentCell.swift
//  123bay
//
//  Created by MACOS on 6/17/17.
//  Copyright © 2017 123bay. All rights reserved.
//

import UIKit

protocol FooterPaymentCellDelegate: class {
    func prsentSuccessfullBookingController(_ controller: UIViewController)
}

class FooterPaymentCell: BaseCollectionViewCell {
    
    //MARK: Create Object
    
    weak var delegate: FooterPaymentCellDelegate?
    
    private var menuBar: MenuBarBank = {
        let menu = MenuBarBank()
        
        return menu
    }()
    
    private var labelContentBank: UILabel = {
        let labelConfig = UILabel()
        
        labelConfig.text = "Vui lòng chuyển khoản đến tài khoản sau theo nội dung thanh toán trong email xác nhận: \nCông ty: Chi nhánh 123bay.vn - Công ty CP Du lịch và DV 123Bay.vn \nSố tài khoản: 0331000428208 \nNgân hàng: Ngân hàng TMCP Ngoại thương Việt Nam (VCB), Chi nhánh Bến Thành."
        labelConfig.font = UIFont.systemFont(ofSize: Dimension.shared.mediumContentFontSize)
        labelConfig.numberOfLines = 0
        
        return labelConfig
    }()
    
    private var textViewPolicy: UITextView = {
        let textViewConfig = UITextView()
        textViewConfig.setStyleTitle(title: "Lưu ý",
                                     content: "Trong thời gian quý khách thực hiện thanh toán, giá có thể thay đổi. Chúng tối sẽ thông báo cho quý khách nếu booking có sự điều chỉnh và giá. 123bay.vn sẽ hoàn lại tiền cho quý khách trong trường hợp quý khách không đồng ý thanh toán phần chênh lệch.",
                                     fontsizeTiltle: Dimension.shared.mediumContentFontSize,
                                     colorTitle: Theme.shared.highlightTextColor,
                                     fontsizeContent: Dimension.shared.mediumContentFontSize,
                                     colorContent: Theme.shared.contentTextColor,
                                     lineSpacing: 5)
        
        textViewConfig.isScrollEnabled = false
        textViewConfig.showsVerticalScrollIndicator = false
        textViewConfig.allowsEditingTextAttributes = false
        textViewConfig.isEditable = false
        
        return textViewConfig
    }()
    
    private var lineDevider: UIView = {
        let viewConfig = UIView()
        viewConfig.backgroundColor = Theme.shared.lineDeviderColor
        return viewConfig
    }()
    
    private var labelAttention: UILabel = {
        let labelConfig = UILabel()
        
        labelConfig.text = "Bằng việc nhấn Tiếp tục, bạn đồng ý với các điều khoản & Điều kiện và Chính sách quyền riêng tư của 123bay.vn"
        labelConfig.font = UIFont.systemFont(ofSize: Dimension.shared.mediumContentFontSize)
        labelConfig.numberOfLines = 0
        
        return labelConfig
    }()
    
    private var nextButton: UIButton = {
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
        setupViewMenuBar()
        setupViewLabelContentBank()
        setupViewTextViewPolicy()
        setupViewLineDevider()
        setupViewLabelAttention()
        setupViewButtonNext()
    }
    
    private func setupViewMenuBar() {
        self.addSubview(self.menuBar)
        menuBar.snp.makeConstraints { (make) in
            make.width.equalToSuperview()
            make.height.equalTo(50).multipliedBy(Dimension.shared.widthScale)
            make.left.equalToSuperview()
            make.top.equalToSuperview()
        }
    }
    
    private func setupViewLabelContentBank() {
        self.addSubview(labelContentBank)
        labelContentBank.snp.makeConstraints { (make) in
            make.width.equalToSuperview().offset(-2 * Dimension.shared.pageLeftMarging)
            make.left.equalToSuperview().offset(Dimension.shared.pageLeftMarging)
            make.top.equalTo(self.menuBar.snp.bottom).offset(10)
        }
    }
    
    private func setupViewTextViewPolicy() {
        self.addSubview(textViewPolicy)
        textViewPolicy.snp.makeConstraints { (make) in
            make.width.equalToSuperview().offset(-2 * Dimension.shared.pageLeftMarging)
            make.left.equalToSuperview().offset(Dimension.shared.pageLeftMarging)
            make.top.equalTo(self.labelContentBank.snp.bottom).offset(10)
            make.height.equalTo(145).multipliedBy(Dimension.shared.widthScale)
        }
    }
    
    private func setupViewLineDevider() {
        self.addSubview(lineDevider)
        lineDevider.snp.makeConstraints { (make) in
            make.width.equalToSuperview().offset(-2 * Dimension.shared.pageLeftMarging)
            make.height.equalTo(1)
            make.top.equalTo(self.textViewPolicy.snp.bottom)
            make.centerX.equalToSuperview()
        }
    }
    
    private func setupViewLabelAttention() {
        self.addSubview(labelAttention)
        labelAttention.snp.makeConstraints { (make) in
            make.width.equalToSuperview().offset(-2 * Dimension.shared.pageLeftMarging)
            make.top.equalTo(self.lineDevider.snp.bottom).offset(10)
            make.left.equalToSuperview().offset(Dimension.shared.pageLeftMarging)
        }
    }
    
    private func setupViewButtonNext() {
        self.addSubview(nextButton)
        nextButton.snp.makeConstraints { (make) in
            make.width.equalToSuperview().multipliedBy(0.8)
            make.height.equalTo(50).multipliedBy(Dimension.shared.widthScale)
            make.top.equalTo(self.labelAttention.snp.bottom).offset(15 * Dimension.shared.widthScale)
            make.centerX.equalToSuperview()
        }
        
        nextButton.addTarget(
            self,
            action: #selector(FooterPaymentCell.nextButtonPressed),
            for: .touchUpInside
        )
        
    }
    
    func nextButtonPressed() {
        let successfullBookingController = SuccessBookingController()
        delegate?.prsentSuccessfullBookingController(successfullBookingController)
    }
}
