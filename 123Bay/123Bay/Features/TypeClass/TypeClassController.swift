
//
//  TypeClassController.swift
//  123bay
//
//  Created by Os on 5/30/17.
//  Copyright © 2017 123bay. All rights reserved.
//

import Foundation
import UIKit

class TypeClassController: UIViewController {
    
    //MARK: Create Variable
    fileprivate var heightOfTypeClassView: CGFloat?
    
    //MARK: Create Object
    var darkView = UIView()
    
    var labelTitle: UILabel = {
        let label = UILabel()
        
        label.text = "Chọn hạng ghế của bạn".uppercased()
        label.textColor = UIColor.white
        label.font = UIFont.systemFont(ofSize: 13, weight: 0.3)
        label.textAlignment = .left
        return label
    }()
    
    lazy var typeClassView: TypeClassView = {
        let typeClass = TypeClassView()
        
        typeClass.typeClassController = self
        return typeClass
    }()
    
    //MARK: ViewDidload
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    //MARK: Other function
    
    func getNumberTypeClass(value: String) -> Int {
        switch value {
        case TypeClass.saveMoney.rawValue:
            return 0
        case TypeClass.economy.rawValue:
            return 1
        default:
            return 2
        }
    }
    
    func show(value valueTypeClass: String) {
        let index = getNumberTypeClass(value: valueTypeClass)
        typeClassView.selectRow(index: index)
        
        guard let window = UIApplication.shared.keyWindow else { return }
        
        darkView.frame = window.frame
        darkView.backgroundColor = UIColor(white: 0, alpha: 0.8)
        labelTitle.alpha = 0
        
        heightOfTypeClassView = 0.38 * (window.frame.height)
        
        typeClassView.frame = CGRect(x: 0,
                                     y: window.frame.height,
                                     width: window.frame.width,
                                     height: heightOfTypeClassView!)
        
        labelTitle.frame = CGRect(x: 15,
                                  y: window.frame.height - heightOfTypeClassView! - 20,
                                  width: window.frame.width,
                                  height: 15)
        
        window.addSubview(darkView)
        window.addSubview(labelTitle)
        window.addSubview(typeClassView)
        
        UIView.animate(withDuration: 0.7, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 0.5, options: UIViewAnimationOptions.curveEaseOut, animations: {
            self.darkView.alpha = 1
            self.typeClassView.alpha = 1
            self.typeClassView.frame = CGRect(x: 0,
                                              y: window.frame.height - self.heightOfTypeClassView!,
                                              width: window.frame.width,
                                              height: self.heightOfTypeClassView!)
            
        }) { (finish) in
            self.labelTitle.alpha = 1
        }
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(TypeClassController.hide))
        darkView.addGestureRecognizer(tapGesture)
    }
    
    
    func hide() {
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1.0, initialSpringVelocity: 0.8, options: UIViewAnimationOptions.curveEaseOut, animations: {
            guard let window = UIApplication.shared.keyWindow else { return }
            self.labelTitle.alpha = 0
            self.darkView.alpha = 0
            self.typeClassView.alpha = 1
            self.typeClassView.frame = CGRect(x: 0,
                                              y: window.frame.height,
                                              width: window.frame.width,
                                              height: self.heightOfTypeClassView!)
            
        }) { (finish) in
            //
        }
    }
    
}

