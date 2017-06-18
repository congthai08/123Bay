//
//  ArrangeOptionsTableViewCell.swift
//  123bay
//
//  Created by Huỳnh Công Thái on 6/8/17.
//  Copyright © 2017 123bay. All rights reserved.
//

import UIKit

//This class display arrange options
class ArrangeOptionsTableViewCell: BaseTableViewCell {
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        
        if selected {
            self.textLabel?.textColor = Theme.shared.sourceAndDestinationColor
        } else {
            self.textLabel?.textColor = Theme.shared.arrangeOptionColor
        }
    }
    
    override func setupview() {
        self.textLabel?.font = self.textLabel?.font.withSize(Dimension.shared.contentFontSize)
        self.textLabel?.textColor = Theme.shared.arrangeOptionColor
    }
}
