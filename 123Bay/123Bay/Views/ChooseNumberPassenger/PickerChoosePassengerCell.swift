//
//  PickerChoosePassengerCell.swift
//  123bay
//
//  Created by Os on 6/7/17.
//  Copyright © 2017 123bay. All rights reserved.
//

import UIKit

class PickerChoosePassengerCell: BaseCollectionViewCell {
    
    var chooseNumberPassengerController: ChooseNumberPassengerController?
    fileprivate let dataNumberPassenger: [[String]] = [["1", "2", "3", "4", "5", "6", "7"],
                                                       ["0", "1", "2", "3", "4", "5", "6"],
                                                       ["0", "1", "2", "3", "4"]]
    
    //MARK: Create Object
    fileprivate lazy var pickerPassenger: UIPickerView = {
        let pickerConfig = UIPickerView()
        
        pickerConfig.backgroundColor = .clear
        pickerConfig.delegate = self
        pickerConfig.dataSource = self
        return pickerConfig
    }()
    
    fileprivate var darkView: UIView = {
        let viewConfig = UIView()
        
        viewConfig.backgroundColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1).withAlphaComponent(0.1)
        return viewConfig
    }()
    
    private var buttonCancel: UIButton = {
        let buttonConfig = UIButton()
        
        buttonConfig.setTitle("Huỷ", for: .normal)
        buttonConfig.setTitleColor(#colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1), for: .normal)
        buttonConfig.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        buttonConfig.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1).withAlphaComponent(0.7)
        buttonConfig.layer.cornerRadius = 4
        buttonConfig.layer.masksToBounds = true
        return buttonConfig
    }()
    
    private var buttonSelect: UIButton = {
        let buttonConfig = UIButton()
        
        buttonConfig.setTitle("Chọn", for: .normal)
        buttonConfig.setTitleColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
        buttonConfig.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        buttonConfig.backgroundColor = UIColor.rgbColor(red: 245, green: 109, blue: 32, alpha: 1)
        buttonConfig.layer.cornerRadius = 4
        buttonConfig.layer.masksToBounds = true
        return buttonConfig
    }()
    
    //MARK: Initialize function
    override func setupview() {
        super.setupview()
        setupViewPickerPassenger()
        setupViewButtoncancel()
        setupViewButtonSelect()
        setupSelectedPicker()
        setupViewdarkView()
        addTargetForButton()
    }
    
    private func addTargetForButton() {
        buttonCancel.addTarget(self, action: #selector(PickerChoosePassengerCell.actionCancelButton),
                               for: .touchUpInside)
        
        buttonSelect.addTarget(self, action: #selector(PickerChoosePassengerCell.actionSelectButton),
                               for: .touchUpInside)
        
    }
    
    private func setupSelectedPicker() {
        pickerPassenger.showsSelectionIndicator = true
        pickerPassenger.selectRow(0, inComponent: 0, animated: false)
        pickerPassenger.selectRow(6, inComponent: 1, animated: false)
        pickerPassenger.selectRow(6, inComponent: 2, animated: false)
    }
    
    //MARK: SetupView funtion
    private func setupViewPickerPassenger() {
        addSubview(pickerPassenger)
        pickerPassenger.snp.makeConstraints { (make) in
            make.width.equalToSuperview()
            make.centerX.equalToSuperview()
            make.top.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.7)
        }
    }
    
    private func setupViewdarkView() {
        pickerPassenger.addSubview(darkView)
        darkView.snp.makeConstraints { (make) in
            make.centerY.equalTo(self.pickerPassenger.snp.centerY)
            make.width.equalTo(self.pickerPassenger.snp.width)
            make.height.equalTo(self.pickerPassenger.snp.height).multipliedBy(0.3)
            make.left.equalTo(self.pickerPassenger.snp.left)
        }
    }
    
    private func setupViewButtoncancel() {
        addSubview(buttonCancel)
        buttonCancel.snp.makeConstraints { (make) in
            make.height.equalToSuperview().multipliedBy(0.2)
            make.width.equalToSuperview().multipliedBy(0.42)
            make.bottom.equalToSuperview().offset(-15)
            make.left.equalToSuperview().offset(0.05 * self.frame.width)
        }
    }
    
    private func setupViewButtonSelect() {
        addSubview(buttonSelect)
        buttonSelect.snp.makeConstraints { (make) in
            make.height.equalTo(self.buttonCancel.snp.height)
            make.width.equalTo(self.buttonCancel.snp.width)
            make.bottom.equalTo(self.buttonCancel.snp.bottom)
            make.right.equalToSuperview().offset(-0.06 * self.frame.width)
        }
    }
    
    //MARK: Other function
    func actionCancelButton() {
        chooseNumberPassengerController?.hide()
    }
    
    func actionSelectButton() {
        chooseNumberPassengerController?.hide()
    }
}

extension PickerChoosePassengerCell: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        if pickerView.subviews.count == 3 {
            pickerView.subviews[2].isHidden = true
            pickerView.subviews[1].isHidden = true
        }
        return dataNumberPassenger.count
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return dataNumberPassenger[component].count
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let labelNumber: UILabel
        
        if let view = view as? UILabel {
            labelNumber = view
        } else {
            labelNumber = UILabel()
        }
        
        labelNumber.text = dataNumberPassenger[component][row]
        labelNumber.textColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
        labelNumber.font = UIFont.systemFontSizeDevide(ofSize: 25)
        labelNumber.textAlignment = .center
        
        return labelNumber
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 0.3 * pickerView.frame.height
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
    }
}
