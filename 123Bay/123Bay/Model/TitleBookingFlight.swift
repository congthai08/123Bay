//
//  TitleBookingFligght.swift
//  123bay
//
//  Created by MACOS on 6/16/17.
//  Copyright © 2017 123bay. All rights reserved.
//

import UIKit

class TitleBookingFlight {
    var imageName: String?
    var title: String?
    
    init() {
        imageName = ""
        title = ""
    }
    
    init(imageName: String, title: String) {
        self.imageName = imageName
        self.title = title
    }
    
}
