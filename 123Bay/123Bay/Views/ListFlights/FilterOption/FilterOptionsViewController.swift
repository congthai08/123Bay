//
//  FilterOptionsViewController.swift
//  123bay
//
//  Created by Huỳnh Công Thái on 6/8/17.
//  Copyright © 2017 123bay. All rights reserved.
//

import UIKit

/*
 User can see filter options sceen
 */
class FilterOptionsViewController: BaseViewController {
    
    // MARK: Define variable
    static let filterOptionsCheckBoxCellId: String = "FilterOptionsTableViewCell"
    static let filterOptionsPriceRangeCellId: String = "FilterOptionsPriceRangeTableViewCell"
    
    fileprivate let dataList: [[Any]] = [["Bay thẳng", "1 điểm dừng", "trên 1 điểm dừng"], ["00:00 - 06:00", "06:00 - 12:00", "12:00 - 18:00", "18:00 - 00:00"], ["00:00 - 06:00", "06:00 - 12:00", "12:00 - 18:00", "18:00 - 00:00"], [#imageLiteral(resourceName: "logo_airline"), #imageLiteral(resourceName: "logo_airline"), #imageLiteral(resourceName: "logo_airline")], [""]]
    fileprivate let titleHeader: [String] = ["Điểm dừng", "Giờ khởi hành", "Giờ hạ cánh", "Hãng hàng không", "Khoảng giá"]
    
    // MARK: Define controls
    private lazy var contentTableView: UITableView = {
        let tableView: UITableView = UITableView(frame: .zero, style: .plain)
        
        tableView.register(
            FilterOptionsCheckBoxTableViewCell.self,
            forCellReuseIdentifier: filterOptionsCheckBoxCellId
        )
        tableView.register(
            FilterOptionsPriceRangeTableViewCell.self,
            forCellReuseIdentifier: filterOptionsPriceRangeCellId
        )
        tableView.delegate = self
        tableView.dataSource = self
        tableView.estimatedRowHeight = 100
        tableView.rowHeight = UITableViewAutomaticDimension
        
        return tableView
    }()
    
    // MARK: Setup layout
    private func setupNavigation() {
        let resetButton: UIBarButtonItem = UIBarButtonItem(
            image: #imageLiteral(resourceName: "icon_reset"),
            style: .done,
            target: self,
            action: #selector(FilterOptionsViewController.resetButtonPressed)
        )
        
        let backButton: UIBarButtonItem = UIBarButtonItem(
            image: #imageLiteral(resourceName: "icon_close"),
            style: .done,
            target: self,
            action: #selector(FilterOptionsViewController.backButtonPressed)
        )
        
        self.navigationItem.title = "Bộ lọc"
        self.navigationItem.leftBarButtonItem = backButton
        self.navigationItem.rightBarButtonItem = resetButton
        self.navigationController?.navigationBar
            .backgroundColor = Theme.mainColor
    }
    
    func setupContentTableView() {
        self.view.addSubview(self.contentTableView)
        contentTableView.snp.makeConstraints { (make) in
            make.left.right.bottom.equalToSuperview()
            make.top.equalTo(self.topLayoutGuide.snp.bottom)
        }
    }

    // MARK: Setup
    override func setup() {
        self.view.backgroundColor = Theme.mainColor
        self.setupNavigation()
        self.setupContentTableView()
    }
    
    
    @objc private func resetButtonPressed() {
        
    }
    
    @objc private func backButtonPressed() {
        self.dismiss(animated: true, completion: nil)
    }
}

// MARK: Extention
extension FilterOptionsViewController: UITableViewDelegate, UITableViewDataSource {
   
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.titleHeader.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataList[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == self.titleHeader.count - 1 {
            let cell = tableView.dequeueReusableCell(
                withIdentifier: FilterOptionsViewController.filterOptionsPriceRangeCellId,
                for: indexPath
                ) as! FilterOptionsPriceRangeTableViewCell
            cell.setValue(0, maxPrice: 2500000, setValue: 1000000)
            return cell
        }
        
        let cell = tableView.dequeueReusableCell(
            withIdentifier: FilterOptionsViewController.filterOptionsCheckBoxCellId,
            for: indexPath
            ) as! FilterOptionsCheckBoxTableViewCell
        
        cell.setValue(
            self.dataList[indexPath.section][indexPath.row] as? String,
            image: self.dataList[indexPath.section][indexPath.row] as? UIImage
        )
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return self.titleHeader[section]
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if indexPath.section == self.titleHeader.count - 1 {
            return UITableViewAutomaticDimension
        }
        
        return 50
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30
    }
}
