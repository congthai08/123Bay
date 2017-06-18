//
//  CalendarController.swift
//  123bay
//
//  Created by hai on 6/11/17.
//  Copyright © 2017 123bay. All rights reserved.
//

import UIKit
import JTAppleCalendar
import SnapKit

//This controller presents the calendar view
//User can chooses the "Ngay di" or "Ngay den"
//It shows special days

class CalendarController: UIViewController {
    
    //MARK: Create variables
    fileprivate let formatter = DateFormatter()
    fileprivate let cellDay = "DayCell"
    fileprivate let celebrationCell = "CelebrationCell"
    fileprivate let dayInWeekCell = "InfoDayCell"
    fileprivate var arrayDay: Array<String> = ["CN","TH 2","TH 3","TH 4","TH 5","TH 6","TH 7"]
    fileprivate var numberOfCalendarRows = 6
    fileprivate var currentCalendar = Calendar.current
    fileprivate var generateInDatesR: InDateCellGeneration = .forAllMonths
    fileprivate var generateOutDatesR: OutDateCellGeneration = .off
    fileprivate var firstDayOfWeek: DaysOfWeek = .sunday
    fileprivate var hasStrictBoundaries = true
    private let date = Date()
    private let now = Calendar.current
    fileprivate var year: Int!
    fileprivate var month: Int!
    fileprivate var day: Int!
    fileprivate var arrayIndexElement: Array<Int> = Array<Int>()
    fileprivate var arrayGlobalCalendarDate: Array<CelebrationDate> = Array<CelebrationDate>()
    fileprivate var currentArrayTotalShow: Array<CelebrationDate> = Array<CelebrationDate>()
    fileprivate var heightCelebrationtable: ConstraintMakerFinalizable!
    fileprivate var heightForViewBoundCelebrationtable: ConstraintMakerFinalizable!
    
    private var statusView: UIView = {
        let statusView = UIView()
        statusView.backgroundColor = Theme.shared.viewSelectDayColor
        return statusView
    }()
    
    private var statusLabel: UILabel = {
        let statusLabel = UILabel()
    
        statusLabel.font = Theme.shared.boldLargeSizeOfFont
        statusLabel.textColor = Theme.shared.selectDayColor
        
        return statusLabel
    }()
    
    private var infoView: UIView = {
        let infoView = UIView()
        infoView.backgroundColor = Theme.shared.infoViewColor
        return infoView
    }()
    
    private var infoLeftLable: UILabel = {
        let infoLeftLabel = UILabel()
        
        infoLeftLabel.font = Theme.shared.lessSizeOfFont
        infoLeftLabel.textColor = Theme.defaultColor
        
        return infoLeftLabel
    }()
    
    private lazy var infoRightLabel: UILabel = {
        let infoRightLabel = UILabel()
        
        infoRightLabel.font = Theme.shared.lessSizeOfFont
        infoRightLabel.textColor = Theme.defaultColor
        
        return infoRightLabel
    }()
    
    private lazy var besideInfoRightLabel: UILabel = {
        let besideInfoRightLabel = UILabel()
        
        besideInfoRightLabel.font = Theme.shared.tinySizeOfFont
        besideInfoRightLabel.textColor = Theme.defaultColor
        besideInfoRightLabel.alpha = Theme.lagreAlpha
        
        return besideInfoRightLabel
    }()
    
    private var calendarView: UIView = {
        let calendarView = UIView()
        calendarView.backgroundColor = Theme.defaultColor
        return calendarView
    }()
    
    private var segmentType: UISegmentedControl = {
        let segmentType = UISegmentedControl()
        
        segmentType.removeBorders()
        segmentType.isUserInteractionEnabled = false
        let segAttrIndex1: NSDictionary = [NSForegroundColorAttributeName: Theme.shared.unSelectedTextSegmentColor,NSFontAttributeName: Theme.shared.largeSizeOfFont]
        let segAttrIndex2: NSDictionary = [NSForegroundColorAttributeName: Theme.shared.selectedTextSegmentColor,NSFontAttributeName: Theme.shared.largeSizeOfFont]
        segmentType.setTitleTextAttributes(segAttrIndex1 as [NSObject : AnyObject], for: UIControlState.normal)
        segmentType.setTitleTextAttributes(segAttrIndex2 as [NSObject : AnyObject], for: UIControlState.selected)
        
        return segmentType
    }()
    
    fileprivate lazy var calendar: JTAppleCalendarView = {
        let calendar = JTAppleCalendarView()
        
        calendar.ibCalendarDelegate = self as AnyObject?
        calendar.ibCalendarDataSource = self as AnyObject?
        calendar.scrollDirection = .horizontal
        calendar.isPagingEnabled = true
        calendar.showsHorizontalScrollIndicator = false
        calendar.showsVerticalScrollIndicator = false
        calendar.minimumLineSpacing = 0
        calendar.minimumInteritemSpacing = 0
        calendar.backgroundColor = Theme.defaultColor
        calendar.register(DayCell.self, forCellWithReuseIdentifier: "DayCell")
        
        return calendar
    }()
    
    fileprivate lazy var dayTitleCollection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let dayTitleCollection = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        dayTitleCollection.border(cornerRadius: 0, borderWidth: 1, borderColor: #colorLiteral(red: 0.9053452795, green: 0.9053452795, blue: 0.9053452795, alpha: 1))
        dayTitleCollection.isScrollEnabled = false
        dayTitleCollection.backgroundColor = Theme.defaultColor
        dayTitleCollection.register(InforDayCell.self, forCellWithReuseIdentifier: "InfoDayCell")
        dayTitleCollection.delegate = self
        dayTitleCollection.dataSource = self
        
        return dayTitleCollection
    }()
    
    fileprivate lazy var celebrationTable: UITableView = {
        let celebrationTable = UITableView(frame: CGRect.zero, style: UITableViewStyle.plain)
        
        celebrationTable.separatorStyle = .none
        celebrationTable.allowsSelection = false
        celebrationTable.delegate = self
        celebrationTable.dataSource = self
        celebrationTable.backgroundColor = Theme.defaultColor
        celebrationTable.isScrollEnabled = false
        celebrationTable.register(CelebrationCell.self, forCellReuseIdentifier: "CelebrationCell")
        
        return celebrationTable
    }()
    
    private var monthView: UIView = {
        let monthView = UIView()
        monthView.backgroundColor = Theme.shared.monthViewColor
        return monthView
    }()
    
    private var monthTitleText: UILabel = {
        let monthTitleText = UILabel()
        
        monthTitleText.textColor = Theme.shared.monthTitleColor
        monthTitleText.textAlignment = .center
        monthTitleText.font = Theme.shared.boldExtraLargeSizeOfFont
        
        return monthTitleText
    }()
    
    private var viewBoundCelebrationTable: UIView = {
        let viewBoundCelebrationTable = UIView()
        viewBoundCelebrationTable.backgroundColor = Theme.shared.viewBoundCelebrationTableColor
        return viewBoundCelebrationTable
    }()
    
    //MARK: - ViewDidLoad

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = Theme.shared.calendarControllerColor
        year = now.component(.year, from: date)
        month = now.component(.month, from: date)
        day = now.component(.day, from: date)
        addGlobalCalendarCelebrationDay()
        setupForStatusView()
        setupForStatusLabel()
        setupForSegment()
        setupForInfoView()
        setupForInfoLeftLabel()
        setupForInfoRightLabel()
        setupForBesideInfoRightLabel()
        setupForMonthView()
        setupForMonthTitle()
        setupForInfoTitleDay()
        setupForCalendarView()
        setupForCalendarCollectionView()
        setupMonthsForCalendar()
        setupForViewBoundCelebrationTable()
        setupForCelebrationTable()
        getSpecialDayForCurrentMonth(currentMonth: month)
        //Set data
        setData()
    }
    
    //MARK: - Set data
    func setData() {
        statusLabel.text = "Chọn ngày"
        segmentType.insertSegment(withTitle: "Chuyến bay đi", at: 0, animated: true)
        segmentType.insertSegment(withTitle: "Chuyến bay về", at: 1, animated: true)
        segmentType.selectedSegmentIndex = 0
        infoLeftLable.text = "Giá khứ hồi/khách"
        besideInfoRightLabel.text = "Chuyến bay đi"
        infoRightLabel.text = "Chủ nhật, 05/05/2017"
    }
    
    //MARK: - Layout for element
    //View store title
    private func setupForStatusView() {
        view.addSubview(statusView)
        statusView.snp.makeConstraints { (make) in
            make.top.equalTo(self.topLayoutGuide.snp.bottom)
            make.width.equalToSuperview()
            make.height.equalTo(30)
            make.centerX.equalToSuperview()
        }
    }
    
    //Title: Chon ngay
    private func setupForStatusLabel() {
        view.addSubview(statusLabel)
        statusLabel.snp.makeConstraints { (make) in
            make.centerY.equalTo(self.statusView)
            make.left.equalTo(20)
            make.width.equalTo(120)
            make.height.equalTo(self.statusView)
        }
    }
    
    //Segement: Chon ngay di - Chon ngay ve
    private func setupForSegment() {
        view.addSubview(segmentType)
        segmentType.snp.makeConstraints { (make) in
            make.top.equalTo(self.statusView.snp.bottom).offset(0.5)
            make.centerX.equalToSuperview()
            make.height.equalTo(30)
            make.width.equalToSuperview()
        }
    }
    
    //View store Info
    private func setupForInfoView() {
        view.addSubview(infoView)
        infoView.snp.makeConstraints { (make) in
            make.top.equalTo(self.segmentType.snp.bottom).offset(2)
            make.width.equalToSuperview()
            make.centerX.equalToSuperview()
            make.height.equalTo(30)
        }
    }
    
    //Info text: Gia khu hoi/khach
    private func setupForInfoLeftLabel() {
        view.addSubview(infoLeftLable)
        infoLeftLable.snp.makeConstraints { (make) in
            make.centerY.equalTo(self.infoView)
            make.left.equalToSuperview().offset(20)
            make.height.equalTo(self.infoView)
        }
    }
    
    //Info text: Date Arrive
    private func setupForInfoRightLabel() {
        view.addSubview(infoRightLabel)
        infoRightLabel.snp.makeConstraints { (make) in
            make.centerY.equalTo(self.infoView)
            make.right.equalTo(self.infoView).offset(-5)
            make.height.equalTo(self.infoView)
        }
    }
    
    //Info text: Chuyen bay di/ Chuyen bay ve
    private func setupForBesideInfoRightLabel() {
        view.addSubview(besideInfoRightLabel)
        besideInfoRightLabel.snp.makeConstraints { (make) in
            make.centerY.equalTo(self.infoView)
            make.right.equalTo(self.infoRightLabel.snp.left).offset(-3)
            make.height.equalTo(self.infoView)
        }
    }
    
    //Month view store month
    private func setupForMonthView() {
        view.addSubview(monthView)
        monthView.snp.makeConstraints { (make) in
            make.top.equalTo(self.infoView.snp.bottom).offset(0)
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.height.equalTo(50)
        }
    }
    
    //Month text
    private func setupForMonthTitle() {
        view.addSubview(monthTitleText)
        monthTitleText.snp.makeConstraints { (make) in
            make.centerX.equalTo(monthView.snp.centerX)
            make.centerY.equalTo(monthView.snp.centerY)
            make.height.equalTo(self.monthView)
        }
    }
    
    //Collection view store title day: TH2 - TH3 - TH4 ...
    private func setupForInfoTitleDay() {
        view.addSubview(dayTitleCollection)
        dayTitleCollection.snp.makeConstraints { (make) in
            make.top.equalTo(self.monthView.snp.bottom).offset(0)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(1.01)
            make.height.equalTo(50)
        }
    }
    
    //View store calendar
    private func setupForCalendarView() {
        view.addSubview(calendarView)
        calendarView.snp.makeConstraints { (make) in
            make.top.equalTo(self.dayTitleCollection.snp.bottom).offset(0)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
    
    //Collection view store days in month
    private func setupForCalendarCollectionView() {
        view.addSubview(calendar)
        calendar.snp.makeConstraints { (make) in
            make.top.equalTo(self.calendarView.snp.top)
            make.left.equalTo(self.calendarView.snp.left)
            make.right.equalTo(self.calendarView.snp.right)
            make.height.equalTo(self.calendarView.snp.height).multipliedBy(3).dividedBy(1.8)
        }
    }
    
    //View bound Celebration table
    private func setupForViewBoundCelebrationTable() {
        view.addSubview(viewBoundCelebrationTable)
        viewBoundCelebrationTable.snp.makeConstraints { (make) in
            make.bottom.equalToSuperview()
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            self.heightForViewBoundCelebrationtable = make.height.equalTo(45)
        }
    }
    
    //Table view store special day in month
    private func setupForCelebrationTable() {
        view.addSubview(celebrationTable)
        celebrationTable.snp.makeConstraints { (make) in
            make.bottom.equalToSuperview().offset(-5)
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            self.heightCelebrationtable = make.height.equalTo(30)
        }
    }
    
    //MARK:
    //MARK: Control to show calendara
    //Modify the date format
    fileprivate func changeDateFormat() {
        formatter.dateFormat = "yyyy MM dd"
        formatter.timeZone = Calendar.current.timeZone
        formatter.locale = Calendar.current.locale
    }
    
    //Control for the cell is selected or not
    fileprivate func handleCellSelected(view: JTAppleCell?, cellState: CellState) {
        guard let validCell = view as? DayCell else { return }
        
        if validCell.isSelected {
            validCell.dayView.isHidden = false
        } else {
            validCell.dayView.isHidden = true
        }
    }
    
    //Control for each type of day
    fileprivate func handleCellTextColor(view: JTAppleCell?, cellState: CellState) {
        guard let validCell = view as? DayCell else { return }
        
        if cellState.isSelected  {
            validCell.dayLabel.textColor = Theme.shared.selectedDayTextColor
            validCell.todayLabel.textColor = Theme.shared.todayTextColorSelected
        } else {
            if cellState.dateBelongsTo == .thisMonth {
                if cellState.column() == 0 {
                    validCell.dayLabel.textColor = Theme.shared.sundayColor
                    validCell.todayLabel.textColor = Theme.shared.todayTextColorUnselected
                    validCell.isUserInteractionEnabled = true
                } else {
                    validCell.dayLabel.textColor = Theme.shared.belongMonthColor
                    validCell.todayLabel.textColor = Theme.shared.todayTextColorUnselected
                    validCell.isUserInteractionEnabled = true
                }
            } else {
                validCell.dayLabel.textColor = Theme.shared.unbelongMonthColor
                validCell.isUserInteractionEnabled = false
                validCell.todayLabel.textColor = Theme.shared.todayTextColorUnselected
            }
        }
    }
    
    //Control for today appear
    fileprivate func handleGetTodayAppear(view: JTAppleCell?, cellState: CellState) {
        guard let validCell = view as? DayCell else { return }
        
        changeDateFormat()
        
        let getDayMonthYearFormat = formatter.string(from: cellState.date)
        let arrayDayMonthYear = getDayMonthYearFormat.components(separatedBy: " ")
        let cellMonth = arrayDayMonthYear[1]
        let cellYear = arrayDayMonthYear[0]
        
        if Int(cellState.text) == Int(day) &&
            Int(cellMonth) == Int(month) &&
            Int(cellYear) == Int(year) {
            validCell.todayLabel.isHidden = false
        } else {
            validCell.todayLabel.isHidden = true
        }
    }
    
    //Control for past days
    fileprivate func handleBlurThePastDayInMonth(view: JTAppleCell?, cellState: CellState) {
        guard let validCell = view as? DayCell else { return }
        
        changeDateFormat()
        
        let getDayMonthYearFormat = formatter.string(from: cellState.date)
        let arrayDayMonthYear = getDayMonthYearFormat.components(separatedBy: " ")
        let cellMonth = arrayDayMonthYear[1]
        let cellYear = arrayDayMonthYear[0]
        
        if Int(cellState.text)! < Int(day) &&
            Int(cellMonth) == Int(month) &&
            Int(cellYear) == Int(year) {
            validCell.dayLabel.textColor = Theme.shared.oldDayColor
            validCell.isUserInteractionEnabled = false
        }
    }
    
    //Control for special days
    fileprivate func handleRedOnCelebrationDay(view: JTAppleCell?, cellState: CellState) {
        guard let validCell = view as? DayCell else { return }
        
        changeDateFormat()
        
        let getDayMonthFormat = formatter.string(from: cellState.date)
        let arrayDayMonthYear = getDayMonthFormat.components(separatedBy: " ")
        let cellMonth = arrayDayMonthYear[1]
        let cellDay = arrayDayMonthYear[2]
        
        
        for i in arrayGlobalCalendarDate {
            if i.day == Int(cellDay) && i.month == Int(cellMonth) {
                if i.day < day && i.month == month {
                    validCell.dayLabel.textColor = Theme.shared.oldDayColor
                } else {
                    validCell.dayLabel.textColor = Theme.shared.sundayColor
                }
            }
        }
    }
    
    //Show months
    fileprivate func setupMonthsForCalendar() {
        calendar.visibleDates({ (visibleDates) in
            self.showMonthsForCalendar(from: visibleDates)
        })
    }
    
    //Setup to show months
    fileprivate func showMonthsForCalendar(from visibleDates: DateSegmentInfo) {
        guard let date = visibleDates.monthDates.first?.date else { return }
        
        formatter.dateFormat = "dd/MMMM/YYYY"
        monthTitleText.text = formatter.string(from: date)
        
        if let monthYearArray = monthTitleText.text?.components(separatedBy: "/") {
            let showMonth = monthYearArray[1]
            let showYear = monthYearArray[2]
            
            switch showMonth {
            case "January":
                monthTitleText.text = "Tháng 1/\(showYear)"
                break
            case "February":
                monthTitleText.text = "Tháng 2/\(showYear)"
                break
            case "March":
                monthTitleText.text = "Tháng 3/\(showYear)"
                break
            case "April":
                monthTitleText.text = "Tháng 4/\(showYear)"
                break
            case "May":
                monthTitleText.text = "Tháng 5/\(showYear)"
                break
            case "June":
                monthTitleText.text = "Tháng 6/\(showYear)"
                break
            case "July":
                monthTitleText.text = "Tháng 7/\(showYear)"
                break
            case "August":
                monthTitleText.text = "Tháng 8/\(showYear)"
                break
            case "September":
                monthTitleText.text = "Tháng 9/\(showYear)"
                break
            case "October":
                monthTitleText.text = "Tháng 10/\(showYear)"
                break
            case "November":
                monthTitleText.text = "Tháng 11/\(showYear)"
                break
            case "December":
                monthTitleText.text = "Tháng 12/\(showYear)"
                break
            default:
                break
            }
        }
    }
    
    //Filter the celebration array for each month
    fileprivate func getSpecialDayForMonth(getMonth: Int, getDay: Int) {
        for i in arrayGlobalCalendarDate {
            if i.month == getMonth && i.day == getDay {
                currentArrayTotalShow.append(i)
            }
        }
        setHeightForCelebrationTable()
    }
    
    //Filter the celebration array for current month
    fileprivate func getSpecialDayForCurrentMonth(currentMonth: Int) {
        for i in arrayGlobalCalendarDate {
            if i.month == currentMonth {
                currentArrayTotalShow.append(i)
            }
        }
        setHeightForCelebrationTable()
    }
    
    //Set height again for celebration table
    fileprivate func setHeightForCelebrationTable() {
        heightCelebrationtable.constraint.update(offset: currentArrayTotalShow.count * 30)
        if currentArrayTotalShow.count == 0 {
            heightForViewBoundCelebrationtable.constraint.update(offset: 0)
        } else {
            heightForViewBoundCelebrationtable.constraint.update(offset: currentArrayTotalShow.count * 30 + 15)
        }
        celebrationTable.reloadData()
    }
    
    //Modified again month
    fileprivate func modifiedMonth(month: String) -> Int {
        var m: Int!
        switch month {
        case "January":
            m = 1
            break
        case "February":
            m = 2
            break
        case "March":
            m = 3
            break
        case "April":
            m = 4
            break
        case "May":
            m = 5
            break
        case "June":
            m = 6
            break
        case "July":
            m = 7
            break
        case "August":
            m = 8
            break
        case "September":
            m = 9
            break
        case "October":
            m = 10
            break
        case "November":
            m = 11
            break
        case "December":
            m = 12
            break
        default:
            break
        }
        return m
    }
    
    //MARK:
    //MARK: Add database to array celebration
    //Add Global Celebration day into Array
    fileprivate func addGlobalCalendarCelebrationDay() {
        //Global
        arrayGlobalCalendarDate.append(CelebrationDate(day: 9, month: 1, name: "Ngày học sinh - sinh viên Việt Nam"))
        arrayGlobalCalendarDate.append(CelebrationDate(day: 3, month: 2, name: "Ngày thành lập Đảng Công Sản Việt Nam"))
        arrayGlobalCalendarDate.append(CelebrationDate(day: 27, month: 2, name: "Ngày Thầy thuốc Việt Nam"))
        arrayGlobalCalendarDate.append(CelebrationDate(day: 8, month: 3, name: "Ngày Quốc tế Phụ nữ"))
        arrayGlobalCalendarDate.append(CelebrationDate(day: 20, month: 3, name: "Ngày Quốc tế Hạnh phúc"))
        arrayGlobalCalendarDate.append(CelebrationDate(day: 22, month: 4, name: "Ngày Trái đất"))
        arrayGlobalCalendarDate.append(CelebrationDate(day: 30, month: 4, name: "Ngày Giải phóng miền Nam"))
        arrayGlobalCalendarDate.append(CelebrationDate(day: 1, month: 5, name: "Quốc tế lao động"))
        arrayGlobalCalendarDate.append(CelebrationDate(day: 7, month: 5, name: "Ngày chiến thắng Điện Biên Phủ"))
        arrayGlobalCalendarDate.append(CelebrationDate(day: 1, month: 6, name: "Ngày Quốc tế Thiếu nhi"))
        arrayGlobalCalendarDate.append(CelebrationDate(day: 2, month: 9, name: "Quốc khánh"))
        arrayGlobalCalendarDate.append(CelebrationDate(day: 3, month: 9, name: "Quốc khánh"))
        arrayGlobalCalendarDate.append(CelebrationDate(day: 4, month: 9, name: "Quốc khánh"))
        arrayGlobalCalendarDate.append(CelebrationDate(day: 20, month: 10, name: "Ngày thành lập Hội Phụ nữ Việt Nam"))
        arrayGlobalCalendarDate.append(CelebrationDate(day: 20, month: 11, name: "Ngày Nhà giáo Việt Nam"))
        arrayGlobalCalendarDate.append(CelebrationDate(day: 25, month: 12, name: "Ngày Lễ Giáng Sinh"))
        arrayGlobalCalendarDate.append(CelebrationDate(day: 1, month: 1, name: "Tết Dương Lịch"))
        //Asian
        arrayGlobalCalendarDate.append(CelebrationDate(day: 31, month: 12, name: "Tết Nguyên Đán"))
        arrayGlobalCalendarDate.append(CelebrationDate(day: 1, month: 1, name: "Tết Nguyên Đán"))
        arrayGlobalCalendarDate.append(CelebrationDate(day: 2, month: 1, name: "Tết Nguyên Đán"))
        arrayGlobalCalendarDate.append(CelebrationDate(day: 3, month: 1, name: "Tết Nguyên Đán"))
        arrayGlobalCalendarDate.append(CelebrationDate(day: 4, month: 1, name: "Tết Nguyên Đán"))
        arrayGlobalCalendarDate.append(CelebrationDate(day: 10, month: 3, name: "Giỗ Tổ Hùng Vương"))
        arrayGlobalCalendarDate.append(CelebrationDate(day: 15, month: 4, name: "Lễ Phật Đản"))
        arrayGlobalCalendarDate.append(CelebrationDate(day: 15, month: 7, name: "Vu Lan"))
        arrayGlobalCalendarDate.append(CelebrationDate(day: 15, month: 8, name: "Tết Trung thu"))
        arrayGlobalCalendarDate.append(CelebrationDate(day: 23, month: 12, name: "Ông Táo về trời"))
    }
}

//MARK:
//MARK: Calendar datasource
extension CalendarController: JTAppleCalendarViewDataSource {
    public func configureCalendar(_ calendar: JTAppleCalendarView) -> ConfigurationParameters {
        changeDateFormat()
        
        let startYear: String = year.description
        let startMonth: String = month.description
        let startDay: String = day.description
        let endYear: String = (year + 2).description
        let endMonth: String = month.description
        let endDay: String = day.description
        let start = formatter.date(from: startYear + " " + startMonth + " " + startDay)!
        let end = formatter.date(from: endYear + " " + endMonth + " " + endDay)!
        let parameter = ConfigurationParameters(startDate: start, endDate: end, numberOfRows: numberOfCalendarRows, calendar: currentCalendar, generateInDates: generateInDatesR, generateOutDates: generateOutDatesR, firstDayOfWeek: firstDayOfWeek, hasStrictBoundaries: hasStrictBoundaries)
        
        return parameter
    }
}

//MARK:
//MARK: Calendar delegate
extension CalendarController: JTAppleCalendarViewDelegate {
    func calendar(_ calendar: JTAppleCalendarView, cellForItemAt date: Date, cellState: CellState, indexPath: IndexPath) -> JTAppleCell {
        guard let cell = calendar.dequeueReusableJTAppleCell(withReuseIdentifier: cellDay, for: indexPath) as? DayCell else {
            return JTAppleCell()
        }
        
        cell.setTextForDay(text: cellState.text)
        
        handleGetTodayAppear(view: cell, cellState: cellState)
        handleCellTextColor(view: cell, cellState: cellState)
        handleCellSelected(view: cell, cellState: cellState)
        handleBlurThePastDayInMonth(view: cell, cellState: cellState)
        handleRedOnCelebrationDay(view: cell, cellState: cellState)
        return cell
    }
    
    func calendar(_ calendar: JTAppleCalendarView, didSelectDate date: Date, cell: JTAppleCell?, cellState: CellState) {
        handleCellTextColor(view: cell, cellState: cellState)
        handleCellSelected(view: cell, cellState: cellState)
        changeDateFormat()
        print(formatter.string(from: cellState.date))
    }
    
    func calendar(_ calendar: JTAppleCalendarView, didDeselectDate date: Date, cell: JTAppleCell?, cellState: CellState) {
        handleCellTextColor(view: cell, cellState: cellState)
        handleCellSelected(view: cell, cellState: cellState)
    }
    
    func calendar(_ calendar: JTAppleCalendarView, didScrollToDateSegmentWith visibleDates: DateSegmentInfo) {
        showMonthsForCalendar(from: visibleDates)
        currentArrayTotalShow.removeAll()
        for i in visibleDates.monthDates {
            let c = formatter.string(from: i.date)
            formatter.date(from: "MM/dd")
            let arrC = c.components(separatedBy: "/")
            let showMonth = arrC[1]
            let showDay = arrC[0]
            let mMonth = modifiedMonth(month: showMonth)
            getSpecialDayForMonth(getMonth: mMonth, getDay: Int(showDay)!)
        }
    }
}

//MARK:
//MARK: Collectionview stores days per week
extension CalendarController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrayDay.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: dayInWeekCell, for: indexPath) as? InforDayCell else {
            return UICollectionViewCell()
        }
        
        cell.setTextForDayPerWeek(text: arrayDay[indexPath.row])
        
        if indexPath.row == 0 {
            cell.labelDay.textColor = Theme.shared.sundayColor
        } else {
            cell.labelDay.textColor = Theme.shared.normalDayColor
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.view.frame.width/7, height: 30)
    }
}

//MARK:
//MARK: Tableview stores special days
extension CalendarController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var c: Int!
        if currentArrayTotalShow.count > 0 {
            c = currentArrayTotalShow.count
        } else {
            c = 0
        }
        return c
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: celebrationCell, for: indexPath) as? CelebrationCell else {
            return UITableViewCell()
        }
        let day = currentArrayTotalShow[indexPath.row].day
        let month = currentArrayTotalShow[indexPath.row].month
        let name = currentArrayTotalShow[indexPath.row].name
        
        cell.setTextForSpecialDay(day: "\(day)", month: "\(month)", name: name)
        cell.backgroundColor = Theme.shared.celebrationCellColor
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 30
    }
}
