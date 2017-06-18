//
//  ChangeDateOptionsView.swift
//  123bay
//
//  Created by Huỳnh Công Thái on 6/17/17.
//  Copyright © 2017 123bay. All rights reserved.
//

import UIKit
import SnapKit

/*
    User can see list date for change
 */
class ChangeDateOptionsView: BaseUIView {
    
    // MARK: Define variable
    static let changeDateOptionsCellId: String = "ChangeDateOptionsCollectionViewCell"
    
    // MARK: Define controls
    private let dateLabel: UILabel = {
        let label = UILabel()
        
        label.textAlignment = .right
        label.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        
        return label
    }()
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        
        layout.scrollDirection = .horizontal
        collectionView.backgroundColor = Theme.defaultColor
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.register(ChangeDateOptionsCollectionViewCell.self, forCellWithReuseIdentifier: changeDateOptionsCellId)
        collectionView.delegate = self
        collectionView.dataSource = self
        
        return collectionView
    }()
    
    private let doneButton: UIButton = {
        let button: UIButton = UIButton()
        
        button.backgroundColor = Theme.shared.backgroundButtonColor
        button.setTitle("ĐÓNG", for: .normal)
        button.layer.cornerRadius = 5
        
        return button
    }()
    
    // MARK: Setup layout
    private func setupDateLabel() {
        self.addSubview(self.dateLabel)
        
        self.dateLabel.snp.makeConstraints { (make) in
            make.top.left.equalToSuperview().offset(Dimension.normalMargin)
            make.right.equalToSuperview().offset(Dimension.normalMarginInverse)
        }
    }
    
    private func setupCollectionView() {
        self.addSubview(self.collectionView)
        
        self.collectionView.snp.makeConstraints { (make) in
            make.top.equalTo(self.dateLabel.snp.bottom).offset(Dimension.smallMargin)
            make.left.right.equalTo(self.dateLabel)
            make.bottom.equalTo(self.doneButton.snp.top).offset(Dimension.smallMarginInverse)
        }
    }
    
    private func setupDoneButton() {
        self.addSubview(self.doneButton)
        
        self.doneButton.snp.makeConstraints { (make) in
            make.left.right.equalTo(self.dateLabel)
            make.bottom.equalToSuperview().offset(Dimension.normalMarginInverse)
            make.height.equalTo(Dimension.shared.subTitleFontSize * 3)
        }
    }
    
    // MARK: Setup
    override func setupView() {
        self.backgroundColor = Theme.defaultColor
        setupDateLabel()
        setupDoneButton()
        setupCollectionView()
        setValue()
    }
    
    func setValue() {
        self.dateLabel.attributedText = self.dateLabel.setDateStyle("Ngày về: ", content: "Thứ 7. Ngày 17/06/2017")
    }
    
    func addTargetForDoneButton(_ target: Any?, selector: Selector) {
        self.doneButton.addTarget(target, action: selector, for: .touchUpInside)
    }
}

// MARK: Extention
extension ChangeDateOptionsView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: ChangeDateOptionsView.changeDateOptionsCellId,
            for: indexPath
        ) as! ChangeDateOptionsCollectionViewCell
        
        cell.setValue("Thứ năm\n17/06/2017", price: 2000000)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width / 3, height: collectionView.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return CGFloat(Dimension.smallMargin / 2)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}







