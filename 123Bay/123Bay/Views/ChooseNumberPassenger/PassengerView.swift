//
//  PassengerView.swift
//  123bay
//
//  Created by Os on 6/7/17.
//  Copyright © 2017 123bay. All rights reserved.
//

import UIKit

class PassengerView: BaseUIView {
    
    //MARK: Variable
    var chooseNumberPassengerControllerClassView: ChooseNumberPassengerController?
    
    fileprivate let cellTitleId = "cellTitleId"
    fileprivate let cellPickerId = "cellPickerId"
    
    //MARK: Create Object
    lazy private var collectionViewPassenger: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionviewConfig = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        collectionviewConfig.register(TitleChoosePassengerCell.self,
                                      forCellWithReuseIdentifier: "cellTitleId")
        
        collectionviewConfig.register(PickerChoosePassengerCell.self,
                                      forCellWithReuseIdentifier: "cellPickerId")
        
        collectionviewConfig.delegate = self
        collectionviewConfig.dataSource = self
        collectionviewConfig.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        collectionviewConfig.showsVerticalScrollIndicator = false
        collectionviewConfig.showsVerticalScrollIndicator = false
        collectionviewConfig.isScrollEnabled = false
        return collectionviewConfig
    }()
    
    //MARK: Initialize function
    override func setupView() {
        super.setupView()
        setupViewCollectionViewPassenger()
    }
    
    //MARK: SetupView function
    private func setupViewCollectionViewPassenger() {
        addSubview(collectionViewPassenger)
        collectionViewPassenger.snp.makeConstraints { (make) in
            make.width.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(1)
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
    
}

extension PassengerView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.item == 0 {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellTitleId, for: indexPath) as? TitleChoosePassengerCell else { return UICollectionViewCell() }
            
            return cell
        } else {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellPickerId, for: indexPath) as? PickerChoosePassengerCell else { return UICollectionViewCell() }
            
            cell.chooseNumberPassengerController = self.chooseNumberPassengerControllerClassView
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let WidthCell: CGFloat = self.frame.width
        if indexPath.item == 0 {
            let heightTitleCell: CGFloat = 0.22 * self.frame.height
            return CGSize(width: WidthCell, height: heightTitleCell)
        } else {
            let heightPickerCell: CGFloat = 0.78 * self.frame.height
            return CGSize(width: WidthCell, height: heightPickerCell)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
}
