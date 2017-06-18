//
//  MenuBarBank.swift
//  123bay
//
//  Created by MACOS on 6/17/17.
//  Copyright © 2017 123bay. All rights reserved.
//

import UIKit

class MenuBarBank: BaseUIView {
    
    //MARK: Variable
    fileprivate let cellId = "cellId"
    fileprivate let arrayNameImage = ["tpbank", "vietinbank"]
    var leftContraintScrollMenu: NSLayoutConstraint?
    
    //MARK: Create Object
    lazy private var collectionViewMenu: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionViewConfig = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        collectionViewConfig.delegate = self
        collectionViewConfig.dataSource = self
        collectionViewConfig.showsVerticalScrollIndicator = false
        collectionViewConfig.backgroundColor = Theme.shared.baseViewBackgroundColor
        collectionViewConfig.register(MenuBarBankCell.self, forCellWithReuseIdentifier: "cellId")
        
        return collectionViewConfig
    }()
    
    private var lineDevider: UIView = {
        let viewConfig = UIView()
        viewConfig.backgroundColor = Theme.shared.lineDeviderColor
        return viewConfig
    }()
    
    private var scrollMenuView: UIView = {
        let viewConfig = UIView()
        viewConfig.backgroundColor = Theme.shared.navigationBarTintColor
        viewConfig.translatesAutoresizingMaskIntoConstraints = false
        return viewConfig
    }()
    
    //MARK: Initialize function
    override func setupView() {
        super.setupView()
        setupViewCollectionView()
        setupViewScrollMenuView()
        setupViewLineDevider()
    }
    
    //MARK: SetupView function
    private func setupViewCollectionView() {
        self.addSubview(collectionViewMenu)
        collectionViewMenu.snp.makeConstraints { (make) in
            make.width.equalToSuperview().multipliedBy(0.6)
            make.height.equalToSuperview()
            make.left.equalToSuperview()
            make.centerY.equalToSuperview()
        }
    }
    
    private func setupViewScrollMenuView() {
        self.addSubview(scrollMenuView)
        scrollMenuView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        scrollMenuView.widthAnchor.constraint(equalTo: self.collectionViewMenu.widthAnchor, multiplier: 0.5).isActive = true
        scrollMenuView.heightAnchor.constraint(equalToConstant: 2).isActive = true
        leftContraintScrollMenu = scrollMenuView.leftAnchor.constraint(equalTo: collectionViewMenu.leftAnchor)
        leftContraintScrollMenu?.isActive = true
    }
    
    private func setupViewLineDevider() {
        addSubview(lineDevider)
        lineDevider.snp.makeConstraints { (make) in
            make.width.equalToSuperview()
            make.height.equalTo(2)
            make.bottom.equalToSuperview()
            make.centerX.equalToSuperview()
        }
    }
}

extension MenuBarBank: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as? MenuBarBankCell else { return UICollectionViewCell() }
        cell.setImageLooBank(imageName: arrayNameImage[indexPath.item])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width / 2, height: collectionView.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let index: CGFloat = CGFloat(indexPath.item)
        leftContraintScrollMenu?.constant = collectionView.frame.width / 2 * index
        
        UIView.animate(withDuration: 0.5) {
            self.layoutIfNeeded()
        }
    }
}


