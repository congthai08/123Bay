//
//  DetailPrice.swift
//  123bay
//
//  Created by hai on 6/17/17.
//  Copyright © 2017 123bay. All rights reserved.
//

import Foundation
import UIKit

struct DetailPrice {
    
    var airplaneCompany: String
    var typeGuest: String
    var numberOfGuest: Int
    var price: Int
    
    init(airplaneCompany: String, typeGuest: String, numberOfGuest: Int, price: Int) {
        self.airplaneCompany = airplaneCompany
        self.typeGuest = typeGuest
        self.numberOfGuest = numberOfGuest
        self.price = price
    }
}
