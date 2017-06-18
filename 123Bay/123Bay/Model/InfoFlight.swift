//
//  InfoFlight.swift
//  123bay
//
//  Created by Os on 6/6/17.
//  Copyright © 2017 123bay. All rights reserved.
//

import Foundation

var testChooseFlight: [InfoFlight] = []

class InfoFlight {
    var title: String?
    var infomationFlight: [InfomationFlight]?
    
    init() {
        infomationFlight = [InfomationFlight]()
    }
    
    init(title: String, info: InfomationFlight) {
        self.title = title
        self.infomationFlight?.append(info)
    }
    
}

class InfomationFlight {
    var place: String?
    var name: String?
    
    init(place: String, name: String) {
        self.place = place
        self.name = name
    }
}
