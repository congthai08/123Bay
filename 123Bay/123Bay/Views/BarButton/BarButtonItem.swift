//
//  BarButtonItem.swift
//  123bay
//
//  Created by Os on 5/26/17.
//  Copyright © 2017 123bay. All rights reserved.
//

import UIKit

/*
    This class display Bar button item
*/
class BarButtonItem: UIBarButtonItem {
    
    override init() {
        super.init()
        
    }
    
    init(imgaes: UIImage?, frame: CGRect, target: Any?, action: Selector?) {
        super.init()
        self.customView = ViewButton(frame: frame)
        let view = self.customView as! ViewButton
        view.imageButton.image = imgaes?.withRenderingMode(UIImageRenderingMode.alwaysTemplate)
        let tap = UITapGestureRecognizer(target: target, action: action)
        view.addGestureRecognizer(tap)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

/*
    This class display content view for Bar icon
    It content imageIcon and title
 */
class ViewButton: BaseUIView {
    let imageButton: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.isUserInteractionEnabled = true
        return imageView
    }()
    
    override func setupView() {
        super.setupView()
        addSubview(imageButton)
        imageButton.snp.makeConstraints { (make) in
            make.width.equalToSuperview()
            make.height.equalToSuperview()
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
        }

    }
}
