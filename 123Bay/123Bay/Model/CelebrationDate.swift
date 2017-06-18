//
//  CelebrationDate.swift
//  TestCalender
//
//  Created by hai on 6/6/17.
//  Copyright © 2017 Os. All rights reserved.
//

import Foundation
import UIKit

struct CelebrationDate {
    var day: Int
    var month: Int
    var name: String
    
    init(day: Int, month: Int, name: String) {
        self.day = day
        self.month = month
        self.name = name
    }
}
