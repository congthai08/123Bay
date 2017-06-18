//
//  DetailInfomationPassengerCell.swift
//  123bay
//
//  Created by MACOS on 6/17/17.
//  Copyright © 2017 123bay. All rights reserved.
//

import UIKit
class DetailInfomationPassengerCell: BaseCollectionViewCell {
    //MARK: Varibale
    fileprivate let arraySubtitle = ["Họ và tên", "Ngày sinh", "Thông tin hành lí"]
    fileprivate let dataInfo = ["TRAN VAN A", "12/06/1994", "Không mang thêm"]
    fileprivate let cellId = "cellId"
    
    //MARK: Create Object
    private var labelTitle: UILabel = {
        let labelConfig = UILabel()
        
        labelConfig.text = "Chuyến bay đi"
        labelConfig.font = UIFont.systemFont(ofSize: Dimension.shared.mediumContentFontSize, weight: 0.3)
        labelConfig.textColor = Theme.shared.titleTextColor
        return labelConfig
    }()
    
    private var labelTypePassenger: UILabel = {
        let labelConfig = UILabel()
        
        labelConfig.text = "NGƯỜI LỚN"
        labelConfig.font = UIFont.systemFont(ofSize: Dimension.shared.mediumContentFontSize, weight: 0.2)
        let alpha = Dimension.smallAlpha
        labelConfig.textColor = Theme.shared.titleTextColor.withAlphaComponent(alpha)
        return labelConfig
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
        
        collectionViewConfig.register(NameDayOfBirthCell.self,
                                      forCellWithReuseIdentifier: "cellId")
        
        return collectionViewConfig
    }()
    
    private var lineDevider: UIView = {
        let viewConfig = UIView()
        viewConfig.backgroundColor = Theme.shared.lineDeviderColor
        return viewConfig
    }()
    
    private var lineTraightDevider: UIView = {
        let viewConfig = UIView()
        viewConfig.backgroundColor = Theme.shared.lineDeviderColor
        return viewConfig
    }()
    
    var labelOrdinalNumber: UILabel = {
        let labelConfig = UILabel()
        labelConfig.text = "1"
        labelConfig.font = UIFont.systemFont(ofSize: Dimension.shared.mediumContentFontSize, weight: 0.1)
        return labelConfig
    }()
    
    override func setupview() {
        super.setupview()
        setupViewLabelTitle()
        setupViewLabelTypePassenger()
        setupViewCollectionViewDetailInfo()
        setupViewLineDevider()
        setupViewLabelOrdinalNumber()
    }
    
    //MARK: SetupView funtion
    private func setupViewLabelTitle() {
        addSubview(labelTitle)
        labelTitle.snp.makeConstraints { (make) in
            make.width.equalToSuperview().offset(-Dimension.shared.pageLeftMarging)
            make.height.equalTo(25).multipliedBy(Dimension.shared.widthScale)
            make.top.equalToSuperview().offset(5)
            make.left.equalToSuperview().offset(Dimension.shared.pageLeftMarging)
        }
    }
    
    private func setupViewLabelTypePassenger() {
        addSubview(labelTypePassenger)
        labelTypePassenger.snp.makeConstraints { (make) in
            make.width.equalToSuperview().offset(Dimension.shared.pageLeftMarging)
            make.height.equalTo(25).multipliedBy(Dimension.shared.widthScale)
            make.top.equalTo(self.labelTitle.snp.bottom)
            make.left.equalToSuperview().offset(Dimension.shared.pageLeftMarging)
        }
    }
    
    private func setupViewCollectionViewDetailInfo() {
        addSubview(collectionViewDetailInfomation)
        collectionViewDetailInfomation.snp.makeConstraints { (make) in
            make.width.equalToSuperview().offset(-40.0)
            make.height.equalTo(self.frame.height - 61 * Dimension.shared.widthScale)
            make.top.equalTo(self.labelTypePassenger.snp.bottom)
            make.right.equalToSuperview()
        }
    }
    
    private func setupViewLineDevider() {
        self.addSubview(self.lineTraightDevider)
        lineTraightDevider.snp.makeConstraints { (make) in
            make.width.equalTo(1)
            make.height.equalTo(self.collectionViewDetailInfomation)
            make.right.equalTo(self.collectionViewDetailInfomation.snp.left).offset(-5)
            make.top.equalTo(self.collectionViewDetailInfomation.snp.top)
            
        }
    }
    
    private func setupViewLabelOrdinalNumber() {
        self.addSubview(self.labelOrdinalNumber)
        self.labelOrdinalNumber.snp.makeConstraints { (make) in
            make.width.equalTo(15)
            make.height.equalTo(15)
            make.centerY.equalTo(self.collectionViewDetailInfomation.snp.centerY)
            make.left.equalToSuperview().offset(Dimension.shared.pageLeftMarging)
        }
    }
    
    func setupViewLabelLineDevider() {
        self.addSubview(self.lineDevider)
        self.lineDevider.snp.makeConstraints { (make) in
            make.width.equalToSuperview()
            make.height.equalTo(1)
            make.bottom.equalTo(self.lineTraightDevider.snp.bottom)
            make.centerX.equalToSuperview()
        }
    }
    
    //MARK: Other function
    func setupTitleLabel(title string: String) {
        labelTitle.text = string
    }
    
}

extension DetailInfomationPassengerCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as? NameDayOfBirthCell else { return UICollectionViewCell() }
        
        cell.setupTitleLabel(title: arraySubtitle[indexPath.item])
        cell.setupContent(content: dataInfo[indexPath.item])
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height / 3)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
}
