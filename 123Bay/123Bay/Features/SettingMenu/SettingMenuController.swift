//
//  SettingMenuController.swift
//  123bay
//
//  Created by Os on 5/26/17.
//  Copyright © 2017 123bay. All rights reserved.
//

import UIKit

//This class display menu Setting
class SettingMenuController: UIViewController {
    
    //MARK: Variable
    fileprivate let cellSettingId = "cellSettingId"
    fileprivate let cellSettingWithLineId = "cellSettingWithLineId"
    fileprivate let cellSettingHeeaderId = "cellSettingHeeaderId"
    
    fileprivate let multiplierHeaderCell: CGFloat = 0.25
    fileprivate let multiplierSettingCell: CGFloat = 0.25
    
    fileprivate let arrayNameMenu = ["Đăng kí nhận thông tin", "Trợ giúp", "Liên hệ"]
    fileprivate let arrayNameIcon = ["2-19", "2-20", "2-21"]
    
    //MARK: Create Object
    var homeController: HomeViewController?
    var findFlightController: FindFlightController?
    var listFlightsViewController: ListFlightsViewController?
    var bookingFlightController: BookingFlightController?
    var paymentController: PaymentController?
    var successBookingController: SuccessBookingController?
    
    lazy var collectionViewSetting: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        var collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        collectionView.isScrollEnabled = false
        collectionView.showsVerticalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.backgroundColor = UIColor.rgbColor(red: 25, green: 160, blue: 288, alpha: 1)
        collectionView.register(SettingCell.self,
                                forCellWithReuseIdentifier: "cellSettingId")
        
        collectionView.register(SettingCellWithLine.self,
                                forCellWithReuseIdentifier: "cellSettingWithLineId")
        
        collectionView.register(SettingHeaderCell.self,
                                forCellWithReuseIdentifier: "cellSettingHeeaderId")
        
        collectionView.delegate = self
        collectionView.dataSource = self
        return collectionView
    }()
    
    var darkView = UIView()
    var blueView = UIView()

    //MARK: ViewDidload
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    //MARK: Other function
    func showMenuSetting() {
        guard let window = UIApplication.shared.keyWindow else { return }
        
        darkView.frame = window.frame
        darkView.backgroundColor = UIColor(white: 0, alpha: 0.8)
        
        blueView.backgroundColor = UIColor.rgbColor(red: 25, green: 160, blue: 288, alpha: 1)
        blueView.frame = CGRect(x: 0,
                                y: 0,
                                width: window.frame.width,
                                height: 50)
        
        collectionViewSetting.frame = CGRect(x: 0,
                                             y: -(window.frame.height) * 0.3,
                                             width: window.frame.width,
                                             height: window.frame.height * 0.3)
        blueView.alpha = 1
        
        window.addSubview(darkView)
        window.addSubview(blueView)
        window.addSubview(collectionViewSetting)
        
        UIView.animate(withDuration: 0.7, delay: 0, usingSpringWithDamping: 0.6, initialSpringVelocity: 0.5, options: UIViewAnimationOptions.curveEaseOut, animations: {
            self.darkView.alpha = 1
            self.collectionViewSetting.frame = CGRect(x: 0,
                                                      y: 0,
                                                      width: window.frame.width,
                                                      height: window.frame.height * 0.3)
        }) { (finish) in
            //
        }
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(SettingMenuController.hideMenuSetting))
        darkView.addGestureRecognizer(tapGesture)
    }
    
    func hideMenuSetting() {
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1.0, initialSpringVelocity: 0.8, options: UIViewAnimationOptions.curveEaseOut, animations: {
            guard let window = UIApplication.shared.keyWindow else { return }
            self.darkView.alpha = 0
            self.blueView.alpha = 0
            self.collectionViewSetting.frame = CGRect(x: 0,
                                                      y: -(window.frame.height) * 0.3,
                                                      width: window.frame.width,
                                                      height: window.frame.height * 0.3)
            
        }) { (finish) in
            //
        }
    }
}

//MARK: - Exrension SettingMenuController
extension SettingMenuController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    //MARK: - Number item
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrayNameMenu.count + 1
    }
    
    //MARK: - View for item
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if indexPath.item == 0 {
            guard let header = collectionView.dequeueReusableCell(withReuseIdentifier: cellSettingHeeaderId, for: indexPath) as? SettingHeaderCell else { return UICollectionViewCell() }
            
            header.settingMenuController = self
            
            return header
        } else if indexPath.item == 3 {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellSettingId, for: indexPath) as? SettingCell else { return UICollectionViewCell() }
            
            cell.lablelTitle.text = arrayNameMenu[indexPath.item - 1]
            cell.imageMenu.image = UIImage(named: arrayNameIcon[indexPath.item - 1])
            
            return cell
        } else {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellSettingWithLineId, for: indexPath) as? SettingCellWithLine else { return UICollectionViewCell() }
            
            cell.lablelTitle.text = arrayNameMenu[indexPath.item - 1]
            cell.imageMenu.image = UIImage(named: arrayNameIcon[indexPath.item - 1])
            
            return cell
        }
    
    }
    
    //MARK: - Size for settingCell
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.item == 0 {
            let heightSettingheaderCell = multiplierHeaderCell * collectionViewSetting.frame.height
            
            return CGSize(width: view.frame.width, height: heightSettingheaderCell)
        } else {
            let heightSettingCell = multiplierSettingCell * collectionViewSetting.frame.height
            
            return CGSize(width: view.frame.width, height: heightSettingCell)
        }
        
    }
    
    //MARK: - Minimum line spacing for 2 items
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    //MARK: - Minimum line spacing for 2 sections
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let index = indexPath.item
        hideMenuSetting()
        if let home = homeController {
            home.showDetailMenuSetting(index: index)
        } else if let find = findFlightController {
            find.showDetailMenuSetting(index: index)
        }
    }
}








