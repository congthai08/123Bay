//
//  YourFlightCell.swift
//  123bay
//
//  Created by MACOS on 6/15/17.
//  Copyright © 2017 123bay. All rights reserved.
//

import UIKit

protocol YourFlightCelldelegate: class {
    func presentInformationAssigmentController(_ viewController: UIViewController)
}

class YourFlightCell: BaseTableViewCell {
    //MARK: Variable
    fileprivate let numberCell = 4
    fileprivate let cellPlaceDetaiId = "cellPlaceDetaiId"
    fileprivate let cellDepartureInfoId = "cellDepartureInfoId"
    fileprivate let cellRefundMoneyId = "cellRefundMoneyId"
    
    //MARK: Create Object
    var delegate: YourFlightCelldelegate?
    
    lazy private var collectionViewInfoFlight: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        
        let collectionViewConfig = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        collectionViewConfig.backgroundColor = UIColor.clear
        collectionViewConfig.isScrollEnabled = false
        collectionViewConfig.showsVerticalScrollIndicator = false
        
        collectionViewConfig.register(PlaceDetailFlightCell.self,
                                      forCellWithReuseIdentifier: "cellPlaceDetaiId")
        
        collectionViewConfig.register(DepartureInfoCell.self,
                                      forCellWithReuseIdentifier: "cellDepartureInfoId")
        
        collectionViewConfig.register(RefundMoneyCell.self,
                                      forCellWithReuseIdentifier: "cellRefundMoneyId")
        
        
        collectionViewConfig.delegate = self
        collectionViewConfig.dataSource = self
        
        return collectionViewConfig
    }()
    
    override func setupview() {
        super.setupview()
        setupViewCollectionViewInfoFlight()
    }
    
    private func setupViewCollectionViewInfoFlight() {
        addSubview(collectionViewInfoFlight)
        collectionViewInfoFlight.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.width.equalToSuperview()
            make.height.equalToSuperview()
            make.centerX.equalToSuperview()
        }
    }
    
}

extension YourFlightCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return numberCell
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.item {
        case 0:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellPlaceDetaiId, for: indexPath) as? PlaceDetailFlightCell else
            { return UICollectionViewCell() }
            
            cell.delegate = self.delegate
            return cell
        case 3:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellRefundMoneyId, for: indexPath) as? RefundMoneyCell else
            { return UICollectionViewCell() }
            
            return cell
        default:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellDepartureInfoId, for: indexPath) as? DepartureInfoCell else
            { return UICollectionViewCell() }
            
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let widthSuperView = self.frame.width
        let heighSuperView = self.frame.height
        
        switch indexPath.item {
        case 1:
            return CGSize(width: widthSuperView, height: heighSuperView * 0.3)
        case 2:
            return CGSize(width: widthSuperView, height: heighSuperView * 0.3)
        default:
            return CGSize(width: widthSuperView, height: heighSuperView * 0.2)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.item == 0 {
            let informationAssigmentController = FlightInformationScreenController()
            delegate?.presentInformationAssigmentController(informationAssigmentController)
        }
    }
    
}







