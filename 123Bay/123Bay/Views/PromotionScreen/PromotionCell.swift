//
//  PromotionCell.swift
//  123bay
//
//  Created by hai on 6/11/17.
//  Copyright © 2017 123bay. All rights reserved.
//

import UIKit

//This cell shows the promotion from 123bay.vn

class PromotionCell: UICollectionViewCell {
    //Image show
    var imageShow: UIImageView = {
        let imageShow = UIImageView()
        
        imageShow.border(borderW: 0, corner: 10, color: UIColor.clear)
        return imageShow
    }()
    
    //Id of promotion
    var idPromotionLabel: UILabel = {
        let idPromotionLabel = UILabel()
        
        idPromotionLabel.textColor = Theme.shared.idPromotionColor
        idPromotionLabel.backgroundColor = Theme.shared.idPromotionBackgroundColor
        idPromotionLabel.font = Theme.shared.boldNormalSizeOfFont
        idPromotionLabel.textAlignment = .center
        idPromotionLabel.border(borderW: 0, corner: 10, color: UIColor.clear)
        return idPromotionLabel
    }()
    
    //Info of promotion
    var inforPromotionLabel: UILabel = {
        let inforPromotionLabel = UILabel()
        
        inforPromotionLabel.textColor = Theme.shared.infoPromotionColor
        inforPromotionLabel.font = Theme.shared.boldLessSizeOfFont
        inforPromotionLabel.textAlignment = .center
        return inforPromotionLabel
    }()
    
    //Time of promotion
    var timePromotionLabel: UILabel = {
        let timePromotionLabel = UILabel()
        
        timePromotionLabel.textColor = Theme.shared.timePromotionColor
        timePromotionLabel.font = Theme.shared.lessSizeOfFont
        timePromotionLabel.textAlignment = .right
        return timePromotionLabel
    }()
    
    //Line seperator
    var labelLine: UILabel = {
        let labelLine = UILabel()
        
        labelLine.backgroundColor = Theme.shared.lineSeperateColor
        return labelLine
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupForImageShow()
        setupForLineSeperator()
        setupForIdPromotionLabel()
        setupForInfoPromotionLabel()
        setupForTimePromotionLabel()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    //Control show of promotion cell
    func showPromotion() {
        imageShow.image = #imageLiteral(resourceName: "underwater_tour")
        idPromotionLabel.text = "Mã KM: ADSFGFH"
        inforPromotionLabel.text = "Giảm giá vé máy bay 8%"
        timePromotionLabel.text = "Từ ngày 12/02/2017 - 15/07/2017"
    }
    
    //Setup for image show
    func setupForImageShow() {
        self.addSubview(imageShow)
        imageShow.snp.makeConstraints { (make) in
            make.top.equalTo(self).offset(20)
            make.centerX.equalTo(self)
            make.width.equalTo(self).dividedBy(1.5)
            make.height.equalTo(self).dividedBy(1.45)
        }
    }
    
    //Setup for idPromotion
    func setupForIdPromotionLabel() {
        self.addSubview(idPromotionLabel)
        idPromotionLabel.snp.makeConstraints { (make) in
            make.right.equalTo(self.imageShow).offset(8)
            make.bottom.equalTo(self.imageShow)
            make.height.equalTo(30)
            make.width.equalTo(self.imageShow).dividedBy(1.9)
        }
    }
    
    //Setup for info Promotion
    func setupForInfoPromotionLabel() {
        self.addSubview(inforPromotionLabel)
        inforPromotionLabel.snp.makeConstraints { (make) in
            make.left.equalTo(self.labelLine.snp.left).offset(10)
            make.bottom.equalTo(self.labelLine.snp.top).offset(-2)
            make.height.equalTo(25)
        }
    }
    
    //Setup for time Promotion
    func setupForTimePromotionLabel() {
        self.addSubview(timePromotionLabel)
        timePromotionLabel.snp.makeConstraints { (make) in
            make.right.equalTo(self.labelLine.snp.right).offset(-5)
            make.bottom.equalTo(self.inforPromotionLabel)
            make.height.equalTo(25)
        }
    }
    
    //Setup for line seperator
    func setupForLineSeperator() {
        self.addSubview(labelLine)
        labelLine.snp.makeConstraints { (make) in
            make.bottom.equalTo(self)
            make.left.equalTo(self).offset(10)
            make.right.equalTo(self).offset(-10)
            make.height.equalTo(1)
        }
    }
}
