//
//  InfomationPassengerCell.swift
//  123bay
//
//  Created by MACOS on 6/15/17.
//  Copyright © 2017 123bay. All rights reserved.
//

import UIKit

protocol InfomationPassengerCellDelegate: class {
    func presentInfomationPassengerController(_ viewController: UIViewController)
}

class InfomationPassengerCell: BaseTableViewCell {
    //MARK: Varibale
    var title: String = ""
    
    fileprivate let cellNamePassengerId = "cellNamePassengerId"
    fileprivate let cellLuggageId = "cellLuggageId"
    fileprivate var numberRowOfCollectionView: Int = 1
    
    //MARK: Create Object
    var delegate: InfomationPassengerCellDelegate?
    
    lazy private var collectionViewInfo: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collectionViewConfig = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        collectionViewConfig.backgroundColor = UIColor.clear
        collectionViewConfig.showsVerticalScrollIndicator = false
        collectionViewConfig.isScrollEnabled = false
        collectionViewConfig.delegate = self
        collectionViewConfig.dataSource = self
        
        collectionViewConfig.register(NamePassengerCell.self,
                                      forCellWithReuseIdentifier: "cellNamePassengerId")
        
        collectionViewConfig.register(LuggagePassengerCell.self,
                                      forCellWithReuseIdentifier: "cellLuggageId")
        
        return collectionViewConfig
        
    }()
    
    //MARK: Initialize function
    override func setupview() {
        super.setupview()
        setupViewCollectionViewInfo()
    }
    
    //MARK: SetupView function
    private func setupViewCollectionViewInfo() {
        addSubview(collectionViewInfo)
        collectionViewInfo.snp.makeConstraints { (make) in
            make.width.equalToSuperview()
            make.height.equalToSuperview()
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
        }
    }
    
    //MARK: Other function
    func setupTitle(title: String) {
        self.title = title
        collectionViewInfo.reloadData()
    }
    
    func reloadNumberRowOfCollectionView(number: Int) {
        numberRowOfCollectionView = number
        collectionViewInfo.reloadData()
    }
}

extension InfomationPassengerCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return numberRowOfCollectionView
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellNamePassengerId, for: indexPath) as? NamePassengerCell else {
            return UICollectionViewCell()
        }
        
        cell.setupTitle(title: title)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.frame.width, height: self.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let guestInformationScreenController = GuestInformationScreenController()
        delegate?.presentInfomationPassengerController(guestInformationScreenController)
    }
    
}






