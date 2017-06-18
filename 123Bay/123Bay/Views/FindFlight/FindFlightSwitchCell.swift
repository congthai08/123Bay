//
//  FindFlightSwitchCell.swift
//  123bay
//
//  Created by Os on 5/27/17.
//  Copyright © 2017 123bay. All rights reserved.
//

import Foundation
import UIKit

class FindFlightSwitchCell: BaseFindFlightCell {
    
    //MARK: Create Variable
    weak var dateBack: DateTravel?
    var heightContraintCollectionViewDateBack: NSLayoutConstraint?
    
    var roundTicket: RoundTicket? {
        didSet {
            guard let m_roundTicket = roundTicket else { return }
            guard let m_dateBack = m_roundTicket.dateBack else { return }
            self.dateBack = m_dateBack
        }
    }
    
    var isObserving: Bool = false
    fileprivate let cellDateBackId = "cellDateBackId"
    var findFlight: FindFlightController?
    static let multiplierCollectionViewCell: CGFloat = 1 / 11
    let heightDefaulCell: CGFloat = (UIApplication.shared.keyWindow?.frame.height)! * multiplierCollectionViewCell
    
    //MARK: Create Object
    
    var switchTicket: UISwitch = {
        let switchT = UISwitch()
        
        switchT.isOn = false
        switchT.onTintColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
        return switchT
    }()
    
    lazy var tabelViewDateBack: UITableView = {
        let tableView = UITableView(frame: CGRect.zero, style: UITableViewStyle.plain)
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorColor = UIColor.clear
        tableView.register(FindFlightDateBackCell.self, forCellReuseIdentifier: "cellDateBackId")
        tableView.backgroundColor = UIColor.clear
        tableView.isScrollEnabled = false
        tableView.showsVerticalScrollIndicator = false
        tableView.showsHorizontalScrollIndicator = false
        return tableView
    }()
    
    //Initialize funtion
    override func setupview() {
        setupViewImageIcon()
        setupViewLabelTitle()
        setupViewSwitchTicket()
        setupViewCollectionViewDateBack()
        setupViewLineDevider()
        
        switchTicket.addTarget(self, action: #selector(FindFlightSwitchCell.buttonSwitch), for: UIControlEvents.allEvents)
    }
    
    //MARK: Setup view function
    override func setupViewImageIcon() {
        let topImageiCon: CGFloat = heightDefaulCell * 0.3
        let heightImageiCon: CGFloat = heightDefaulCell * 0.4
        addSubview(imageIcon)
        self.imageIcon.snp.makeConstraints({ (make) in
            make.height.equalTo(heightImageiCon)
            make.width.equalTo(self.imageIcon.snp.height)
            make.left.equalToSuperview().offset(20)
            make.top.equalTo(topImageiCon)
        })
    }
    
    func setupViewCollectionViewDateBack() {
        addSubview(tabelViewDateBack)
        self.tabelViewDateBack.snp.makeConstraints { (make) in
            make.width.equalToSuperview()
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        heightContraintCollectionViewDateBack = NSLayoutConstraint.init(item: tabelViewDateBack, attribute: NSLayoutAttribute.height, relatedBy: NSLayoutRelation.equal, toItem: self, attribute: NSLayoutAttribute.height, multiplier: 0, constant: heightDefaulCell)
        guard let const = heightContraintCollectionViewDateBack else {
            return
        }
        self.addConstraint(const)
    }
    
    override func setupViewLabelTitle() {
        let topLabelTitle: CGFloat = heightDefaulCell * 0.3
        let heightLabelTitle: CGFloat = heightDefaulCell * 0.4
        addSubview(labelTitle)
        labelTitle.snp.makeConstraints { (make) in
            make.width.equalToSuperview().multipliedBy(0.4)
            make.height.equalTo(heightLabelTitle)
            make.left.equalTo(self.imageIcon.snp.right).offset(10)
            make.top.equalTo(topLabelTitle)
        }
    }
    
    func setupViewSwitchTicket() {
        addSubview(switchTicket)
        switchTicket.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(10)
            make.right.equalToSuperview().offset(-30)
        }
        self.switchTicket.transform = CGAffineTransform(scaleX: 0.85, y: 0.85)
    }
    
    func buttonSwitch() {
        if switchTicket.isOn {
            findFlight?.switchOnAction()
        } else {
            findFlight?.switchOffAction()
        }
    }
    
    override func setupViewLineDevider() {
        addSubview(lineDevider)
        lineDevider.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
            make.height.equalTo(1)
            make.bottom.equalToSuperview().offset(-1)
        }
    }

    
    //MARK: Other function
    func checkHeight() {
        tabelViewDateBack.isHidden = (frame.size.height < heightDefaulCell + 10)
    }
    
    func igonreFrameChange() {
        if isObserving {
            removeObserver(self, forKeyPath: "frame")
            isObserving = false
        }
    }
    
    func watchFrameChanges() {
        if !isObserving {
            addObserver(self, forKeyPath: "frame", options: [NSKeyValueObservingOptions.new, NSKeyValueObservingOptions.initial], context: nil)
            isObserving = true;
        }
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "frame" {
            checkHeight()
        }
    }
    
}

//MARK: - Extention tableView dateback
extension FindFlightSwitchCell: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellDateBackId, for: indexPath) as! FindFlightDateBackCell
        cell.lineDevider.backgroundColor = UIColor.clear
        cell.selectionStyle = .none
        cell.dateTravel = dateBack
        cell.imageIcon.image = UIImage(named: "2-13")
        cell.labelTitle.text = "Ngày về"
        return cell
    }
}
