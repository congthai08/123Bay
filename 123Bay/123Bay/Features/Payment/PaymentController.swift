//
//  PaymentController.swift
//  123bay
//
//  Created by MACOS on 6/17/17.
//  Copyright © 2017 123bay. All rights reserved.
//

import UIKit

class PaymentController: UIViewController {
    
    //MARK: Variable
    fileprivate let numberItemCollectionView: Int = 4
    fileprivate let arrayTitle = ["VUI LÒNG XEM LẠI ĐẶT CHỖ CỦA BẠN", "DANH SÁCH KHÁCH HÀNG", "THANH TOÁN", "GIAO DỊCH"]
    
    fileprivate let cellHeaderPaymentId = "cellHeaderPaymentId"
    fileprivate let cellFooterPaymentId = "cellFooterPaymentId"
    fileprivate let cellPaymentId = "cellPaymentId"
    fileprivate let cellListPassengerId = "cellListPassengerId"
    fileprivate let cellTransactionId = "cellTransactionId"
    
    
    //MARK: Create Object
    lazy var menuSetting: SettingMenuController = {
        let menu = SettingMenuController()
        return menu
    }()
    
    private var imageBookingStep: UIImageView = {
        let imageConfig = UIImageView()
        imageConfig.contentMode = .scaleAspectFit
        imageConfig.image = UIImage(named: "BookingStep")
        imageConfig.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        return imageConfig
    }()
    
    lazy private var colectionViewInfomation: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collectionViewConfig = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        collectionViewConfig.backgroundColor = Theme.shared.baseViewBackgroundColor
        collectionViewConfig.delegate = self
        collectionViewConfig.dataSource = self
        
        collectionViewConfig.register(HeaderPaymentCell.self,
                                      forSupplementaryViewOfKind: UICollectionElementKindSectionHeader,
                                      withReuseIdentifier: "cellHeaderPaymentId")
        
        collectionViewConfig.register(FooterPaymentCell.self,
                                      forSupplementaryViewOfKind: UICollectionElementKindSectionFooter,
                                      withReuseIdentifier: "cellFooterPaymentId")
        
        collectionViewConfig.register(PaymentInfomationcell.self,
                                      forCellWithReuseIdentifier: "cellPaymentId")
        
        collectionViewConfig.register(ListPassengerCell.self,
                                      forCellWithReuseIdentifier: "cellListPassengerId")
        
        collectionViewConfig.register(TransactionCell.self,
                                      forCellWithReuseIdentifier: "cellTransactionId")
        
        return collectionViewConfig
    }()
    
    private var bookingCodeView: BookingCodeView = {
        let bookingCode = BookingCodeView()
        
        return bookingCode
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        self.setupViewImageBookingStep()
        self.setupViewBookingCodeView()
        self.setupViewCollectionViewInfomation()
        self.setupViewBackItem()
        self.addMenuBarItem()
    }
    
    func addMenuBarItem() {
        let imageMenuBar = UIImage(named: "2-1")
        let frameButton = CGRect(x: 8, y: 0, width: 20, height: 20)
        let menuBarButton = BarButtonItem(imgaes: imageMenuBar, frame: frameButton, target: self
            , action: #selector(PaymentController.showMenuSettingController))
        navigationItem.rightBarButtonItem = menuBarButton
    }
    
    //Function to show menuSettingController when user choose setting on NavigationBar
    func showMenuSettingController() {
        menuSetting.showMenuSetting()
    }
    
    func setupViewBackItem() {
        let imageBackItem = UIImage(named: "Back")
        let frameBackItem = CGRect(x: 0, y: 5, width: 15, height: 15)
        let backItem = BarButtonItem(
            imgaes: imageBackItem,
            frame: frameBackItem,
            target: self,
            action: #selector(PaymentController.backItemPressed)
        )
        
        backItem.tintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1).withAlphaComponent(1)
        navigationItem.leftBarButtonItem = backItem
        
        let titleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: view.frame.width
            , height: view.frame.height))
        
        titleLabel.text = " Thanh toán"
        titleLabel.textColor = UIColor.white
        titleLabel.font = UIFont.systemFont(ofSize: 15)
        titleLabel.font = UIFont.boldSystemFont(ofSize: 15)
        navigationItem.titleView = titleLabel
    }
    
    func backItemPressed() {
        navigationController?.popViewController(animated: true)
    }

    
    //MARK: SetupView function
    private func setupViewImageBookingStep() {
        view.addSubview(imageBookingStep)
        imageBookingStep.snp.makeConstraints { (make) in
            make.width.equalToSuperview()
            make.top.equalTo(self.topLayoutGuide.snp.bottom).offset(10)
            make.height.equalTo(42).multipliedBy(Dimension.shared.widthScale)
            make.centerX.equalToSuperview()
        }
    }
    
    private func setupViewBookingCodeView() {
        view.addSubview(bookingCodeView)
        bookingCodeView.snp.makeConstraints { (make) in
            make.width.equalToSuperview()
            make.height.equalTo(40).multipliedBy(Dimension.shared.widthScale)
            make.top.equalTo(self.imageBookingStep.snp.bottom).offset(5)
            make.centerX.equalToSuperview()
        }
    }
    
    private func setupViewCollectionViewInfomation() {
        view.addSubview(colectionViewInfomation)
        colectionViewInfomation.snp.makeConstraints { (make) in
            make.width.equalToSuperview()
            make.top.equalTo(self.bookingCodeView.snp.bottom)
            make.bottom.equalToSuperview()
            make.centerX.equalToSuperview()
        }
    }
    
}

extension PaymentController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return numberItemCollectionView
    }
    
    //MARK: - Setupview header and footer
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionElementKindSectionHeader {
            guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: cellHeaderPaymentId, for: indexPath) as? HeaderPaymentCell else {
                return UICollectionReusableView()
            }
            
            header.backgroundColor = Theme.shared.darkBackgroundColor
            return header
        }
        else {
            guard let footer = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: cellFooterPaymentId, for: indexPath) as? FooterPaymentCell else {
                return UICollectionReusableView()
            }
            
            footer.delegate = self
            
            return footer
        }
    }
    
    //MARK: - Setupview Cell
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.item {
        case 1:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellListPassengerId, for: indexPath) as? ListPassengerCell else {
                return UICollectionViewCell()
            }
            
            cell.setupTitleLabel(title: arrayTitle[indexPath.item])
            return cell
        case 3:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellTransactionId, for: indexPath) as? TransactionCell else {
                return UICollectionViewCell()
            }
            
            cell.setupTitleLabel(title: arrayTitle[indexPath.item])
            return cell
        default:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellPaymentId, for: indexPath) as? PaymentInfomationcell else {
                return UICollectionViewCell()
            }
            
            cell.setupTitleLabel(title: arrayTitle[indexPath.item])
            return cell
        }
    }
    
    //MARK: - Setup height for header and footer
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height * 1 / 5)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        var heightFooter = view.frame.height * 0.7
        
        if Dimension.shared.widthScale < 1 {
            heightFooter = heightFooter / Dimension.shared.widthScale
        }
        
        return CGSize(width: view.frame.width, height: heightFooter)
        
    }
    
    //MARK: - Setup height cell
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch indexPath.item {
        case 1:
            return CGSize(width: view.frame.width, height: view.frame.height * 0.5)
        case 3:
            return CGSize(width: view.frame.width, height: view.frame.height * 1 / 4)
        default:
            return CGSize(width: view.frame.width, height: view.frame.height * 1 / 7)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}

extension PaymentController: FooterPaymentCellDelegate {
    
    func prsentSuccessfullBookingController(_ controller: UIViewController) {
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
}
