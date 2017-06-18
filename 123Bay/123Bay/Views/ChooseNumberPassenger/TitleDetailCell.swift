//
//  TitleDetailCell.swift
//  123bay
//
//  Created by Os on 6/7/17.
//  Copyright © 2017 123bay. All rights reserved.
//

import UIKit

class TitleDetailCell: BaseCollectionViewCell {
    
    var typePassenger: TypePassenger? {
        didSet {
            guard let type = typePassenger?.nameType else { return }
            guard let old = typePassenger?.oldPassanger else { return }
            self.labelTypePassenger.text = type.uppercased()
            self.labelOld.text = old
        }
    }
    
    //MARK: Create Object
    private var labelTypePassenger: UILabel = {
       let labelConfig = UILabel()
        
        labelConfig.text = "NGƯỜI LỚN"
        labelConfig.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        labelConfig.textAlignment = .center
        labelConfig.font = UIFont.fontBoldOfSize(ofSize: 12)
        return labelConfig
    }()
    
    private var labelOld: UILabel = {
        let labelConfig = UILabel()
        
        labelConfig.text = "Trên 12 tuổi"
        labelConfig.textColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        labelConfig.textAlignment = .center
        labelConfig.font = UIFont.systemFontSizeDevide(ofSize: 12)
        return labelConfig
    }()
    
    private var lineDevider: UIView = {
        let view = UIView()
        
        view.backgroundColor = UIColor(white: 0, alpha: 0.1)
        return view
    }()

    //MARK: Initialize function
    override func setupview() {
        super.setupview()
        setupViewLabelTypePassenger()
        setupViewLabelOld()
        setupViewlinedevider()
    }
    
    //MARK: Setup View function
    private func setupViewLabelTypePassenger() {
        let topAnchor = (self.frame.height - 35) / 2
        addSubview(labelTypePassenger)
        labelTypePassenger.snp.makeConstraints { (make) in
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.top.equalToSuperview().offset(topAnchor)
            make.height.equalTo(20)
        }
    }
    
    private func setupViewLabelOld() {
        addSubview(labelOld)
        labelOld.snp.makeConstraints { (make) in
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.top.equalTo(self.labelTypePassenger.snp.bottom)
            make.height.equalTo(15)
        }
    }
    
    private func setupViewlinedevider() {
        addSubview(lineDevider)
        lineDevider.snp.makeConstraints { (make) in
            make.height.equalTo(1)
            make.right.equalToSuperview()
            make.left.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
}
