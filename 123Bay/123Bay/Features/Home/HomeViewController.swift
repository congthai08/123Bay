//
//  HomeViewController.swift
//  123bay
//
//  Created by Huỳnh Công Thái on 5/23/17.
//  Copyright © 2017 123bay. All rights reserved.
//

import UIKit
import SnapKit

/*
    This class display Main Menu and Slide image 
 */
class HomeViewController: UICollectionViewController {
    
    //MARK: Set cellId for collectionViewCell
    let cellIdHeaderCell = "cellIdHeaderCell"
    let cellIdBannerCell = "cellIdBannerCell"
    
    //MARK: Create Object
    var bottomMenuBar: BottomMenuBar = {
        var menu = BottomMenuBar()
        return menu
    }()
    
    lazy var menuSetting: SettingMenuController = {
        let menu = SettingMenuController()
        menu.delegate = self
        return menu
    }()
    
    //MARK: function will call when view appear
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let bar = self.navigationController?.navigationBar
        bar?.tintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        self.navigationController?.navigationBar
            .setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        
        self.navigationController?.navigationBar
            .shadowImage = UIImage()
        
        if let indexY = collectionView?.contentOffset.y {
            let alpha = indexY / CGFloat(121)
            self.navigationController?.navigationBar
                .backgroundColor = UIColor.rgbColor(red: 25, green: 160, blue: 288, alpha: alpha)
        } else {
            self.navigationController?.navigationBar
                .backgroundColor = UIColor.rgbColor(red: 25, green: 160, blue: 288, alpha: 0.0)
        }
    }
    
    //MARK: viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        addMenuBarItem()
        setupCollectionView()
        setupNavigationBar()
        setupviewBottomMenuBar()
    }
    
    //MARK: Setupview function
    func setupNavigationBar() {
        let bar = self.navigationController?.navigationBar
        bar?.tintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        self.navigationController?.navigationBar
            .setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        
        self.navigationController?.navigationBar
            .shadowImage = UIImage()
        
        self.navigationController?.navigationBar
            .backgroundColor = UIColor.rgbColor(red: 25, green: 160, blue: 288, alpha: 0.0)
    }
    
    func addMenuBarItem() {
        let imageMenuBar = UIImage(named: "2-1")
        let frameButton = CGRect(x: 8, y: 0, width: 20, height: 20)
        let menuBarButton = BarButtonItem(imgaes: imageMenuBar, frame: frameButton, target: self, action: #selector(HomeViewController.showMenuSettingController))
        navigationItem.rightBarButtonItem = menuBarButton
        
        let imageLogo = UIImage(named: "Logo")
        let frameLogo = CGRect(x: 5, y: 10, width: 100, height: 44)
        let menuBarLogo = BarButtonItem(imgaes: imageLogo, frame: frameLogo, target: nil, action: nil)
        menuBarLogo.tintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1).withAlphaComponent(1)
        navigationItem.leftBarButtonItem = menuBarLogo
        
    }
    
    func setupCollectionView() {
        self.automaticallyAdjustsScrollViewInsets = false
        collectionView?.showsVerticalScrollIndicator = false
        collectionView?.showsHorizontalScrollIndicator = false
        collectionView?.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        collectionView?.register(BannerCollectionViewCell.self, forCellWithReuseIdentifier: cellIdBannerCell)
        collectionView?.register(MainMenuCollectionViewCell.self,
                                 forSupplementaryViewOfKind: UICollectionElementKindSectionHeader,
                                 withReuseIdentifier: cellIdHeaderCell)
        
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
    
    func showMenuSettingController() {
        menuSetting.showMenuSetting()
    }
    
    func showMainMenu(index: Int) {
        if index == 0 {
            let findFlightController = FindFlightController()
            navigationController?.pushViewController(findFlightController, animated: true)
        } else if index == 1 {
            
        } else if index == 2 {
            
        } else {
            
        }
    }
    
    func showDetailMenuSetting(index: Int) {
        
    }
}
