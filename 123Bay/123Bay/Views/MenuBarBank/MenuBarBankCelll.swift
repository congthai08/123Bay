//
//  MenuBarBankCelll.swift
//  123bay
//
//  Created by MACOS on 6/17/17.
//  Copyright © 2017 123bay. All rights reserved.
//

import UIKit

class MenuBarBankCell: BaseCollectionViewCell {
    
    private var imageLogoBank: UIImageView = {
        let imageConfig = UIImageView()
        
        imageConfig.contentMode = .scaleAspectFit
        imageConfig.image = UIImage(named: "BIDV")
        
        return imageConfig
    }()
    
    override func setupview() {
        super.setupview()
        setupViewImageLogoBank()
    }
    
    private func setupViewImageLogoBank() {
        self.addSubview(self.imageLogoBank)
        imageLogoBank.snp.makeConstraints { (make) in
            make.width.equalToSuperview()
            make.height.equalToSuperview()
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
        }
    }
    
    func setImageLooBank(imageName: String) {
        imageLogoBank.image = UIImage(named: imageName)
    }
    
}
