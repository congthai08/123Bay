//
//  Theme.swift
//  123bay
//
//  Created by Huỳnh Công Thái on 6/8/17.
//  Copyright © 2017 123bay. All rights reserved.
//

import UIKit

/*
 This class set default color, alpha for app
 */

class Theme {
    class var shared : Theme {
        struct Static {
            static let instance : Theme = Theme()
        }
        return Static.instance
    }
    
    private init() {
        
    }
    //feature trieuMH5
    var navigationBarTintColor: UIColor {
        return UIColor.rgbColor(red: 56, green: 158, blue: 277, alpha: 1)
    }
    
    var baseViewBackgroundColor: UIColor {
        return UIColor(white: 1, alpha: 1)
    }
    
    var darkBackgroundColor: UIColor {
        return UIColor.rgbColor(red: 235, green: 235, blue: 235, alpha: 1)
    }
    
    var lineDeviderColor: UIColor {
        return UIColor(white: 0.7, alpha: 0.3)
    }
    
    var lineWhileDeviderColor: UIColor {
        return UIColor(white: 1, alpha: 1)
    }
    
    var yellowButtonColor: UIColor {
        return UIColor.rgbColor(red: 245, green: 109, blue: 32, alpha: 1)
    }
    
    //MARK: Font size
    var blueTextColor: UIColor {
        return UIColor.rgbColor(red: 56, green: 158, blue: 277, alpha: 1)
    }
    
    var darkBlueTextColor: UIColor {
        return UIColor.rgbColor(red: 60, green: 108, blue: 147, alpha: 1)
    }
    
    var darkTextColor: UIColor {
        return UIColor(white: 0.8, alpha: 1)
    }
    
    var titleColor: UIColor {
        return UIColor(white: 1, alpha: 1)
    }
    
    var titleTextColor: UIColor {
        return UIColor(white: 0, alpha: 1)
    }
    
    var highlightTextColor: UIColor {
        return UIColor.rgbColor(red: 238, green: 0, blue: 0, alpha: 1)
    }
    
    var contentTextColor: UIColor {
        return UIColor(white: 0, alpha: 1)
    }
    
    var borderBoxColor: UIColor {
        return UIColor(white: 0.6, alpha: 0.6)
    }
    
    //-----------------
    
    // Alert
    var alertBackgroundColor: UIColor {
        return #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.8)
    }
    
    // ListFights
    var idPlaneColor: UIColor {
        return #colorLiteral(red: 0.6429485083, green: 0.6470428109, blue: 0.651107192, alpha: 1)
    }
    
    var priceTicketColor: UIColor {
        return #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
    }
    
    var sourceAndDestinationColor: UIColor {
        return #colorLiteral(red: 0.1005552337, green: 0.6265580654, blue: 0.8926903605, alpha: 1)
    }
    
    var backgroundButtonColor: UIColor {
        return #colorLiteral(red: 0.9661940932, green: 0.4309073687, blue: 0, alpha: 1)
    }
    
    var lineColor: UIColor {
        return #colorLiteral(red: 0.9174302816, green: 0.9215688705, blue: 0.9255864024, alpha: 1)
    }
    
    var arrangeOptionColor: UIColor {
        return #colorLiteral(red: 0.4756349325, green: 0.4756467342, blue: 0.4756404161, alpha: 1)
    }
    
    //Normal text size of font
    var normalSizeOfFont: UIFont {
        return UIFont.systemFont(ofSize: 14)
    }
    
    //Bold normal text size of font
    var boldNormalSizeOfFont: UIFont {
        return UIFont.boldSystemFont(ofSize: 14)
    }
    
    //Tiny text size of font
    var tinySizeOfFont: UIFont {
        return UIFont.systemFont(ofSize: 12)
    }
    
    //Less text size of font
    var lessSizeOfFont: UIFont {
        return UIFont.systemFont(ofSize: 13)
    }
    
    //Bold less text size of font
    var boldLessSizeOfFont: UIFont {
        return UIFont.boldSystemFont(ofSize: 13)
    }
    
    //Large text size of font
    var largeSizeOfFont: UIFont {
        return UIFont.systemFont(ofSize: 16)
    }
    
    //Bold large text size of font
    var boldLargeSizeOfFont: UIFont {
        return UIFont.boldSystemFont(ofSize: 16)
    }
    
    //Bold extra large text size of font
    var boldExtraLargeSizeOfFont: UIFont {
        return UIFont.boldSystemFont(ofSize: 18)
    }
    
    //MARK:
    //MARK: Calendar color
    //Calendar: color of calendarController
    var calendarControllerColor: UIColor {
        return #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
    }
    
    //Calendar: color of special day label
    var specialDayLabel: UIColor {
        return #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
    }
    
    //Calendar: color of special name day label
    var specialNameDayLabel: UIColor {
        return #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
    }
    
    //Calendar: color of day of each months
    var dayInMonthColor: UIColor {
        return #colorLiteral(red: 0.7165926634, green: 0.7165926634, blue: 0.7165926634, alpha: 1)
    }
    
    //Calendar: color of today
    var todayColor: UIColor {
        return #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
    }
    
    //Calendar: color of view if day is selected
    var showDaySelectedColor: UIColor {
        return #colorLiteral(red: 0, green: 0.4875635585, blue: 0.8029128958, alpha: 1)
    }
    
    //Calendar: color of view store "Chon ngay"
    var viewSelectDayColor: UIColor {
        return #colorLiteral(red: 0.9472791553, green: 0.9472791553, blue: 0.9472791553, alpha: 1)
    }
    
    //Calendar: color of "Chon ngay"
    var selectDayColor: UIColor {
        return #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
    }
    
    //Calendar: color of info view
    var infoViewColor: UIColor {
        return #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
    }
    
    //Calendar: color of text selected segment
    var selectedTextSegmentColor: UIColor {
        return #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    }
    
    //Calendar: color of text unselected segment
    var unSelectedTextSegmentColor: UIColor {
        return #colorLiteral(red: 0.4928556085, green: 0.4928556085, blue: 0.4928556085, alpha: 1)
    }
    
    //Calendar: color of month view
    var monthViewColor: UIColor {
        return #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    }
    
    //Calendar: color of month title text
    var monthTitleColor: UIColor {
        return #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
    }
    
    //Calendar: color of view bound celebration table
    var viewBoundCelebrationTableColor: UIColor {
        return #colorLiteral(red: 0.9660210409, green: 0.9660210409, blue: 0.9660210409, alpha: 1)
    }
    
    //Calendar: color of sunday
    var sundayColor: UIColor {
        return #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.06045687945, alpha: 1)
    }
    
    //Calendar: color of normal days in week
    var normalDayColor: UIColor {
        return #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    }
    
    //Calendar: color of background celebration cell
    var celebrationCellColor: UIColor {
        return #colorLiteral(red: 0.9660210409, green: 0.9660210409, blue: 0.9660210409, alpha: 1)
    }
    
    //Calendar: color of text selected day
    var selectedDayTextColor: UIColor {
        return #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    }
    
    //Calendar: color of text today if selected
    var todayTextColorSelected: UIColor {
        return #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    }
    
    //Calendar: color of text today if unselected
    var todayTextColorUnselected: UIColor {
        return #colorLiteral(red: 0.7631736425, green: 0.7631736425, blue: 0.7631736425, alpha: 1)
    }
    
    //Calendar: color of belong month
    var belongMonthColor: UIColor {
        return #colorLiteral(red: 0.4422390546, green: 0.4422390546, blue: 0.4422390546, alpha: 1)
    }
    
    //Calendar: color of unbelong month
    var unbelongMonthColor: UIColor {
        return #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    }
    
    //Calendar: color of old days
    var oldDayColor: UIColor {
        return #colorLiteral(red: 0.9053452795, green: 0.9053452795, blue: 0.9053452795, alpha: 1)
    }
    
    //MARK:
    //MARK: SuccesBooking Screen
    //SuccessBookingScreen: Label "Dat ve thanh cong"
    var successBookingLabelColor: UIColor {
        return #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    }
    
    //SuccessBookingScreen: Label: "Ma dat ve"
    var IDBookingTicketLabelColor: UIColor {
        return #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    }
    
    //SuccessBookingScreen: Label: After "Ma dat ve"
    var showIDBookingTicketLabelColor: UIColor {
        return #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
    }
    
    //SuccessBookingScreen: Label: "Tong thanh toan"
    var TotalMoneyLabelColor: UIColor {
        return #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    }
    
    //SuccessBookingScreen: Label: After "Tong thanh toan"
    var showTotalMoneyLabelColor: UIColor {
        return #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
    }
    
    //SuccessBookingScreen: Label: End of success show
    var endSuccessColor: UIColor {
        return #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    }
    
    //SuccessBookingScreen: Label: 123bayvn
    var bayvnColor: UIColor {
        return #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    }
    
    //MARK:
    //MARK: PromotionScreen
    //PromotionScreeen: background of promotion screen
    var promotionScreenBackground: UIColor {
        return #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    }
    
    //PromotionScreen: color of line seperator
    var lineSeperateColor: UIColor {
        return #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.2262414384)
    }
    
    //PromotionScreen: color of id of promotion
    var idPromotionColor: UIColor {
        return #colorLiteral(red: 0.8386206627, green: 0, blue: 0.03377880901, alpha: 1)
    }
    
    //PromotionScreen: background color of id of promotion
    var idPromotionBackgroundColor: UIColor {
        return #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.7636815068)
    }
    
    //PromotionScreen: color of info of promotion
    var infoPromotionColor: UIColor {
        return #colorLiteral(red: 0, green: 0.4491788745, blue: 0.7285555005, alpha: 1)
    }
    
    //PromotionScreen: color of time of promotion
    var timePromotionColor: UIColor {
        return #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
    }
    
    var lessFontSize: UIFont {
        return UIFont.systemFont(ofSize: 13)
    }
    
    var boldLessFontSize: UIFont {
        return UIFont.boldSystemFont(ofSize: 13)
    }
    
    var normalFontSize: UIFont {
        return UIFont.systemFont(ofSize: 14)
    }
    
    var boldNormalFontSize: UIFont {
        return UIFont.boldSystemFont(ofSize: 14)
    }
    
    var largeFontSize: UIFont {
        return UIFont.systemFont(ofSize: 15)
    }
    
    var boldLargeFontSize: UIFont {
        return UIFont.boldSystemFont(ofSize: 15)
    }
    
    var extraFontSize: UIFont {
        return UIFont.systemFont(ofSize: 18)
    }
    
    var boldExtraFontSize: UIFont {
        return UIFont.boldSystemFont(ofSize: 18)
    }
    
    var extremeFontSize: UIFont {
        return UIFont.systemFont(ofSize: 20)
    }
    
    var superFontSize: UIFont {
        return UIFont.systemFont(ofSize: 23)
    }
    
    var boldSuperFontSize: UIFont {
        return UIFont.boldSystemFont(ofSize: 23)
    }
    
    var boldExtremeFontSize: UIFont {
        return UIFont.boldSystemFont(ofSize: 20)
    }
    
    var alphaForButtonLikePlaceHolder: CGFloat {
        return 0.35
    }
    
    //GuestInformationScreen: Button continue
    var buttonContinueColor: UIColor {
        return #colorLiteral(red: 0.9685910344, green: 0.4269524217, blue: 0, alpha: 1)
    }
    
    var viewControlKeyboardBackground: UIColor {
        return #colorLiteral(red: 0.9716722148, green: 0.9716722148, blue: 0.9716722148, alpha: 1)
    }
    
    var buttonControlColor: UIColor {
        return #colorLiteral(red: 0.1078250334, green: 0.6280687451, blue: 0.8914822936, alpha: 1)
    }
    
    //GuestInformationScreen: Hoan tat
    var successButtonColor: UIColor {
        return #colorLiteral(red: 0.1078250334, green: 0.6280687451, blue: 0.8914822936, alpha: 1)
    }
    
    //GuestInformationScreen: View bound picker background
    var viewBoundPickerBackground: UIColor {
        return #colorLiteral(red: 0.8479338515, green: 0.8479338515, blue: 0.8479338515, alpha: 1)
    }
    
    static let mainColor: UIColor = #colorLiteral(red: 0.1005552337, green: 0.6265580654, blue: 0.8926903605, alpha: 1)
    static let defaultColor: UIColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    static let placeHolderColor: UIColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
    static let subColor: UIColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    static let lagreAlpha: CGFloat = 0.75
    static let mediumAlpha: CGFloat = 0.5
    static let smallAlpha: CGFloat = 0.25
}
