//
//  BookingFlightController.swift
//  123bay
//
//  Created by MACOS on 6/15/17.
//  Copyright © 2017 123bay. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

class BookingFlightController: UIViewController {
    
    //MARK: Variable
    fileprivate let arrayTitle = ["1. Hành khách người lớn", "2. Hành khách trẻ em", "3. Hành khách em bé"]
    fileprivate let numberSectionTableViewInfomation: Int = 4
    fileprivate let numberRowInfomationPassengerSection: Int = 3
    fileprivate let headerId = "headerId"
    fileprivate let yourFlightCellId = "yourFlightCellId"
    fileprivate let infomationContactCellId = "infomationContactCellId"
    fileprivate let infomationPassengerCellId = "infomationPassengerCellId"
    fileprivate let totalMoneyCellId = "totalMoneyCellId"
    
    fileprivate let arrayTitleBookingFlight: [TitleBookingFlight] = [TitleBookingFlight.init(imageName: "5-0", title: "CHUYẾN BAY CỦA BẠN"), TitleBookingFlight.init(imageName: "5-2", title: "THÔNG TIN LIÊN HỆ"), TitleBookingFlight.init(imageName: "5-3", title: "THÔNG TIN HÀNH KHÁCH")]
    
    //MARK: Create Object
    lazy var menuSetting: SettingMenuController = {
        let menu = SettingMenuController()
        menu.delegate = self
        return menu
    }()
    
    private var imageBookingStep: UIImageView = {
        let imageConfig = UIImageView()
        imageConfig.contentMode = .scaleAspectFit
        imageConfig.image = UIImage(named: "BookingStep")
        imageConfig.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        return imageConfig
    }()
    
    private var labelTitle: UILabel = {
        let labelConfig = UILabel()
        
        labelConfig.text = "     Điền thông tin"
        labelConfig.textAlignment = .left
        labelConfig.font = UIFont.boldSystemFont(ofSize: Dimension.shared.subTitleFontSize)
        labelConfig.textColor = Theme.shared.blueTextColor
        labelConfig.backgroundColor = Theme.shared.darkBackgroundColor
        return labelConfig
    }()
    
    lazy private var tableViewInfomation: UITableView = {
        let tabelViewConfig = UITableView(frame: .zero, style: .plain)
        
        tabelViewConfig.backgroundColor = Theme.shared.baseViewBackgroundColor
        tabelViewConfig.showsVerticalScrollIndicator = true
        tabelViewConfig.separatorColor = UIColor.clear
        
        tabelViewConfig.delegate = self
        tabelViewConfig.dataSource = self
        
        tabelViewConfig.register(BookFlightHeaderView.self,
                                 forHeaderFooterViewReuseIdentifier: "headerId")
        
        tabelViewConfig.register(YourFlightCell.self,
                                 forCellReuseIdentifier: "yourFlightCellId")
        
        tabelViewConfig.register( InfomationContactCell.self,
                                  forCellReuseIdentifier: "infomationContactCellId")
        
        tabelViewConfig.register(InfomationPassengerCell.self,
                                 forCellReuseIdentifier: "infomationPassengerCellId")
        
        tabelViewConfig.register(TotalMoneyCell.self,
                                 forCellReuseIdentifier: "totalMoneyCellId")
        
        return tabelViewConfig
    }()
    
    private var billVATController: BillVATController = {
        let layout = UICollectionViewFlowLayout()
        let billVAT = BillVATController(collectionViewLayout: layout)
        
        return billVAT
    }()
    
    private var paymentController: PaymentController = {
        let payment = PaymentController()
        
        return payment
    }()
    
    //MARK: Viewdidload
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewBaseView()
        setupViewNavigantionBar()
        setupViewImageBookingStep()
        setupViewLabelTitle()
        setupViewTableViewInfomation()
        setupViewBackItem()
        addMenuBarItem()
    }
    
    func addMenuBarItem() {
        let imageMenuBar = UIImage(named: "2-1")
        let frameButton = CGRect(x: 8, y: 0, width: 20, height: 20)
        let menuBarButton = BarButtonItem(imgaes: imageMenuBar, frame: frameButton, target: self
            , action: #selector(BookingFlightController.showMenuSettingController))
        navigationItem.rightBarButtonItem = menuBarButton
    }
    
    //Function to show menuSettingController when user choose setting on NavigationBar
    func showMenuSettingController() {
        menuSetting.showMenuSetting()
    }

    func setupViewBackItem() {
        let imageBackItem = UIImage(named: "Back")
        let frameBackItem = CGRect(x: 0, y: 5, width: 15, height: 15)
        let backItem = BarButtonItem(
            imgaes: imageBackItem,
            frame: frameBackItem,
            target: self,
            action: #selector(BookingFlightController.backItemPressed)
        )
        
        backItem.tintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1).withAlphaComponent(1)
        navigationItem.leftBarButtonItem = backItem
        
        let titleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: view.frame.width
            , height: view.frame.height))
        
        titleLabel.text = " Đặt chỗ"
        titleLabel.textColor = UIColor.white
        titleLabel.font = UIFont.systemFont(ofSize: 15)
        titleLabel.font = UIFont.boldSystemFont(ofSize: 15)
        navigationItem.titleView = titleLabel
    }
    
    func backItemPressed() {
        navigationController?.popViewController(animated: true)
    }
    
    private func setupViewBaseView() {
        view.backgroundColor = Theme.shared.baseViewBackgroundColor
    }
    
    private func setupViewNavigantionBar() {
        navigationController?.navigationBar.barTintColor = Theme.shared.navigationBarTintColor
    }
    
    private func setupViewImageBookingStep() {
        view.addSubview(imageBookingStep)
        imageBookingStep.snp.makeConstraints { (make) in
            make.width.equalToSuperview()
            make.top.equalTo(self.topLayoutGuide.snp.bottom).offset(10)
            make.height.equalTo(42).multipliedBy(Dimension.shared.widthScale)
            make.centerX.equalToSuperview()
        }
    }
    
    private func setupViewLabelTitle() {
        view.addSubview(labelTitle)
        labelTitle.snp.makeConstraints { (make) in
            make.width.equalToSuperview()
            make.height.equalTo(40)
            make.top.equalTo(self.imageBookingStep.snp.bottom).offset(10)
            make.centerX.equalToSuperview()
        }
    }
    
    private func setupViewTableViewInfomation() {
        view.addSubview(tableViewInfomation)
        tableViewInfomation.snp.makeConstraints { (make) in
            make.top.equalTo(self.labelTitle.snp.bottom).offset(10)
            make.bottom.equalToSuperview()
            make.width.equalToSuperview()
            make.centerX.equalToSuperview()
        }
    }
    
    func showBillVATCONtroller() {
        navigationController?.pushViewController(billVATController, animated: true)
    }
    
    func showpaymentController() {
        navigationController?.pushViewController(paymentController, animated: true)
    }
}

extension BookingFlightController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return numberSectionTableViewInfomation
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 2 {
            return numberRowInfomationPassengerSection
        }
        return 1
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let headerCell = tableView.dequeueReusableHeaderFooterView(withIdentifier: headerId) else { return UIView() }
        
        return headerCell
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        guard let viewHeader = view as? BookFlightHeaderView else { return }
        
        viewHeader.title = arrayTitleBookingFlight[section]
        viewHeader.tintColor = Theme.shared.navigationBarTintColor
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: yourFlightCellId, for: indexPath) as? YourFlightCell else { return UITableViewCell() }
            
            cell.selectionStyle = .none
            return cell
        case 1:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: infomationContactCellId, for: indexPath) as? InfomationContactCell else { return UITableViewCell() }
            
            cell.bookingFlightController = self
            cell.selectionStyle = .none
            return cell
        case 2:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: infomationPassengerCellId, for: indexPath) as? InfomationPassengerCell else { return UITableViewCell() }
            
            cell.selectionStyle = .none
            
            cell.title = arrayTitle[indexPath.item]
            return cell
        case 3:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: totalMoneyCellId, for: indexPath) as? TotalMoneyCell else { return UITableViewCell() }
            
            cell.bookingController = self
            cell.selectionStyle = .none
            return cell
        default:
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return Dimension.shared.heightScreen * 1 / 3
        case 1:
            return Dimension.shared.heightScreen * 1 / 3
        case 2:
            let heightRow = Dimension.shared.heightScreen * 1 / 12
            return heightRow
        case 3:
            return Dimension.shared.heightScreen * 1 / 3
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 3 {
            return 0
        }
        return 40
    }
}

extension BookingFlightController: SettingMenuControllerDeledate {
    
    func presentDetailMenuSetting(_ viewController: UIViewController) {
        navigationController?.pushViewController(viewController, animated: true)
    }
}
