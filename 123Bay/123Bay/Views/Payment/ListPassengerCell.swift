//
//  ListPassengerCell.swift
//  123bay
//
//  Created by MACOS on 6/17/17.
//  Copyright © 2017 123bay. All rights reserved.
//

import UIKit

class ListPassengerCell: BaseCollectionViewCell {
    
    //MARK: Varibale
    fileprivate let arrayTitle = ["Chuyến bay đi", "Chuyến bay về"]
    fileprivate let cellId = "cellId"
    
    //MARK: Create Object
    private var labelTitle: UILabel = {
        let labelConfig = UILabel()
        
        labelConfig.text = "DANH SÁCH KHÁCH HÀNG"
        labelConfig.textColor = Theme.shared.blueTextColor
        labelConfig.font = UIFont.systemFont(ofSize: Dimension.shared.titleFontSize, weight: 0.3)
        
        return labelConfig
    }()
    
    private var lineDevider: UIView = {
        let viewConfig = UIView()
        viewConfig.backgroundColor = Theme.shared.lineDeviderColor
        return viewConfig
    }()
    
    lazy private var collectionViewInfomation: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collectionViewConfig = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        collectionViewConfig.backgroundColor = Theme.shared.baseViewBackgroundColor
        collectionViewConfig.delegate = self
        collectionViewConfig.dataSource = self
        
        collectionViewConfig.register(DetailInfomationPassengerCell.self,
                                      forCellWithReuseIdentifier: "cellId")
        
        return collectionViewConfig
    }()
    
    
    //MARK: Initialize funtion
    override func setupview() {
        super.setupview()
        setupViewLabelTitle()
        setupViewCollectionViewInfo()
        setupViewLineDevider()
    }
    
    //MARK: SetupView function
    private func setupViewLabelTitle() {
        addSubview(labelTitle)
        labelTitle.snp.makeConstraints { (make) in
            make.width.equalToSuperview()
            make.height.equalTo(20).multipliedBy(Dimension.shared.widthScale)
            make.top.equalToSuperview()
            make.left.equalToSuperview().offset(Dimension.shared.pageLeftMarging)
        }
    }
    
    private func setupViewLineDevider() {
        addSubview(lineDevider)
        lineDevider.snp.makeConstraints { (make) in
            make.width.equalToSuperview()
            make.height.equalTo(1)
            make.bottom.equalToSuperview()
            make.centerX.equalToSuperview()
        }
    }
    
    private func setupViewCollectionViewInfo() {
        addSubview(collectionViewInfomation)
        collectionViewInfomation.snp.makeConstraints { (make) in
            make.width.equalToSuperview()
            make.top.equalTo(self.labelTitle.snp.bottom)
            make.bottom.equalToSuperview().offset(-1)
            make.centerX.equalToSuperview()
        }
    }
    
    //MARK: Other function
    func setupTitleLabel(title string: String) {
        labelTitle.text = string.uppercased()
    }
}

extension ListPassengerCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as? DetailInfomationPassengerCell else { return UICollectionViewCell() }
        
        if indexPath.item == 0 {
            cell.setupViewLabelLineDevider()
        }
        
        cell.setupTitleLabel(title: arrayTitle[indexPath.item])
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.frame.width, height: collectionView.frame.height / 2)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
