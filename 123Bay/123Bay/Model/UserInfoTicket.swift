//
//  InfoTicket.swift
//  123bay
//
//  Created by Os on 5/27/17.
//  Copyright © 2017 123bay. All rights reserved.
//

import Foundation
import UIKit

class DateTravel: NSObject {
    var date: Int?
    var month: Int?
    var year: Int?
    
    //Initialize function 
    init(isnextDay: Bool) {
        var dateTime = Date()
        if isnextDay {
            dateTime = (Calendar.current as NSCalendar).date(byAdding: .day,
                                                             value: 1,
                                                             to: Date(),
                                                             options: [])!
        }
        
        let calendar = Calendar.current
        let currentDate = calendar.component(Calendar.Component.day, from: dateTime)
        let currentMoth = calendar.component(Calendar.Component.month, from: dateTime)
        let currentYear = calendar.component(Calendar.Component.year, from: dateTime)
        
        self.date = currentDate
        self.month = currentMoth
        self.year = currentYear
        
    }
}

class NumberOfPassenger: NSObject {
    var numberAudult: Int?
    var numberChildren: Int?
    var numberBaby: Int?
    
    override init() {
        numberAudult = 1
        numberChildren = 0
        numberBaby = 0
    }
}

struct RoundTicket {
    var isRound: Bool?
    var dateBack: DateTravel?
    
    init() {
        isRound = false
        dateBack = DateTravel(isnextDay: true)
    }
}

class UserInfoTicket: NSObject {
    var departure: String?
    var destination: String?
    var dateDepart: DateTravel?
    var roundTicket: RoundTicket?
    var numberPasseger: NumberOfPassenger?
    var typeClass: String?
    
    override init() {
        numberPasseger = NumberOfPassenger()
        departure = "HÀ NỘI(HAN)"
        destination = "TPHCM(SGN)"
        roundTicket = RoundTicket()
        typeClass = TypeClass.saveMoney.rawValue
        dateDepart = DateTravel(isnextDay: false)
    }
    
    func setTypeClass(index: Int) {
        switch index {
        case 0:
            typeClass = TypeClass.saveMoney.rawValue
            break
        case 1:
            typeClass = TypeClass.economy.rawValue
        default:
            typeClass = TypeClass.business.rawValue
        }
    }
}
