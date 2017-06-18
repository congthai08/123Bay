//
//  ChooseFlight.swift
//  123bay
//
//  Created by Os on 6/6/17.
//  Copyright © 2017 123bay. All rights reserved.
//

import UIKit
import AMScrollingNavbar

class ChooseFlightController: ScrollingNavigationViewController {
    
    fileprivate let cellChooseFlightId = "cellChooseFlightId"
    fileprivate let headerChooseFlight = "headerChooseFlight"

    
    lazy private var searchBar = UISearchBar(frame: CGRect.zero)
    
    lazy var tableViewFlight: UITableView = {
        let tableView = UITableView()
        
        tableView.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        tableView.showsVerticalScrollIndicator = true
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorInset = UIEdgeInsets.zero
        tableView.register(ChooseFlightCell.self, forCellReuseIdentifier: "cellChooseFlightId")
        tableView.register(ChooseFlightHeader.self, forHeaderFooterViewReuseIdentifier: "headerChooseFlight")
        
        return tableView
    }()
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if let navigationController = self.navigationController as? ScrollingNavigationController {
            navigationController.followScrollView(tableViewFlight, delay: 50.0, followers: [tableViewFlight])
            navigationController.scrollingNavbarDelegate = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.frame = CGRect(x: 0, y: 0, width: view.frame.width * 0.7, height: 20)
        self.navigationItem.setHidesBackButton(true, animated: false)
        self.automaticallyAdjustsScrollViewInsets = false
        tableViewFlight.contentInset = .zero
        setupViewtableViewFlight()
        setupBarButtonItem()
    }
    
    func setupViewtableViewFlight() {
        view.addSubview(tableViewFlight)
        tableViewFlight.snp.makeConstraints { (make) in
            make.top.equalTo(self.topLayoutGuide.snp.bottom)
            make.height.equalToSuperview()
            make.left.equalToSuperview()
            make.right.equalToSuperview()
        }
    }
    
    private func setupBarButtonItem() {
        searchBar.placeholder = "Tìm thành phố hoặc sân bay"
        let leftNavBarButotn = UIBarButtonItem(customView: searchBar)
        self.navigationItem.leftBarButtonItem = leftNavBarButotn
        
        let closeButton = UIBarButtonItem(title: "Đóng", style: UIBarButtonItemStyle.plain, target: self, action: #selector(ChooseFlightController.actionClooseButton))
        self.navigationItem.rightBarButtonItem = closeButton
    }
    
    @objc func actionClooseButton() {
        CATransaction.begin()
        CATransaction.setDisableActions(true)
        
        let transition = CATransition()
        transition.duration = 0.5
        transition.type = kCATransitionFromLeft
        self.navigationController?.view.layer.add(transition, forKey: nil)
        _ = self.navigationController?.popViewController(animated: true)
        
        CATransaction.commit()
    }
}

extension ChooseFlightController: ScrollingNavigationControllerDelegate  {
    func scrollingNavigationController(_ controller: ScrollingNavigationController, willChangeState state: NavigationBarState) {
        view.needsUpdateConstraints()        
    }
}

extension ChooseFlightController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellChooseFlightId, for: indexPath) as? ChooseFlightCell else { return UITableViewCell() }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return view.frame.height / 10
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return view.frame.height / 12
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let headerCell = tableView.dequeueReusableHeaderFooterView(withIdentifier: headerChooseFlight) else { return UIView() }
        
        return headerCell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        actionClooseButton()
    }

}
