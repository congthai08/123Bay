//
//  DisplayOptionsForListFlightsView.swift
//  123bay
//
//  Created by Huỳnh Công Thái on 6/4/17.
//  Copyright © 2017 123bay. All rights reserved.
//

import UIKit
import SnapKit

/*
    This protocol will be call a function when did select a item in collection view
    This function send viewController which need show in class parent viewcontroller
*/

protocol DisplayOptionsForListFlightsDelegate: class {
    func viewControllerNeedPresentation(_ viewController: UIViewController)
}


/*
 This class is display some options for display list flights
 Examples: Filter, Changes date, arrange, ...
 */

class  DisplayOptionsForListFlightsView: BaseUIView {
    
    // MARK: Define variable
    let listIcon = icons.getIcons()
    var delegate: DisplayOptionsForListFlightsDelegate?
    
    // MARK: Define controls
    lazy var contentCollectionView: UICollectionView = {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        let collectionView: UICollectionView = UICollectionView(
            frame: .zero,
            collectionViewLayout: layout
        )
        
        layout.scrollDirection = .horizontal
        collectionView.backgroundColor = Theme.defaultColor
        collectionView.register(
            ContentOptionsCollectionViewCell.self,
            forCellWithReuseIdentifier: "ContentOptionsCollectionViewCell"
        )
        collectionView.delegate = self
        collectionView.dataSource = self
        
        return collectionView
    }()
    
    // MARK: Define setup layout
    func setupContentCollectionView() {
        self.addSubview(self.contentCollectionView)
        
        self.contentCollectionView.snp.makeConstraints { (make) in
            make.left.right.equalToSuperview()
            make.top.equalToSuperview().offset(Dimension.smallMargin)
            make.bottom.equalToSuperview().offset(Dimension.smallMarginInverse)
        }
    }
    
    override func setupView() {
        self.backgroundColor = #colorLiteral(red: 0.1005552337, green: 0.6265580654, blue: 0.8926903605, alpha: 1)
        self.setupContentCollectionView()
    }
}

// MARK: Extention
// Extention ListFlightsDisplayOptionsView for config contentCollectionView
extension DisplayOptionsForListFlightsView: UICollectionViewDelegate,
    UICollectionViewDataSource,
UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return listIcon.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: "ContentOptionsCollectionViewCell",
            for: indexPath
            ) as! ContentOptionsCollectionViewCell
        
        cell.setValue(listIcon[indexPath.row])
        
        cell.backgroundColor = #colorLiteral(red: 0.1005552337, green: 0.6265580654, blue: 0.8926903605, alpha: 1)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width: CGFloat = collectionView.frame.width
        let height: CGFloat = collectionView.frame.height
        
        return CGSize(width: width / 3, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        switch indexPath.item {
        case 0:
            let arrangeOptionsAlertVC = ArrangeOptionsAlertViewController()
            self.delegate?.viewControllerNeedPresentation(arrangeOptionsAlertVC)
            break
        case 1:
            let filterOptionsVC = FilterOptionsViewController()
            let navigationVC = UINavigationController(rootViewController: filterOptionsVC)
            self.delegate?.viewControllerNeedPresentation(navigationVC)
            break
        case 2:
            let ChangeDateOptionsAlertVC = ChangeDateOptionsAlertController()
            self.delegate?.viewControllerNeedPresentation(ChangeDateOptionsAlertVC)
            break
        default :
            break
        }
    }
}
