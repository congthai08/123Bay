//
//  ChooseNumberPassengerController.swift
//  123bay
//
//  Created by Os on 6/7/17.
//  Copyright © 2017 123bay. All rights reserved.
//

import UIKit

class ChooseNumberPassengerController: UIViewController {
    
    var heightChoosePassengerView: CGFloat?

    //MARK: Create Object
    private var darkView: UIView = {
        let viewConfig = UIView()
        
        viewConfig.backgroundColor = UIColor(white: 0, alpha: 0.8)
        return viewConfig
    }()
    
    lazy private var choosePassengerView: PassengerView = {
        let viewConfig = PassengerView()
        
        viewConfig.chooseNumberPassengerControllerClassView = self
        return viewConfig
    }()
    
    var labelTitle: UILabel = {
        let label = UILabel()
        
        label.text = "Thêm hành khách"
        label.textColor = UIColor.white
        label.font = UIFont.systemFont(ofSize: 13, weight: 0.3)
        label.textAlignment = .left
        return label
    }()
    
    //MARK: Viewdidload
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func show() {
        guard let window = UIApplication.shared.keyWindow else { return }
        
        darkView.frame = window.frame
        darkView.alpha = 0
        labelTitle.alpha = 0
        
        heightChoosePassengerView = 0.45 * window.frame.height
        guard let height = heightChoosePassengerView else { return }
        
        choosePassengerView.frame = CGRect(x: 0,
                                           y: window.frame.height * 1.45,
                                           width: window.frame.width,
                                           height: height)
        labelTitle.frame = CGRect(x: 15,
                                  y: window.frame.height - height - 20,
                                  width: window.frame.width,
                                  height: 15)
        
        window.addSubview(darkView)
        window.addSubview(choosePassengerView)
        window.addSubview(labelTitle)        
        UIView.animate(withDuration: 0.7, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 0.5, options: UIViewAnimationOptions.curveEaseOut, animations: {
            self.darkView.alpha = 1
            self.choosePassengerView.frame = CGRect(x: 0,
                                               y: window.frame.height * 0.55,
                                               width: window.frame.width,
                                               height: height)
        }) { (finish) in
            self.labelTitle.alpha = 1
        }
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(TypeClassController.hide))
        darkView.addGestureRecognizer(tapGesture)
        
    }
    
    func hide() {
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1.0, initialSpringVelocity: 0.8, options: UIViewAnimationOptions.curveEaseOut, animations: {
            guard let window = UIApplication.shared.keyWindow else { return }
            guard let height = self.heightChoosePassengerView else { return }
            self.darkView.alpha = 0
            self.labelTitle.alpha = 0
            self.choosePassengerView.frame = CGRect(x: 0,
                                               y: window.frame.height * 1.45,
                                               width: window.frame.width,
                                               height: height)
        }) { (finish) in
            //
        }
    }
}






