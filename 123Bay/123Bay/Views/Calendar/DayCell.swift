//
//  DayCell.swift
//  123bay
//
//  Created by hai on 6/11/17.
//  Copyright © 2017 123bay. All rights reserved.
//

import UIKit
import JTAppleCalendar

//This cell shows days per each month

class DayCell: JTAppleCell {
    var dayLabel: UILabel = {
        let dayLabel = UILabel()
        
        dayLabel.textColor = Theme.shared.dayInMonthColor
        dayLabel.textAlignment = .center
        dayLabel.font = Theme.shared.largeSizeOfFont
        return dayLabel
    }()
    
    //Hom nay
    lazy var todayLabel: UILabel = {
        let todayLabel = UILabel()
        
        todayLabel.textAlignment = .center
        todayLabel.textColor = Theme.shared.todayColor
        todayLabel.text = "Hôm nay"
        todayLabel.isHidden = true
        todayLabel.font = Theme.shared.lessSizeOfFont
        return todayLabel
    }()
    
    //Ngay di
    lazy var startInLabel: UILabel = {
        let startInLabel = UILabel()
        
        startInLabel.textAlignment = .center
        startInLabel.text = "Bay đi"
        startInLabel.isHidden = true
        startInLabel.font = Theme.shared.lessSizeOfFont
        return startInLabel
    }()
    
    //Ngay den
    lazy var EndInLabel: UILabel = {
        let endInLabel = UILabel()
        
        endInLabel.textAlignment = .center
        endInLabel.text = "Bay về"
        endInLabel.isHidden = true
        endInLabel.font = Theme.shared.lessSizeOfFont
        return endInLabel
    }()
    
    //Selected day
    var dayView: UIView = {
        let dayView = UIView()
        
        dayView.backgroundColor = Theme.shared.showDaySelectedColor
        return dayView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupForDayView()
        setupForDayLabel()
        setupForTodayLabel()
        setupForStartInLabel()
        setupForEndInLabel()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    //Set text for day label
    func setTextForDay(text: String) {
        dayLabel.text = text
    }
    
    //Layout For days in month
    func setupForDayLabel() {
        self.addSubview(dayLabel)
        dayLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self)
            make.bottom.equalTo(self)
            make.left.equalTo(self)
            make.right.equalTo(self)
        }
    }
    
    //Layout for view bound label day
    func setupForDayView() {
        self.addSubview(dayView)
        dayView.snp.makeConstraints { (make) in
            make.top.equalTo(self)
            make.bottom.equalTo(self)
            make.left.equalTo(self)
            make.right.equalTo(self)
        }
    }
    
    //Layout for today label
    func setupForTodayLabel() {
        self.addSubview(todayLabel)
        todayLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self)
            make.centerX.equalTo(self)
            make.height.equalTo(20)
        }
    }
    
    //Layout for ngay di
    func setupForStartInLabel() {
        self.addSubview(startInLabel)
        startInLabel.snp.makeConstraints { (make) in
            make.bottom.equalTo(self)
            make.centerX.equalTo(self)
            make.height.equalTo(20)
        }
    }
    
    //Layout for ngay den
    func setupForEndInLabel() {
        self.addSubview(EndInLabel)
        EndInLabel.snp.makeConstraints { (make) in
            make.bottom.equalTo(self)
            make.centerX.equalTo(self)
            make.height.equalTo(20)
        }
    }
}
