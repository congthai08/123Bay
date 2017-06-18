//
//  FindFlightController.swift
//  123bay
//
//  Created by Os on 5/26/17.
//  Copyright © 2017 123bay. All rights reserved.
//

import UIKit

/*
 This class alows user choose infomation of ticket.
 User can go to another screen to choose:
 - Departure, Destination, Date leave, an optional Date Comeback
 - Number of passenger and Type class
 */


class FindFlightController: UIViewController {
    
    var switchIndexPath: IndexPath?
    var isSwitchOn: Bool = false
    
    //MARK: Variable
    let cellFindFlightTextId = "cellFindFlightTextId"
    let cellFindFlightPersonId = "cellFindFlightPersonId"
    let cellFindFlightSwitchId = "cellFindFlightSwitchId"
    let cellFindFlightDateId = "cellFindFlightDateId"
    
    let multipierCollectinViewCell: CGFloat = 1 / 11
    var arrayTitle = ["Điểm khởi hành", "Điểm đến", "Ngày đi", "Chọn khứ hồi", "Số hành khách", "Hạng ghế"]
    var arrayNameIcon = ["2-9", "2-10", "2-11", "2-12", "2-14", "2-15"]
    
    //MARK: Create Object
    var userInfoTicket = UserInfoTicket()
    
    var bottomMenuBar: BottomMenuBar = {
        var menu = BottomMenuBar()
        
        return menu
    }()
    
    var typeClassController: TypeClassController = {
        let typeClass = TypeClassController()
        
        return typeClass
    }()
    
    lazy var tableViewMenu: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        tableView.showsVerticalScrollIndicator = false
        tableView.showsHorizontalScrollIndicator = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.isScrollEnabled = false
        tableView.separatorColor = UIColor.clear
        
        tableView.register(FindFlightTextCell.self, forCellReuseIdentifier:
            "cellFindFlightTextId")
        
        tableView.register(FindFlightDateCell.self, forCellReuseIdentifier:
            "cellFindFlightDateId")
        
        tableView.register(FindFlightPersonCell.self, forCellReuseIdentifier:
            "cellFindFlightPersonId")
        
        tableView.register(FindFlightSwitchCell.self, forCellReuseIdentifier:
            "cellFindFlightSwitchId")
        
        return tableView
    }()
    
    var buttonFindFlight: UIButton = {
        let button = UIButton()
        
        button.backgroundColor = UIColor.rgbColor(red: 247, green: 109, blue: 1
            , alpha: 1)
        
        button.setTitle("TÌM CHUYẾN BAY", for: UIControlState.normal)
        return button
    }()
    
    lazy var menuSetting: SettingMenuController = {
        let menu = SettingMenuController()
        menu.findFlightController = self
        return menu
    }()
    
    let chooseNumberPassenger: ChooseNumberPassengerController = {
        let passengerController = ChooseNumberPassengerController()
        
        return passengerController
    }()
    
    //MARK: viewDidload
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewTableView()
        setupViewnavigationBar()
        setupviewBottomMenuBar()
        addMenuBarItem()
        setupViewFindFlightButton()
        setupViewBackItem()
    }
    
    //MARK: Setup View function
    func setupViewTableView() {
        view.addSubview(tableViewMenu)
        self.tableViewMenu.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.width.equalToSuperview()
            make.height.equalToSuperview()
            make.centerY.equalToSuperview()
        }
    }
    
    func buttonFindFlightPressed() {
        let listFlightsViewController = ListFlightsViewController()
        self.navigationController?.pushViewController(listFlightsViewController, animated: true)
    }
    
    func setupViewBackItem() {
        let imageBackItem = UIImage(named: "Back")
        let frameBackItem = CGRect(x: 0, y: 5, width: 15, height: 15)
        let backItem = BarButtonItem(imgaes: imageBackItem, frame: frameBackItem, target: self
            , action: #selector(FindFlightController.backToHomeController))
        
        backItem.tintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1).withAlphaComponent(1)
        navigationItem.leftBarButtonItem = backItem
        
        let titleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: view.frame.width
            , height: view.frame.height))
        
        titleLabel.text = "Tìm chuyến bay"
        titleLabel.textColor = UIColor.white
        titleLabel.font = UIFont.systemFont(ofSize: 15)
        titleLabel.font = UIFont.boldSystemFont(ofSize: 15)
        navigationItem.titleView = titleLabel
        
    }
    
    func setupViewnavigationBar() {
        navigationController?.navigationBar.backgroundColor = UIColor.rgbColor(red: 25
            , green: 160, blue: 288, alpha: 1)
    }
    
    func setupviewBottomMenuBar() {
        view.addSubview(bottomMenuBar)
        bottomMenuBar.snp.makeConstraints { (make) in
            make.width.equalToSuperview()
            make.height.equalTo(50)
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
    
    func setupViewFindFlightButton() {
        buttonFindFlight.layer.cornerRadius = 5
        buttonFindFlight.layer.masksToBounds = true
        view.addSubview(buttonFindFlight)
        buttonFindFlight.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.85)
            make.height.equalToSuperview().dividedBy(15)
            make.bottom.equalTo(self.bottomMenuBar.snp.top).offset(-20)
        }
        
        buttonFindFlight.addTarget(
            self,
            action: #selector(FindFlightController.buttonFindFlightPressed),
            for: .touchUpInside
        )
    }
    
    func addMenuBarItem() {
        let imageMenuBar = UIImage(named: "2-1")
        let frameButton = CGRect(x: 8, y: 0, width: 20, height: 20)
        let menuBarButton = BarButtonItem(imgaes: imageMenuBar, frame: frameButton, target: self
            , action: #selector(FindFlightController.showMenuSettingController))
        navigationItem.rightBarButtonItem = menuBarButton
    }
    
    //MARK: Other function
    
    //Function to show menuSettingController when user choose setting on NavigationBar
    func showMenuSettingController() {
        menuSetting.showMenuSetting()
    }
    
    //Function to show Deatail menu setting when user choose one cell of collectionview
    func showDetailMenuSetting(index: Int) {
        
    }
    
    //Function to back to Homecontroller
    func backToHomeController() {
        navigationController?.popViewController(animated: true)
    }
    
    //Function will be called whe user choose one of cell of TableViewMenu
    //and it will show the Detail Menu Screen to choose info for user ticket
    func showDetailFindFlightController(index: Int) {
        switch index {
        case 0:
            let chooseAirportDeparture = ChooseFlightController()
            navigationController?.pushViewController(chooseAirportDeparture, animated: true)
            break
        case 1:
            let chooseAirportArriive = ChooseFlightController()
            navigationController?.pushViewController(chooseAirportArriive, animated: true)
            break
        case 4:
            chooseNumberPassenger.show()
            break
        case 5:
            var indexType: String = ""
            if let type = userInfoTicket.typeClass {
                indexType = type
            }
            self.typeClassController.show(value: indexType)
            print(indexType)
            break
        default:
            break
        }
    }
    
    //Function will be called when Switch is on
    func switchOnAction() {
        switchIndexPath = IndexPath(item: 3, section: 0)
        isSwitchOn = true
        tableViewMenu.reloadRows(at: [switchIndexPath!], with: UITableViewRowAnimation.automatic)
    }
    
    //Function will be called when Switch is off
    func switchOffAction() {
        switchIndexPath = IndexPath(item: 3, section: 0)
        isSwitchOn = false
        
        tableViewMenu.reloadRows(at: [switchIndexPath!], with: UITableViewRowAnimation.automatic)
    }
    
    func setTypeClassForUserTicketInfo(index: Int) {
        userInfoTicket.setTypeClass(index: index)
    }
}
