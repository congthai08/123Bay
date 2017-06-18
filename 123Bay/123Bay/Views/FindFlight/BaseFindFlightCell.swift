//
//  FindFlightCell.swift
//  123bay
//
//  Created by Os on 5/27/17.
//  Copyright © 2017 123bay. All rights reserved.
//

import UIKit

class BaseFindFlightCell: BaseTableViewCell {
    
    //MARK: Create Object
    
    var imageIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "2-5")
        imageView.contentMode = .scaleAspectFit
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    var labelTitle: UILabel = {
        let label = UILabel()
        label.text = "Điểm khởi hành"
        label.textAlignment = .left
        label.textColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        label.font = UIFont.systemFontSizeDevide(ofSize: 14)
        return label
    }()
    
    var lineDevider: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1).withAlphaComponent(0.2)
        return view
    }()
    
    //MARK: Initialize funtion
    
    override func setupview() {
        super.setupview()
        self.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        setupViewImageIcon()
        setupViewLabelTitle()
        setupViewLineDevider()
    }
    
    //MARK: SetupView function
    
    func setupViewImageIcon() {
        addSubview(imageIcon)
        imageIcon.snp.makeConstraints { (make) in
            make.height.equalToSuperview().multipliedBy(0.4)
            make.width.equalTo(self.imageIcon.snp.height)
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().offset(20)
        }
    }
    
    func setupViewLabelTitle() {
        addSubview(labelTitle)
        labelTitle.snp.makeConstraints { (make) in
            make.width.equalToSuperview().multipliedBy(0.4)
            make.height.equalToSuperview().multipliedBy(0.8)
            make.left.equalTo(self.imageIcon.snp.right).offset(10)
            make.centerY.equalToSuperview()
        }
    }
    
    func setupViewLineDevider() {
        addSubview(lineDevider)
        lineDevider.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
            make.height.equalTo(1)
            make.bottom.equalToSuperview().offset(-1)
        }
    }
}











