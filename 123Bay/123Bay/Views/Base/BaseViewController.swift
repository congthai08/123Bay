//
//  BaseViewController.swift
//  123bay
//
//  Created by Huỳnh Công Thái on 5/23/17.
//  Copyright © 2017 123bay. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.automaticallyAdjustsScrollViewInsets = false
        self.setup()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func setup() {}
}
