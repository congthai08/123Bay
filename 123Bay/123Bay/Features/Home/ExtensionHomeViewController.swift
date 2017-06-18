//
//  ExtensionHomeViewController.swift
//  123bay
//
//  Created by Os on 5/26/17.
//  Copyright © 2017 123bay. All rights reserved.
//

import UIKit

//MARK: - Extension HomeViewController
extension HomeViewController: UICollectionViewDelegateFlowLayout {
    
    //MARK: - Setup number item of collectionViewCell
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    //MARK: - Setup view for collectionViewCell
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdBannerCell, for: indexPath) as! BannerCollectionViewCell
        return cell
    }
    
    //MARK: - Setup view for collectionViewHeader
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: cellIdHeaderCell, for: indexPath) as! MainMenuCollectionViewCell
        header.homeController = self
        header.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        return header
    }
    
    //MARK: - Size for Cell
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height * 0.25)
    }
    
    
    //MARK: - Size for Header Cell
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height * 0.6)
    }
    
    //MARK: - Setup edge bottom
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 50, right: 0)
    }
    
    //MARK: - Setup alpha for NaviagtionBar when scroll
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let bar = self.navigationController?.navigationBar
        let value: CGFloat = scrollView.contentOffset.y / CGFloat(121)
        bar?.backgroundColor = UIColor.rgbColor(red: 25, green: 160, blue: 288, alpha: value)
    }
}

extension HomeViewController: SettingMenuControllerDeledate {
    
    func presentDetailMenuSetting(_ viewController: UIViewController) {
        navigationController?.pushViewController(viewController, animated: true)
    }
    
}

