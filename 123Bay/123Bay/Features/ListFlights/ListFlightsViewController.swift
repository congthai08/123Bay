//
//  ListFlightsViewController.swift
//  123bay
//
//  Created by Huỳnh Công Thái on 5/30/17.
//  Copyright © 2017 123bay. All rights reserved.
//

import UIKit
import SnapKit

/*
    Users can see list of flights in screen
    Users can filter, arrange, change date
    Users can go to check in screen
*/

//This class is display list flights that be return by API
class ListFlightsViewController: BaseViewController {
    
    // MARK: Define variable
    
    // MARK: Define controls
    let stepImageView: UIImageView = {
        let imageView: UIImageView = UIImageView(image: UIImage(named: "1"))
        
        imageView.backgroundColor = Theme.defaultColor
        imageView.contentMode = .scaleAspectFit
        
        return imageView
    }()
    
    let informationFlightView: InformationSearchView = InformationSearchView()
    
    lazy var listFlightsTableView: UITableView = {
        let tableView: UITableView = UITableView(frame: CGRect.zero, style: .plain)
        
        tableView.estimatedRowHeight = 100
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.register(
            InformationFlightTableViewCell.self,
            forCellReuseIdentifier: "InformationFlightTableViewCell"
        )
        tableView.tableFooterView = UIView()
        tableView.backgroundColor = Theme.defaultColor
        tableView.delegate = self
        tableView.dataSource = self
        
        return tableView
    }()
    
    lazy var menuSetting: SettingMenuController = {
        let menu = SettingMenuController()
        menu.delegate = self
        return menu
    }()
    
    let optionsView: DisplayOptionsForListFlightsView = DisplayOptionsForListFlightsView()
    
    // MARK: Setup layout
    
    func setupStepImageView() {
        self.view.addSubview(self.stepImageView)
        
        self.stepImageView.snp.makeConstraints { (make) in
            make.left.right.equalToSuperview()
            make.top.equalTo(self.topLayoutGuide.snp.bottom)
        }
    }
    
    func setupInformationFlightView() {
        self.view.addSubview(self.informationFlightView)
        
        self.informationFlightView.snp.makeConstraints { (make) in
            make.left.right.equalTo(self.stepImageView)
            make.top.equalTo(self.stepImageView.snp.bottom)
        }
    }
    
    func setupOptionsView() {
        self.view.addSubview(self.optionsView)
        
        self.optionsView.snp.makeConstraints { (make) in
            make.left.right.equalTo(self.stepImageView)
            make.bottom.equalToSuperview()
            make.height.equalTo(44)
        }
        
        optionsView.delegate = self
    }
    
    func setuplistFlightsTableView() {
        self.view.addSubview(self.listFlightsTableView)
        
        self.listFlightsTableView.snp.makeConstraints { (make) in
            make.left.right.equalTo(self.stepImageView)
            make.top.equalTo(self.informationFlightView.snp.bottom).offset(Dimension.normalMargin)
            make.bottom.equalTo(self.optionsView.snp.top)
        }
    }
    
    override func setup() {
        self.view.backgroundColor = Theme.mainColor
        self.setupStepImageView()
        self.setupOptionsView()
        self.setupInformationFlightView()
        self.setuplistFlightsTableView()
        self.setupViewBackItem()
        self.addMenuBarItem()
    }
    
    func setupViewBackItem() {
        let imageBackItem = UIImage(named: "Back")
        let frameBackItem = CGRect(x: 0, y: 5, width: 15, height: 15)
        let backItem = BarButtonItem(imgaes: imageBackItem, frame: frameBackItem, target: self
            , action: #selector(ListFlightsViewController.backItemPressed))
        
        backItem.tintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1).withAlphaComponent(1)
        navigationItem.leftBarButtonItem = backItem
        
        let titleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: view.frame.width
            , height: view.frame.height))
        
        titleLabel.text = "Chọn chuyến bay"
        titleLabel.textColor = UIColor.white
        titleLabel.font = UIFont.systemFont(ofSize: 15)
        titleLabel.font = UIFont.boldSystemFont(ofSize: 15)
        navigationItem.titleView = titleLabel
        
    }
    
    func addMenuBarItem() {
        let imageMenuBar = UIImage(named: "2-1")
        let frameButton = CGRect(x: 8, y: 0, width: 20, height: 20)
        let menuBarButton = BarButtonItem(imgaes: imageMenuBar, frame: frameButton, target: self
            , action: #selector(ListFlightsViewController.showMenuSettingController))
        navigationItem.rightBarButtonItem = menuBarButton
    }
    
    //Function to show menuSettingController when user choose setting on NavigationBar
    func showMenuSettingController() {
        menuSetting.showMenuSetting()
    }
    
    func backItemPressed() {
        navigationController?.popViewController(animated: true)
    }

}

// MARK: Extention
// Extention ListFlightsViewController for config listFlightsTableView
extension ListFlightsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: "InformationFlightTableViewCell",
            for: indexPath
        ) as! InformationFlightTableViewCell
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let bookingFlightController = BookingFlightController()
        navigationController?.pushViewController(bookingFlightController, animated: true)
    }
}

// Extention ListFlightsViewController for present VC in child controls
extension ListFlightsViewController: DisplayOptionsForListFlightsDelegate {
    
    func viewControllerNeedPresentation(_ viewController: UIViewController) {
        self.present(viewController, animated: true, completion: nil)
    }
}

extension ListFlightsViewController: SettingMenuControllerDeledate {
    
    func presentDetailMenuSetting(_ viewController: UIViewController) {
        navigationController?.pushViewController(viewController, animated: true)
    }
    
}
