//
//  BaseAlertViewController.swift
//  123bay
//
//  Created by Huỳnh Công Thái on 6/5/17.
//  Copyright © 2017 123bay. All rights reserved.
//

import UIKit
import SnapKit

/*
    This class is a base for config a most of custom alert
 */
class BaseAlertViewController: UIViewController {
    
    // MARK: Define controls
    private let viewBackground: UIView = {
        let view = UIView()
        
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = Theme.shared.alertBackgroundColor
        view.alpha = 0
        
        return view
    }()
    
    // MARK: This function is a default initialization function
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        self.modalPresentationStyle = .overFullScreen
        self.modalTransitionStyle = .crossDissolve
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupViewBackground()
        self.setUp()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: Setup layout
    private func setupViewBackground() {
        self.view.addSubview(self.viewBackground)

        self.viewBackground.snp.makeConstraints { (make) in
            make.top.bottom.left.right.equalToSuperview()
        }
        
        let tapGesture = UITapGestureRecognizer(
            target: self,
            action: #selector(BaseAlertViewController.dismissAlert)
        )
        
        self.viewBackground.addGestureRecognizer(tapGesture)
    }
    
    func setUp() {}
    
    func dismissAlert() {self.dismiss(animated: true, completion: nil)}
    
    override func viewWillAppear(_ animated: Bool) {
        UIView.animate(withDuration: 0.3) {
            self.viewBackground.alpha = 1
        }
    }
}

