//
//  FlightInformationScreenController.swift
//  123bay
//
//  Created by hai on 6/16/17.
//  Copyright © 2017 123bay. All rights reserved.
//

import UIKit
import SnapKit

var isRoundTrip: Bool = true

//This controller show the information of guest flight

class FlightInformationScreenController: UIViewController {
    
    //MARK: - Create variables
    fileprivate var sumany: Int = 0
    fileprivate var total: Int = 0
    fileprivate var arrayOneWay: Array<String> = ["Bay đi", "Chi tiết giá"]
    fileprivate var arrayRoundTrip: Array<String> = ["Bay đi", "Bay về", "Chi tiết giá"]
    fileprivate var currentCell: TypeTripCell!
    fileprivate var isNightFlight: Bool!
    fileprivate var heightNightFlight: ConstraintMakerFinalizable!
    fileprivate var heightOfTableView: ConstraintMakerFinalizable!
    fileprivate var arrayDetailPrice: Array<DetailPrice> = Array<DetailPrice>()
    
    //First View Bound Title
    private var titleBarView: UIView = {
        let titleBarView = UIView()
        titleBarView.backgroundColor = Theme.mainColor
        return titleBarView
    }()
    
    //Label: Thông tin chuyến bay
    private var flightInformationLabel: UILabel = {
        let flightInformationLabel = UILabel()
        
        flightInformationLabel.textColor = Theme.defaultColor
        flightInformationLabel.font = Theme.shared.boldExtraFontSize

        return flightInformationLabel
    }()
    
    //Button: Đóng
    private var closeControllerButton: UIButton = {
        let btnClose = UIButton()
        
        btnClose.setTitleColor(Theme.defaultColor, for: UIControlState.normal)
        btnClose.titleLabel?.font = Theme.shared.boldLargeFontSize
        
        return btnClose
    }()
    
    //Second View bound detail of money
    private var totalMoneyView: UIView = {
        let totalMoneyView = UIView()
        totalMoneyView.backgroundColor = Theme.defaultColor
        return totalMoneyView
    }()
    
    //Label: Tổng giá tiền cho 8 khách
    private var titleTotalMoneyLabel: UILabel = {
        let titleTotalMoneyLabel = UILabel()
        
        titleTotalMoneyLabel.textColor = Theme.subColor
        titleTotalMoneyLabel.textAlignment = .center
        titleTotalMoneyLabel.font = Theme.shared.extraFontSize
        
        return titleTotalMoneyLabel
    }()
    
    //Label: 8.678.574 VND
    private var showTotalMoneyLabel: UILabel = {
        let showTotalMoneyLabel = UILabel()
        
        showTotalMoneyLabel.textColor = Theme.subColor
        showTotalMoneyLabel.textAlignment = .center
        showTotalMoneyLabel.font = Theme.shared.superFontSize
        return showTotalMoneyLabel
    }()
    
    //Label: Đã bao gồm thuế & phí hàng không
    private var cachedInfoLabel: UILabel = {
        let cachedInfoLabel = UILabel()
        
        cachedInfoLabel.textColor = Theme.subColor
        cachedInfoLabel.textAlignment = .center
        cachedInfoLabel.font = Theme.shared.extraFontSize
        
        return cachedInfoLabel
    }()
    
    //Third view bounds the collection title
    fileprivate var viewBoundCollectionView: UIView = {
        let viewBoundCollectionView = UIView()
        
        viewBoundCollectionView.backgroundColor = Theme.defaultColor
        viewBoundCollectionView.borderView(radius: 0, width: 1, color: Theme.shared.viewControlKeyboardBackground)
        return viewBoundCollectionView
    }()
    
    //Collection view shows title
    fileprivate lazy var typeTripCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let typeTripCollectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        layout.scrollDirection = .horizontal
        typeTripCollectionView.isScrollEnabled = false
        typeTripCollectionView.backgroundColor = Theme.defaultColor
        typeTripCollectionView.register(TypeTripCell.self, forCellWithReuseIdentifier: "TTCell")
        typeTripCollectionView.delegate = self
        typeTripCollectionView.dataSource = self
        
        return typeTripCollectionView
    }()
    
    //View: show detail
    fileprivate var detailView: UIView = {
        let detailView = UIView()
        detailView.backgroundColor = Theme.defaultColor
        return detailView
    }()
    
    //Content view same in Bay di and Bay ve
    fileprivate var viewBoundDetail: UIView = {
        let viewBoundDetail = UIView()
        viewBoundDetail.backgroundColor = Theme.defaultColor
        return viewBoundDetail
    }()
    
    //Destination 1
    fileprivate var airplaneCompanyLabel: UILabel = {
        let airplaneCompanyLabel = UILabel()
        
        airplaneCompanyLabel.textColor = Theme.subColor
        airplaneCompanyLabel.font = Theme.shared.boldLargeFontSize
        return airplaneCompanyLabel
    }()
    
    fileprivate var logoAirplaneCompanyImage: UIImageView = {
        let logoAirplaneCompanyImage = UIImageView()
        return logoAirplaneCompanyImage
    }()
    
    fileprivate var economyLabel: UILabel = {
        let economyLabel = UILabel()
        
        economyLabel.font = Theme.shared.normalFontSize
        economyLabel.textColor = Theme.shared.viewBoundPickerBackground
        
        return economyLabel
    }()
    
    fileprivate var nightFlightLabel: UILabel = {
        let nightFlightLabel = UILabel()
        
        nightFlightLabel.textColor = Theme.shared.viewBoundPickerBackground
        nightFlightLabel.font = Theme.shared.normalFontSize
        
        return nightFlightLabel
    }()
    
    //Destination 2
    fileprivate var goToLabel: UILabel = {
        let goToLabel = UILabel()
        
        goToLabel.textColor = Theme.subColor
        goToLabel.font = Theme.shared.boldNormalFontSize
        
        return goToLabel
    }()
    
    fileprivate var airport_GoToLabel: UILabel = {
        let airport_gt = UILabel()
        
        airport_gt.textColor = Theme.subColor
        airport_gt.font = Theme.shared.normalFontSize
        
        return airport_gt
    }()
    
    fileprivate var time_goToLabel: UILabel = {
        let time_gt = UILabel()
        
        time_gt.textColor = Theme.subColor
        time_gt.font = Theme.shared.normalFontSize
        
        return time_gt
    }()
    
    //Destination 3
    fileprivate var arriveAtLabel: UILabel = {
        let arriveAtLabel = UILabel()
        
        arriveAtLabel.textColor = Theme.subColor
        arriveAtLabel.font = Theme.shared.boldNormalFontSize
        
        return arriveAtLabel
    }()
    
    fileprivate var airport_ArriveAtLabel: UILabel = {
        let airport_aa = UILabel()
        
        airport_aa.textColor = Theme.subColor
        airport_aa.font = Theme.shared.normalFontSize
        
        return airport_aa
    }()
    
    //Line
    private var endLine: UILabel = {
        let endLine = UILabel()
        endLine.backgroundColor = Theme.shared.viewControlKeyboardBackground
        return endLine
    }()
    
    private var standLine: UILabel = {
        let standLine = UILabel()
        standLine.backgroundColor = Theme.shared.viewControlKeyboardBackground
        return standLine
    }()
    
    //Circle
    private var cachedForAutoLabel1: UILabel = {
        let cachedForAutoLabel1 = UILabel()
        cachedForAutoLabel1.isHidden = true
        return cachedForAutoLabel1
    }()
    
    private var cachedForAutoLabel2: UILabel = {
        let cachedForAutoLabel2 = UILabel()
        cachedForAutoLabel2.isHidden = true
        return cachedForAutoLabel2
    }()
    
    private var circleImage1: UIImageView = {
        let circleImg = UIImageView()
        
        circleImg.makeCircle(borderWidth: 1, Color: Theme.shared.viewBoundPickerBackground)
        circleImg.backgroundColor = Theme.defaultColor
        
        return circleImg
    }()
    
    private var circleImage2: UIImageView = {
        let circleImg = UIImageView()
        circleImg.backgroundColor = Theme.defaultColor
        return circleImg
    }()
    
    private var betweenLine: UILabel = {
        let betweenLine = UILabel()
        betweenLine.backgroundColor = Theme.shared.viewBoundPickerBackground
        return betweenLine
    }()
    
    //Time
    fileprivate var goTimeLabel: UILabel = {
        let goToTimeLabel = UILabel()
        
        goToTimeLabel.font = Theme.shared.boldNormalFontSize
        goToTimeLabel.textColor = Theme.subColor
        
        return goToTimeLabel
    }()
    
    fileprivate var arriveTimeLabel: UILabel = {
        let arriveTimeLabel = UILabel()
        
        arriveTimeLabel.font = Theme.shared.boldNormalFontSize
        arriveTimeLabel.textColor = Theme.subColor
        
        return arriveTimeLabel
    }()
    
    fileprivate var goDateLabel: UILabel = {
        let goDateLabel = UILabel()
        
        goDateLabel.textColor = Theme.subColor
        goDateLabel.font = Theme.shared.normalFontSize
        
        return goDateLabel
    }()
    
    fileprivate var arriveDateLabel: UILabel = {
        let arriveDateLabel = UILabel()
        
        arriveDateLabel.font = Theme.shared.normalFontSize
        arriveDateLabel.textColor = Theme.subColor
        
        return arriveDateLabel
    }()
    
    //Detail price table view
    fileprivate lazy var detailTableView: UITableView = {
        let detailTableView = UITableView(frame: CGRect.zero, style: UITableViewStyle.plain)
    
        detailTableView.separatorStyle = .none
        detailTableView.allowsSelection = false
        detailTableView.backgroundColor = Theme.defaultColor
        detailTableView.isScrollEnabled = false
        detailTableView.delegate = self
        detailTableView.dataSource = self
        detailTableView.isHidden = true
        detailTableView.register(DetailPriceCell.self, forCellReuseIdentifier: "DPCell")
        detailTableView.register(FooterForDetailPriceView.self, forHeaderFooterViewReuseIdentifier: "FFView")
        
        return detailTableView
    }()
    
    //MARK: viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = Theme.defaultColor
        setupForTitleBarView()
        setupForFlightInformation()
        setupForButtonClose()
        setupForTotalMoneyView()
        setupForTitleTotalMoney()
        setupForShowTotalMoney()
        setupForCachedInfo()
        setupForViewBoundCollectionView()
        setupForTypeTripCollectionView()
        setupForDetailView()
        setupForViewBoundDetail()
        //Destination 1
        setupForCompanyAirplane()
        setupForCompanyAirplaneLogo()
        setupForEconomyLabel()
        setupForNightFlightLabel()
        //Destination 2
        setupForGoToLabel()
        setupForAirportGoToLabel()
        setupForTimeGoToLabel()
        //Destination 3
        setupForArriveAtLabel()
        setupForAirportArriveAtLabel()
        //Line
        setupForEndLine()
        setupForStandLine()
        setupCachedForAutolayoutLabel1()
        setupCachedForAutolayoutLabel2()
        setupForBoldBetweenLine()
        //Circle
        setupForFirstCircle()
        setupForSecondCircle()
        //Time
        setupForTimeGo()
        setupForTimeArrive()
        setupForDateGo()
        setupForDateArrive()
        //Show First View
        showGoToView()
        //Show detailPrice
        setupForDetailTable()
        //Set data
        setData()
        //Add Action For Button
        closeFlightInformationScreen()
    }
    
    //MARK: - Set data
    func setData() {
        flightInformationLabel.text = "Thông tin chuyến bay"
        closeControllerButton.setTitle("Đóng", for: UIControlState.normal)
        titleTotalMoneyLabel.text = "Tổng giá tiền cho 8 khách"
        showTotalMoneyLabel.text = "8.678.574 VND"
        cachedInfoLabel.text = "Đã bao gồm thuế & phí hàng không"
        nightFlightLabel.text = "Chuyến bay khuya"
    }
    
    //MARK: - Close this controller
    func closeFlightInformationScreen() {
        closeControllerButton.addTarget(
            self, action: #selector(
                FlightInformationScreenController.closeButton_Pressed
            ), for: UIControlEvents.touchUpInside
        )
    }
    
    func closeButton_Pressed() {
        print("Trieu")
        //TODO: Trieu
    }
    
    override func viewDidLayoutSubviews() {
        //Make circle
        circleImage1.makeCircle(borderWidth: 1, Color: Theme.shared.viewBoundPickerBackground)
        circleImage2.makeCircle(borderWidth: 1, Color: Theme.shared.viewBoundPickerBackground)
    }
    
    //MARK: - Autolayout for elements
    private func setupForTitleBarView() {
        view.addSubview(titleBarView)
        titleBarView.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.height.equalToSuperview().dividedBy(10)
        }
    }
    
    private func setupForFlightInformation() {
        titleBarView.addSubview(flightInformationLabel)
        flightInformationLabel.snp.makeConstraints { (make) in
            make.bottom.equalTo(self.titleBarView)
            make.left.equalTo(self.titleBarView).offset(15)
            make.height.equalTo(self.titleBarView).dividedBy(2)
        }
    }
    
    private func setupForButtonClose() {
        titleBarView.addSubview(closeControllerButton)
        closeControllerButton.snp.makeConstraints { (make) in
            make.right.equalTo(self.titleBarView).offset(-15)
            make.bottom.equalTo(self.flightInformationLabel)
            make.height.equalTo(self.flightInformationLabel)
        }
    }
    
    private func setupForTotalMoneyView() {
        view.addSubview(totalMoneyView)
        totalMoneyView.snp.makeConstraints { (make) in
            make.top.equalTo(self.titleBarView.snp.bottom)
            make.left.equalTo(self.titleBarView)
            make.right.equalTo(self.titleBarView)
            make.height.equalToSuperview().dividedBy(6)
        }
    }
    
    private func setupForTitleTotalMoney() {
        totalMoneyView.addSubview(titleTotalMoneyLabel)
        titleTotalMoneyLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.totalMoneyView).offset(10)
            make.left.equalTo(self.totalMoneyView)
            make.right.equalTo(self.totalMoneyView)
            make.height.equalTo(self.totalMoneyView).dividedBy(4)
        }
    }
    
    private func setupForShowTotalMoney() {
        totalMoneyView.addSubview(showTotalMoneyLabel)
        showTotalMoneyLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.titleTotalMoneyLabel.snp.bottom)
            make.centerX.equalToSuperview()
            make.height.equalTo(self.totalMoneyView).dividedBy(4)
        }
    }
    
    private func setupForCachedInfo() {
        totalMoneyView.addSubview(cachedInfoLabel)
        cachedInfoLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.showTotalMoneyLabel.snp.bottom)
            make.centerX.equalToSuperview()
            make.height.equalTo(self.totalMoneyView).dividedBy(4)
        }
    }
    
    //View bound collection view
    private func setupForViewBoundCollectionView() {
        view.addSubview(viewBoundCollectionView)
        viewBoundCollectionView.snp.makeConstraints { (make) in
            make.top.equalTo(self.totalMoneyView.snp.bottom)
            make.width.equalToSuperview().multipliedBy(1.05)
            make.centerX.equalToSuperview()
            make.height.equalTo(self.totalMoneyView).dividedBy(2.5)
        }
    }
    
    //Collection view
    private func setupForTypeTripCollectionView() {
        viewBoundCollectionView.addSubview(typeTripCollectionView)
        typeTripCollectionView.snp.makeConstraints { (make) in
            make.top.equalTo(self.viewBoundCollectionView)
            make.bottom.equalTo(self.viewBoundCollectionView)
            make.left.equalTo(self.viewBoundCollectionView)
            make.right.equalTo(self.viewBoundCollectionView)
        }
    }
    
    //Show detail
    private func setupForDetailView() {
        view.addSubview(detailView)
        detailView.snp.makeConstraints { (make) in
            make.top.equalTo(self.viewBoundCollectionView.snp.bottom)
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
    
    //Cached for autolayout
    private func setupForViewBoundDetail() {
        detailView.addSubview(viewBoundDetail)
        viewBoundDetail.snp.makeConstraints({ (make) in
            make.top.equalTo(self.detailView)
            make.right.equalTo(self.detailView)
            make.bottom.equalTo(self.detailView)
            if isRoundTrip == false {
                make.width.equalTo(self.detailView).dividedBy(1.4)
            } else {
                make.width.equalTo(self.detailView).dividedBy(1.2)
            }
        })
    }
    
    
    //Destination 1
    private func setupForCompanyAirplane() {
        detailView.addSubview(airplaneCompanyLabel)
        airplaneCompanyLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.detailView).offset(5)
            make.left.equalTo(self.viewBoundDetail).offset(20)
            make.height.equalTo(30)
        }
    }
    
    private func setupForCompanyAirplaneLogo() {
        detailView.addSubview(logoAirplaneCompanyImage)
        logoAirplaneCompanyImage.snp.makeConstraints { (make) in
            make.top.equalTo(self.airplaneCompanyLabel)
            make.bottom.equalTo(self.airplaneCompanyLabel)
            make.left.equalTo(self.airplaneCompanyLabel.snp.right).offset(5)
            make.width.equalTo(60)
        }
    }
    
    private func setupForEconomyLabel() {
        detailView.addSubview(economyLabel)
        economyLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.airplaneCompanyLabel.snp.bottom)
            make.left.equalTo(self.airplaneCompanyLabel)
            make.height.equalTo(20)
        }
    }
    
    private func setupForNightFlightLabel() {
        detailView.addSubview(nightFlightLabel)
        nightFlightLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.economyLabel.snp.bottom)
            make.left.equalTo(self.airplaneCompanyLabel)
            heightNightFlight = make.height.equalTo(0)
        }
    }
    
    //Destination 2
    fileprivate func setupForGoToLabel() {
        detailView.addSubview(goToLabel)
        goToLabel.snp.makeConstraints { (make) in
            make.left.equalTo(self.airplaneCompanyLabel)
            make.height.equalTo(20)
            make.top.equalTo(self.nightFlightLabel.snp.bottom).offset(10)
        }
    }
    
    private func setupForAirportGoToLabel() {
        detailView.addSubview(airport_GoToLabel)
        airport_GoToLabel.snp.makeConstraints { (make) in
            make.left.equalTo(self.airplaneCompanyLabel)
            make.height.equalTo(20)
            make.top.equalTo(self.goToLabel.snp.bottom)
        }
    }
    
    private func setupForTimeGoToLabel() {
        detailView.addSubview(time_goToLabel)
        time_goToLabel.snp.makeConstraints { (make) in
            make.left.equalTo(self.airplaneCompanyLabel)
            make.height.equalTo(20)
            make.top.equalTo(self.airport_GoToLabel.snp.bottom)
        }
    }
    
    //Destination 3
    private func setupForArriveAtLabel() {
        detailView.addSubview(arriveAtLabel)
        arriveAtLabel.snp.makeConstraints { (make) in
            make.left.equalTo(self.airplaneCompanyLabel)
            make.height.equalTo(20)
            make.top.equalTo(self.time_goToLabel.snp.bottom).offset(10)
        }
    }
    
    private func setupForAirportArriveAtLabel() {
        detailView.addSubview(airport_ArriveAtLabel)
        airport_ArriveAtLabel.snp.makeConstraints { (make) in
            make.left.equalTo(self.airplaneCompanyLabel)
            make.height.equalTo(20)
            make.top.equalTo(self.arriveAtLabel.snp.bottom)
        }
    }
    
    //Line
    private func setupForEndLine() {
        detailView.addSubview(endLine)
        endLine.snp.makeConstraints { (make) in
            make.top.equalTo(self.airport_ArriveAtLabel.snp.bottom).offset(40)
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.height.equalTo(1)
        }
    }
    
    private func setupForStandLine() {
        detailView.addSubview(standLine)
        standLine.snp.makeConstraints { (make) in
            make.top.equalTo(self.viewBoundCollectionView.snp.bottom)
            make.left.equalTo(viewBoundDetail)
            make.width.equalTo(1)
            make.bottom.equalTo(self.endLine)
        }
    }
    
    private func setupForBoldBetweenLine() {
        detailView.addSubview(betweenLine)
        betweenLine.snp.makeConstraints { (make) in
            make.top.equalTo(self.cachedForAutoLabel1)
            make.bottom.equalTo(self.cachedForAutoLabel2)
            make.width.equalTo(1)
            make.centerX.equalTo(self.standLine)
        }
    }
    
    //Circle
    private func setupCachedForAutolayoutLabel1() {
        detailView.addSubview(cachedForAutoLabel1)
        cachedForAutoLabel1.snp.makeConstraints { (make) in
            make.centerY.equalTo(self.goToLabel)
            make.centerX.equalTo(self.standLine)
            make.width.equalTo(1)
            make.height.equalTo(1)
        }
    }
    
    private func setupCachedForAutolayoutLabel2() {
        detailView.addSubview(cachedForAutoLabel2)
        cachedForAutoLabel2.snp.makeConstraints { (make) in
            make.centerY.equalTo(self.arriveAtLabel)
            make.centerX.equalTo(self.standLine)
            make.width.equalTo(1)
            make.height.equalTo(1)
        }
    }
    private func setupForFirstCircle() {
        detailView.addSubview(circleImage1)
        circleImage1.snp.makeConstraints { (make) in
            make.centerX.equalTo(self.standLine)
            make.centerY.equalTo(self.goToLabel)
            make.height.equalTo(self.goToLabel).dividedBy(1.8)
            make.width.equalTo(self.circleImage1.snp.height)
        }
    }
    
    private func setupForSecondCircle() {
        detailView.addSubview(circleImage2)
        circleImage2.snp.makeConstraints { (make) in
            make.centerX.equalTo(self.standLine)
            make.centerY.equalTo(self.arriveAtLabel)
            make.height.equalTo(self.arriveAtLabel).dividedBy(1.8)
            make.width.equalTo(self.circleImage2.snp.height)
        }
    }
    
    //Time
    private func setupForTimeGo() {
        detailView.addSubview(goTimeLabel)
        goTimeLabel.snp.makeConstraints { (make) in
            make.centerY.equalTo(self.goToLabel)
            make.right.equalTo(self.standLine).offset(-10)
            make.height.equalTo(self.goToLabel)
        }
    }
    
    private func setupForTimeArrive() {
        detailView.addSubview(arriveTimeLabel)
        arriveTimeLabel.snp.makeConstraints { (make) in
            make.centerY.equalTo(self.arriveAtLabel)
            make.right.equalTo(self.standLine).offset(-10)
            make.height.equalTo(self.arriveAtLabel)
        }
    }
    
    private func setupForDateGo() {
        detailView.addSubview(goDateLabel)
        goDateLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.goTimeLabel.snp.bottom)
            make.right.equalTo(self.goTimeLabel)
            make.height.equalTo(self.goTimeLabel)
        }
    }
    
    private func setupForDateArrive() {
        detailView.addSubview(arriveDateLabel)
        arriveDateLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.arriveTimeLabel.snp.bottom)
            make.right.equalTo(self.arriveTimeLabel)
            make.height.equalTo(self.arriveTimeLabel)
        }
    }
    
    //Table view show detail
    private func setupForDetailTable() {
        view.addSubview(detailTableView)
        detailTableView.snp.makeConstraints { (make) in
            make.top.equalTo(self.viewBoundCollectionView.snp.bottom)
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            heightOfTableView = make.height.equalTo(100)
        }
    }
}

//MARK: - Collection view extension
extension FlightInformationScreenController: UICollectionViewDelegateFlowLayout, UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        var c: Int!
        if isRoundTrip == false {
            c = arrayOneWay.count
        } else {
            c = arrayRoundTrip.count
        }
        return c
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TTCell", for: indexPath) as? TypeTripCell else {
            return TypeTripCell()
        }
        
        if isRoundTrip == false {
            cell.setTitleForButtonTrip(text: arrayOneWay[indexPath.row])
            cell.setTagForButton(tag: indexPath.row)
            cell.typeTripButton.addTarget(self, action: #selector(self.addActionToShowView(_:)), for: UIControlEvents.touchUpInside)
        } else {
            cell.setTitleForButtonTrip(text: arrayRoundTrip[indexPath.row])
            cell.setTagForButton(tag: indexPath.row)
            cell.typeTripButton.addTarget(self, action: #selector(self.addActionToShowView(_:)), for: UIControlEvents.touchUpInside)
        }
        
        if indexPath.row == 0 {
            cell.fullAlphaForFirstRow()
            currentCell = cell
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        var size: CGSize!
        
        if isRoundTrip == false {
            size = CGSize(width: viewBoundCollectionView.frame.width/2, height: viewBoundCollectionView.frame.height)
        } else {
            size = CGSize(width: viewBoundCollectionView.frame.width/3, height: viewBoundCollectionView.frame.height)
        }
    
        return size
    }
    
    //Switch action between button
    func addActionToShowView(_ sender: UIButton) {
        currentCell.minAlphaForOtherRow()
        currentCell.typeTripButton = sender
        currentCell.typeTripButton.alpha = 1.0
        checkTagToShowView(tag: sender.tag)
    }
    
    private func checkTagToShowView(tag: Int) {
        switch tag {
        case 0:
            showGoToView()
            detailView.isHidden = false
            detailTableView.isHidden = true
            break
        case 1:
            if isRoundTrip == true {
                showArriveAtView()
                detailView.isHidden = false
                detailTableView.isHidden = true
            } else {
                detailTableView.isHidden = false
                detailView.isHidden = true
                addDatabase()
            }
            break
        case 2:
            detailTableView.isHidden = false
            detailView.isHidden = true
            addDatabase()
            break
        default:
            break
        }
    }
    
    //Action show each views for each controls
    fileprivate func showGoToView() {
        isNightFlight = false
        heightNightFlight.constraint.update(offset: 0)
        if isNightFlight == true {
            nightFlightLabel.isHidden = false
        } else {
            nightFlightLabel.isHidden = true
        }
        self.loadViewIfNeeded()
        airplaneCompanyLabel.text = "VietJet Air VJ-648"
        logoAirplaneCompanyImage.image = #imageLiteral(resourceName: "VIETJET")
        economyLabel.text = "ECONOMY"
        goToLabel.text = "TP HCM (SGN)"
        airport_GoToLabel.text = "Sân bay Tân Sơn Nhất"
        time_goToLabel.text = "Thời gian bay: 1 giờ 15 phút"
        arriveAtLabel.text = "Đà Nẵng (DAD)"
        airport_ArriveAtLabel.text = "Sân bay Đà Nẵng"
        goTimeLabel.text = "22:00"
        goDateLabel.text = "21 thg 6"
        arriveTimeLabel.text = "23:15"
        arriveDateLabel.text = "21 thg 6"
    }
    
    fileprivate func showArriveAtView() {
        isNightFlight = true
        heightNightFlight.constraint.update(offset: 20)
        if isNightFlight == true {
            nightFlightLabel.isHidden = false
        } else {
            nightFlightLabel.isHidden = true
        }
        self.loadViewIfNeeded()
        airplaneCompanyLabel.text = "VietJet Air VJ-649"
        logoAirplaneCompanyImage.image = #imageLiteral(resourceName: "VIETJET")
        economyLabel.text = "ECONOMY"
        goToLabel.text = "Đà Nẵng (DAD)"
        airport_GoToLabel.text = "Sân bay Đà Nẵng"
        time_goToLabel.text = "Thời gian bay: 1 giờ 15 phút"
        arriveAtLabel.text = "TP HCM (SGN)"
        airport_ArriveAtLabel.text = "Sân bay Tân Sơn Nhất"
        goTimeLabel.text = "23:55"
        goDateLabel.text = "22 thg 6"
        arriveTimeLabel.text = "01:10"
        arriveDateLabel.text = "23 thg 6"
    }
}

//MARK: - Table view extension
extension FlightInformationScreenController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayDetailPrice.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "DPCell", for: indexPath) as? DetailPriceCell else {
            return DetailPriceCell()
        }
        let data = arrayDetailPrice[indexPath.row]
        cell.setContentForCell(airplaneCompany: data.airplaneCompany, typeGuest: data.typeGuest, numberOfGuest: data.numberOfGuest, price: data.price)
        sumany = sumany + data.price
        total = sumany
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let viewShow = FooterForDetailPriceView()
        viewShow.setData(sumany: sumany, tax: "Đã bao gồm", total: total)
        return viewShow
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 122
    }
}

//MARK: - Add database
extension FlightInformationScreenController {
    fileprivate func addDatabase() {
        arrayDetailPrice.removeAll()
        arrayDetailPrice.append(DetailPrice(airplaneCompany: "Vietname Airlines", typeGuest: "Người lớn", numberOfGuest: 4, price: 10000000))
        arrayDetailPrice.append(DetailPrice(airplaneCompany: "Vietname Airlines", typeGuest: "Trẻ em", numberOfGuest: 1, price: 1844000))
        arrayDetailPrice.append(DetailPrice(airplaneCompany: "Vietname Airlines", typeGuest: "Em bé", numberOfGuest: 1, price: 281000))
        arrayDetailPrice.append(DetailPrice(airplaneCompany: "Hành lý SGN - DAD", typeGuest: "", numberOfGuest: 0, price: 0))
        arrayDetailPrice.append(DetailPrice(airplaneCompany: "Hành lý DAD - SGN", typeGuest: "", numberOfGuest: 0, price: 0))
        detailTableView.reloadData()
        setHeightForTableView()
    }
    
    fileprivate func setHeightForTableView() {
        heightOfTableView.constraint.update(offset: (arrayDetailPrice.count * 35) + 200)
        self.loadViewIfNeeded()
    }
}
