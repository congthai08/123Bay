//
//  TransactionCell.swift
//  123bay
//
//  Created by MACOS on 6/17/17.
//  Copyright © 2017 123bay. All rights reserved.
//

import UIKit

class TransactionCell: BaseCollectionViewCell {
    //MARK: Create Object
    fileprivate let arraySubtitle = ["Tổng", "Phí dịch vụ", "Tổng cộng", "Tổng giá (đã bao gồm thuế/phí)"]
    fileprivate let dataContent = ["1.740.000 VNĐ", "110.000 VNĐ", "1.850.000 VNĐ", "3.854.000 VNĐ"]
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

    lazy private var collectionViewDetailInfomation: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collectionViewConfig = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        collectionViewConfig.isScrollEnabled = false
        collectionViewConfig.showsVerticalScrollIndicator = false
        collectionViewConfig.backgroundColor = Theme.shared.baseViewBackgroundColor
        collectionViewConfig.delegate = self
        collectionViewConfig.dataSource = self
        
        collectionViewConfig.register(DeatailTransactionCell.self,
                                      forCellWithReuseIdentifier: "cellId")
        
        return collectionViewConfig
    }()
    
    private var lineDeviderBottom: UIView = {
        let viewConfig = UIView()
        viewConfig.backgroundColor = Theme.shared.lineDeviderColor
        return viewConfig
    }()
    
    //MARK: Initialize function
    override func setupview() {
        super.setupview()
        setupViewLabelTitle()
        setupViewLineDevider()
        setupViewCollectionInfomation()
        setupViewlLineDeviderBottom()
    }
    
    //MARK: SetupView funtion
    private func setupViewLabelTitle() {
        addSubview(labelTitle)
        labelTitle.snp.makeConstraints { (make) in
            make.width.equalToSuperview().offset(Dimension.shared.pageLeftMarging)
            make.height.equalTo(20).multipliedBy(Dimension.shared.widthScale)
            make.top.equalToSuperview()
            make.left.equalTo(Dimension.shared.pageLeftMarging)
        }
    }
    
    func setupViewLineDevider() {
        self.addSubview(self.lineDevider)
        self.lineDevider.snp.makeConstraints { (make) in
            make.width.equalToSuperview().offset(-Dimension.shared.pageLeftMarging)
            make.height.equalTo(1)
            make.top.equalTo(self.labelTitle.snp.bottom).offset(10)
            make.centerX.equalToSuperview()
        }
    }
    
    private func setupViewCollectionInfomation() {
        self.addSubview(self.collectionViewDetailInfomation)
        collectionViewDetailInfomation.snp.makeConstraints { (make) in
            make.height.equalTo(self.frame.height - CGFloat(20 * Dimension.shared.widthScale) - CGFloat(30 + 1))
            make.top.equalTo(self.lineDevider.snp.bottom).offset(10)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().offset(-2 * Dimension.shared.pageLeftMarging)
        }
    }
    
    func setupViewlLineDeviderBottom() {
        self.addSubview(self.lineDeviderBottom)
        self.lineDeviderBottom.snp.makeConstraints { (make) in
            make.width.equalToSuperview().offset(-Dimension.shared.pageLeftMarging)
            make.height.equalTo(1)
            make.bottom.equalToSuperview()
            make.centerX.equalToSuperview()
        }
    }
    
    //MARK: Other function
    func setupTitleLabel(title string: String) {
        labelTitle.text = string.uppercased()
    }
}

extension TransactionCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arraySubtitle.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as? DeatailTransactionCell else { return UICollectionViewCell() }
        
        if indexPath.item == 3 {
            cell.setupBoldTitleLabel(title: arraySubtitle[indexPath.item])
            cell.setupHighlightContent(content: dataContent[indexPath.item])
        } else {
            cell.setupTitleLabel(title: arraySubtitle[indexPath.item])
            cell.setupContent(content: dataContent[indexPath.item])
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch indexPath.item {
        case 3:
            return CGSize(width: collectionView.frame.width, height: collectionView.frame.height * 0.31)
        default:
            return CGSize(width: collectionView.frame.width, height: collectionView.frame.height * 0.23)
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
}

