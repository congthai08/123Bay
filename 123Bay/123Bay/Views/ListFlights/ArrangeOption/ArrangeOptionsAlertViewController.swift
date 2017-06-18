//
//  ArrangeOptionsAlertViewController.swift
//  123bay
//
//  Created by Huỳnh Công Thái on 6/6/17.
//  Copyright © 2017 123bay. All rights reserved.
//

import UIKit
import SnapKit

/*
    This class is a alert show some options arrange
    for display flight list.
    User can choose options arrange
*/
class ArrangeOptionsAlertViewController: BaseAlertViewController {
    
    // MARK: Define Variable
    private let timeInterval: TimeInterval = 0.5
    
    // MARK: Define controls
    private let contentView: ArrangeOtionsView = ArrangeOtionsView()

    // MARK: Setup layout
    private func setupContentView() {
        self.view.addSubview(self.contentView)
        
        self.contentView.snp.makeConstraints { (make) in
            make.left.right.bottom.equalToSuperview()
            make.height.equalToSuperview().dividedBy(2)
        }
        
        self.contentView.addTargetForButton(
            self,
            selector: #selector(ArrangeOptionsAlertViewController.dismissAlert)
        )
    }
    
    private func setupAnimation() {
        self.contentView.layer.transform = CATransform3DMakeTranslation(
            0,
            -Dimension.shared.heightScreen / 3,
            0
        )
    }
    
    private func showContentViewAnimation() {
        UIView.animate(withDuration: timeInterval, delay: 0, usingSpringWithDamping: 50, initialSpringVelocity: 100, options: [.curveLinear], animations: {
            self.contentView.layer.transform = CATransform3DIdentity
        }, completion: nil)
    }
    
    private func hideContentViewAnimation() {
        UIView.animate(withDuration: timeInterval) {
            self.contentView.layer.transform = CATransform3DMakeTranslation(
                0,
                Dimension.shared.heightScreen / 3,
                0
            )
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        showContentViewAnimation()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        hideContentViewAnimation()
    }
    
    override func setUp() {
        self.setupContentView()
        self.setupAnimation()
    }
}
