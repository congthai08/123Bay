//
//  InfomationContactCell.swift
//  123bay
//
//  Created by MACOS on 6/15/17.
//  Copyright © 2017 123bay. All rights reserved.
//

import UIKit

class InfomationContactCell: BaseTableViewCell {
    //MARK: Variable
    fileprivate let numberItems = 4
    fileprivate let cellTextFieldInfoId = "cellTextFieldInfoCellId"
    fileprivate let cellBillVATId = "cellBillVATId"
    fileprivate let arrayPlaceholder = ["Họ và tên", "Số điện thoại", "Email"]
    
    //MARK: Create Object
    var bookingFlightController: BookingFlightController?
    
    lazy private var collectionViewContact: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collectionViewConfig = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        collectionViewConfig.backgroundColor = UIColor.clear
        collectionViewConfig.showsVerticalScrollIndicator = false
        collectionViewConfig.isScrollEnabled = false
        collectionViewConfig.register(TextFieldInfoCell.self,
                                      forCellWithReuseIdentifier: "cellTextFieldInfoCellId")
        
        collectionViewConfig.register(BillVATCell.self,
                                      forCellWithReuseIdentifier: "cellBillVATId")
        
        collectionViewConfig.delegate = self
        collectionViewConfig.dataSource = self
        return collectionViewConfig
    }()
    
    //MARK: Initialize funtion
    override func setupview() {
        super.setupview()
        setupViewCollectionViewContact()
    }
    
    //MARK: SetupView function
    private func setupViewCollectionViewContact() {
        addSubview(collectionViewContact)
        collectionViewContact.snp.makeConstraints { (make) in
            make.width.equalToSuperview()
            make.height.equalToSuperview()
            make.top.equalToSuperview()
            make.left.equalToSuperview()
        }
    }
}

extension InfomationContactCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return numberItems
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch indexPath.item {
        case 3:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellBillVATId, for: indexPath) as? BillVATCell else {
                return UICollectionViewCell()
            }
            
            cell.bookingFlightController = self.bookingFlightController
            return cell
        default:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellTextFieldInfoId, for: indexPath) as? TextFieldInfoCell else {
                return UICollectionViewCell()
            }
            
            cell.setPlaceHolderText(placeHolder: arrayPlaceholder[indexPath.item])
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.frame.width, height: self.frame.height / 4)
    }
    
}







