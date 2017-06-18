//
//  PaymentCell.swift
//  123bay
//
//  Created by MACOS on 6/17/17.
//  Copyright © 2017 123bay. All rights reserved.
//

import UIKit

class PaymentInfomationcell: BaseCollectionViewCell {
    //MARK: Create Object
    private var labelTitle: UILabel = {
        let labelConfig = UILabel()
        
        labelConfig.text = "DANH SÁCH KHÁCH HÀNG"
        labelConfig.textColor = Theme.shared.blueTextColor
        labelConfig.font = UIFont.systemFont(ofSize: Dimension.shared.titleFontSize, weight: 0.3)
        
        return labelConfig
    }()
    
    private var labelContent: UILabel = {
        let labelConfig = UILabel()
        
        labelConfig.text = "Mức giá đã được hãng chấp nhận. Vui lòng kiểm tra thông tin đặt chỗ và Tiếp tục thanh toán"
        labelConfig.font = UIFont.systemFont(ofSize: Dimension.shared.mediumContentFontSize)
        labelConfig.textColor = Theme.shared.contentTextColor
        
        labelConfig.numberOfLines = 0
        
        return labelConfig
    }()
    
    private var lineDevider: UIView = {
        let viewConfig = UIView()
        viewConfig.backgroundColor = Theme.shared.lineDeviderColor
        return viewConfig
    }()
    
    //MARK: Initialize function
    override func setupview() {
        super.setupview()
        setupViewLabelTitle()
        setupViewLabelContent()
        setupViewLineDevider()
    }
    
    //MARK: SetupView function
    private func setupViewLabelTitle() {
        addSubview(labelTitle)
        labelTitle.snp.makeConstraints { (make) in
            make.width.equalToSuperview()
            make.height.equalTo(20).multipliedBy(Dimension.shared.widthScale)
            make.top.equalToSuperview().offset(5)
            make.left.equalToSuperview().offset(Dimension.shared.pageLeftMarging)
        }
    }
    
    private func setupViewLabelContent() {
        addSubview(labelContent)
        labelContent.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(Dimension.shared.pageLeftMarging)
            make.right.equalToSuperview().offset(-Dimension.shared.pageRightMarging)
            make.top.equalTo(self.labelTitle.snp.bottom)
            make.height.equalTo(40)
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
    
    //MARK: Other function
    func setupTitleLabel(title string: String) {
        labelTitle.text = string.uppercased()
    }
    
}
