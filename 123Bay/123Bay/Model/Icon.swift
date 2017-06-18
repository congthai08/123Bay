//
//  Icon.swift
//  123bay
//
//  Created by Huỳnh Công Thái on 6/4/17.
//  Copyright © 2017 123bay. All rights reserved.
//

import UIKit

//This struct is a object icon
struct icon {
    
    // MARK: Define Variable
    var title: String
    var image: UIImage
    
    // MARK: Initialization function
    init() {
        self.title = ""
        self.image = UIImage()
    }
    
    init(_ title: String, image: UIImage) {
        self.title = title
        self.image = image
    }
}

/*
 An enum to better memorize 4 different news type,
 also hold news type id for network call
 */
enum icons: Int {
    case all = -1, arrange, filter, changeDate
    
    static let titles = ["SẮP XẾP", "BỘ LỌC", "ĐỔI NGÀY"]
    static let images = [#imageLiteral(resourceName: "ic_arrange"), #imageLiteral(resourceName: "ic_Filter"), #imageLiteral(resourceName: "ic_changeDate")]
    
    static func getIcons() -> [icon] {
        return icons.titles.enumerated().map { index, value in icon.init(value, image: images[index])}
    }
}
