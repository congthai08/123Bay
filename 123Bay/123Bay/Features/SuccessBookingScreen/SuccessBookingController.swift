//
//  SuccessBookingController.swift
//  123bay
//
//  Created by hai on 6/11/17.
//  Copyright © 2017 123bay. All rights reserved.
//

import UIKit

//This controller appear when the customer successed booking


class SuccessBookingController: UIViewController {

    //MARK: Create variable
    private var bannerImage: UIImageView = {
        let bannerImage = UIImageView()
        bannerImage.contentMode = .scaleAspectFit
        bannerImage.image = UIImage(named: "1")
        return bannerImage
    }()
    
    private var viewStoreMain: UIView = {
        let viewStoreMain = UIView()
        viewStoreMain.backgroundColor = Theme.defaultColor
        return viewStoreMain
    }()
    
    private var imagePlane: UIImageView = {
        let imagePlane = UIImageView()
        imagePlane.contentMode = .scaleToFill
        return imagePlane
    }()
    
    private var viewStoreInformation: UIView = {
        let viewStoreInformation = UIView()
        return viewStoreInformation
    }()
    
    private var labelBookingSuccess: UILabel = {
        let labelBookingSuccess = UILabel()
        
        labelBookingSuccess.textAlignment = .center
        labelBookingSuccess.textColor = Theme.shared.successBookingLabelColor
        labelBookingSuccess.font = Theme.shared.boldExtraLargeSizeOfFont
        
        return labelBookingSuccess
    }()
    
    private var labelIDBookingTicket: UILabel = {
        let labelIDBookingTicket = UILabel()
        
        labelIDBookingTicket.textAlignment = .center
        labelIDBookingTicket.font = Theme.shared.boldNormalSizeOfFont
        
        return labelIDBookingTicket
    }()
    
    private var labelTotalMoney: UILabel = {
        let labelTotalMonth = UILabel()
        
        labelTotalMonth.textAlignment = .center
        labelTotalMonth.font = Theme.shared.boldLessSizeOfFont
        
        return labelTotalMonth
    }()
    
    private var labelEndSuccess: UILabel = {
        let labelEndSuccess = UILabel()
        
        labelEndSuccess.textAlignment = .center
        labelEndSuccess.textColor = Theme.shared.endSuccessColor
        labelEndSuccess.font = Theme.shared.boldLessSizeOfFont
        labelEndSuccess.numberOfLines = 0
        
        return labelEndSuccess
    }()
    
    private var label123bayvn: UILabel = {
        let label123bayvn = UILabel()
        
        label123bayvn.textAlignment = .center
        label123bayvn.font = Theme.shared.boldLessSizeOfFont
        label123bayvn.textColor = Theme.shared.bayvnColor
        
        return label123bayvn
    }()
    
    //MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = Theme.defaultColor
        setupForBannerImage()
        setupForViewStoreMain()
        setupForImagePlane()
        setupForViewStoreInformation()
        setupForSuccessBookingLabel()
        setupForShowIDBookingLabel()
        setupForShowTotalMoneyLabel()
        setupForShowEndSuccessLabel()
        setupForShow123bayvnLabel()
        setData()
    }
    
    //MARK: - Set data
    func setData() {
        imagePlane.image = #imageLiteral(resourceName: "7")
        labelBookingSuccess.text = "ĐẶT VÉ THÀNH CÔNG"
        labelTotalMoney.attributedText =
            doubleTextAttribute(text1: "Tổng thanh toán của bạn: ",
                                text2: "3,384,000 VND",
                                color1: Theme.shared.TotalMoneyLabelColor,
                                color2: Theme.shared.showTotalMoneyLabelColor)
        labelIDBookingTicket.attributedText =
            doubleTextAttribute(text1: "Mã đặt vé của bạn: ",
                                text2: "12343577",
                                color1: Theme.shared.IDBookingTicketLabelColor,
                                color2: Theme.shared.showIDBookingTicketLabelColor)
        labelEndSuccess.text = "Bạn đã đặt vé thành công, cám ơn bạn đã đặt vé với"
        label123bayvn.text = "123bay.vn"
    }
    
    //MARK: - Auto layout for element
    private func setupForBannerImage() {
        view.addSubview(bannerImage)
        bannerImage.snp.makeConstraints { (make) in
            make.top.equalTo(self.topLayoutGuide.snp.bottom)
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.height.equalTo(44).multipliedBy(Dimension.shared.widthScale)
        }
    }
    
    private func setupForViewStoreMain() {
        view.addSubview(viewStoreMain)
        viewStoreMain.snp.makeConstraints { (make) in
            make.top.equalTo(self.bannerImage.snp.bottom)
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
    
    private func setupForImagePlane() {
        viewStoreMain.addSubview(imagePlane)
        imagePlane.snp.makeConstraints { (make) in
            make.top.equalTo(self.viewStoreMain.snp.top).offset(50)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().dividedBy(1.1)
            make.height.equalTo(self.imagePlane.snp.width).dividedBy(3.4)
        }
    }
    
    private func setupForViewStoreInformation() {
        viewStoreMain.addSubview(viewStoreInformation)
        viewStoreInformation.snp.makeConstraints { (make) in
            make.top.equalTo(self.imagePlane.snp.bottom).offset(10)
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.height.equalTo(self.viewStoreMain).dividedBy(3)
        }
    }
    
    private func setupForSuccessBookingLabel() {
        viewStoreInformation.addSubview(labelBookingSuccess)
        labelBookingSuccess.snp.makeConstraints { (make) in
            make.top.equalTo(self.viewStoreInformation.snp.top)
            make.centerX.equalToSuperview()
            make.height.equalTo(30)
        }
    }
    
    private func setupForShowIDBookingLabel() {
        viewStoreInformation.addSubview(labelIDBookingTicket)
        labelIDBookingTicket.snp.makeConstraints { (make) in
            make.top.equalTo(self.labelBookingSuccess.snp.bottom)
            make.centerX.equalToSuperview()
            make.height.equalTo(20)
        }
    }
    
    private func setupForShowTotalMoneyLabel() {
        viewStoreInformation.addSubview(labelTotalMoney)
        labelTotalMoney.snp.makeConstraints { (make) in
            make.top.equalTo(self.labelIDBookingTicket.snp.bottom)
            make.centerX.equalToSuperview()
            make.height.equalTo(20)
        }
    }
    
    private func setupForShowEndSuccessLabel() {
        viewStoreInformation.addSubview(labelEndSuccess)
        labelEndSuccess.snp.makeConstraints { (make) in
            make.top.equalTo(self.labelTotalMoney.snp.bottom)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().dividedBy(1.05)
            make.height.equalTo(20)
        }
    }
    
    private func setupForShow123bayvnLabel() {
        viewStoreInformation.addSubview(label123bayvn)
        label123bayvn.snp.makeConstraints { (make) in
            make.top.equalTo(self.labelEndSuccess.snp.bottom)
            make.centerX.equalToSuperview()
            make.height.equalTo(20)
        }
    }
}
