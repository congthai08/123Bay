//
//  BillVATController.swift
//  123bay
//
//  Created by MACOS on 6/17/17.
//  Copyright © 2017 123bay. All rights reserved.
//

import UIKit

class BillVATController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    private let cellId = "cellId"
    private let arrayPlaceHolderTitle = ["Tên công ty", "Địa chỉ công ty", "Mã số thuế", "Họ tên người nhận", "Địa chỉ liên hệ", "Số điện thoại"]
    
    private var buttonDone: UIButton = {
        let buttonConfig = UIButton()
        
        buttonConfig.setTitle("Hoàn thành", for: .normal)
        buttonConfig.titleLabel?.font = UIFont.systemFont(ofSize: Dimension.shared.largeButtonFontSize)
        buttonConfig.backgroundColor = Theme.shared.yellowButtonColor
        buttonConfig.layer.cornerRadius = Dimension.shared.cornerRadius
        buttonConfig.layer.masksToBounds = true
        return buttonConfig
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        setupViewCollectionView()
        setupViewButtonDone()
        
        buttonDone.addTarget(self, action: #selector(BillVATController.backtoBokkingFLight), for: .touchUpInside)
    }
    
    private func setupViewCollectionView() {
        collectionView?.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        collectionView?.isScrollEnabled = false
        collectionView?.showsVerticalScrollIndicator = false
        collectionView?.register(TextFieldInfoCell.self, forCellWithReuseIdentifier: cellId)
        collectionView?.delegate = self
        collectionView?.dataSource = self
    }
    
    private func setupViewButtonDone() {
        view.addSubview(buttonDone)
        buttonDone.snp.makeConstraints { (make) in
            make.width.equalToSuperview().multipliedBy(0.8)
            make.height.equalToSuperview().multipliedBy(0.08)
            make.bottom.equalToSuperview().offset(-2 * Dimension.shared.bottomMargin)
            make.centerX.equalToSuperview()
        }
    }
    
    func backtoBokkingFLight() {
        navigationController?.popViewController(animated: true)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrayPlaceHolderTitle.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as? TextFieldInfoCell else { return UICollectionViewCell()}
        
        
        cell.setPlaceHolderText(placeHolder: arrayPlaceHolderTitle[indexPath.item])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height * 1 / 12)
    }
}

