//
//  TextFieldInfoCell.swift
//  123bay
//
//  Created by MACOS on 6/16/17.
//  Copyright © 2017 123bay. All rights reserved.
//

import UIKit

class TextFieldInfoCell: BaseCollectionViewCell {
    
    //MARK: Create Object
    lazy private var textFieldInfo: UITextField = {
        let textFieldConfig = UITextField()
        
        textFieldConfig.delegate = self
        return textFieldConfig
    }()
    
    private var lineDevider: UIView = {
        let viewConfig = UIView()
        
        viewConfig.backgroundColor = Theme.shared.lineDeviderColor
        return viewConfig
    }()
    
    //MARK: Initialize funtion
    override func setupview() {
        super.setupview()
        setupViewTextFieldInfo()
        setupViewLineDevider()
    }
    
    //MARK: Setupview function
    private func setupViewTextFieldInfo() {
        addSubview(textFieldInfo)
        textFieldInfo.snp.makeConstraints { (make) in
            make.bottom.equalToSuperview().offset(-5)
            make.width.equalToSuperview().offset(-30)
            make.height.equalTo(30)
            make.centerX.equalToSuperview()
        }
    }
    
    private func setupViewLineDevider() {
        addSubview(lineDevider)
        lineDevider.snp.makeConstraints { (make) in
            make.width.equalToSuperview().offset(-30)
            make.height.equalTo(1)
            make.bottom.equalToSuperview()
            make.centerX.equalToSuperview()
        }
    }
    
    //MARK: Other funtion
    func setPlaceHolderText(placeHolder text: String) {
        textFieldInfo.attributedPlaceholder = NSAttributedString(string: text,
                                                                   attributes: [NSFontAttributeName: UIFont.systemFont(ofSize: Dimension.shared.placeholherTextfieldFontSize)])
    }
}

extension TextFieldInfoCell: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.endEditing(true)
        return false
    }
}




