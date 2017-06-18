//
//  GuestInformationScreenController.swift
//  123bay
//
//  Created by hai on 6/14/17.
//  Copyright © 2017 123bay. All rights reserved.
//

import UIKit
import SnapKit

//This controller shows the information which is required to fill by guest

class GuestInformationScreenController: UIViewController {

    //MARK:
    //MARK: Create variables
    
    fileprivate var bottomOfViewControlKeyboard: ConstraintMakerFinalizable!
    fileprivate let arraySex: Array<String> = ["","Ông","Bà","Cô"]
    fileprivate var selectedIndex: Int = 0
    
    //MainView store all
    private var mainView: UIView = {
        let mainView = UIView()
        mainView.backgroundColor = Theme.subColor
        return mainView
    }()
    
    //View bound label type guest
    private var viewBoundTypeGuest: UIView = {
        let viewBoundTypeGuest = UIView()
        viewBoundTypeGuest.backgroundColor = Theme.defaultColor
        return viewBoundTypeGuest
    }()
    
    //Label: Type of Guest: Nguoi lon - tre em - ...
    private var typeGuestLabel: UILabel = {
        let typeGuestLabel = UILabel()
        
        typeGuestLabel.textColor = Theme.subColor
        typeGuestLabel.font = Theme.shared.boldLargeFontSize
        
        return typeGuestLabel
    }()
    
    //View store required information
    private var informationView: UIView = {
        let informationView = UIView()
        informationView.backgroundColor = Theme.defaultColor
        return informationView
    }()
    
    //View bound guest name
    private var viewBoundGuestName: UIView = {
        let viewBoundGuestName = UIView()
        viewBoundGuestName.backgroundColor = Theme.defaultColor
        return viewBoundGuestName
    }()
    
    //Textfield: Guest name
    fileprivate var guestNameTextfield: UITextField = {
        let guestNameTextfield = UITextField()
        let attr = [NSForegroundColorAttributeName: Theme.placeHolderColor,
                    NSFontAttributeName: Theme.shared.normalFontSize]
        let text = "Tên đệm và tên (Vd: Thi Ngoc)"
        
        guestNameTextfield.attributedPlaceholder =
            NSAttributedString(string: text, attributes: attr)
        
        return guestNameTextfield
    }()
    
    //Line: Guest name
    fileprivate var cachedLineGuestName: UILabel = {
        let cachedLine = UILabel()
        
        cachedLine.backgroundColor = Theme.placeHolderColor
        cachedLine.alpha = Theme.smallAlpha
        
        return cachedLine
    }()
    
    //View bound guest family
    private var viewBoundGuestFamily: UIView = {
        let viewBoundGuestFamily = UIView()
        viewBoundGuestFamily.backgroundColor = Theme.defaultColor
        return viewBoundGuestFamily
    }()
    
    //Textfield: Guest family
    fileprivate var guestFamilyTextfield: UITextField = {
        let guestFamilyTextfield = UITextField()
        let attr = [NSForegroundColorAttributeName: Theme.placeHolderColor,
                    NSFontAttributeName: Theme.shared.normalFontSize]
        let text = "Họ (Vd: Nguyen)"
        
        guestFamilyTextfield.attributedPlaceholder =
            NSAttributedString(string: text, attributes: attr)
        
        return guestFamilyTextfield
    }()
    
    //Line: Guest family
    private var cachedLineGuestFamily: UILabel = {
        let cachedLine = UILabel()
        
        cachedLine.backgroundColor = Theme.placeHolderColor
        cachedLine.alpha = Theme.smallAlpha
        
        return cachedLine
    }()
    
    //View bound guest sex
    private var viewBoundGuestSex: UIView = {
        let viewBoundGuestSex = UIView()
        viewBoundGuestSex.backgroundColor = Theme.defaultColor
        return viewBoundGuestSex
    }()
    
    //Textfield: Guest sex
    fileprivate var guestSexTextfield: UITextField = {
        let guestSexTextfield = UITextField()
        let attr = [NSForegroundColorAttributeName: Theme.placeHolderColor,
                    NSFontAttributeName: Theme.shared.normalFontSize]
        let text = "Danh xưng"

        guestSexTextfield.attributedPlaceholder =
            NSAttributedString(string: text, attributes: attr)
        
        return guestSexTextfield
    }()
    
    //Line: Guest sex
    private var cachedLineGuestSex: UILabel = {
        let cachedLine = UILabel()
        
        cachedLine.backgroundColor = Theme.placeHolderColor
        cachedLine.alpha = Theme.smallAlpha
        
        return cachedLine
    }()
    
    //View bound guest DoB
    private var viewBoundGuestDoB: UIView = {
        let viewBoundGuestDoB = UIView()
        viewBoundGuestDoB.backgroundColor = Theme.defaultColor
        return viewBoundGuestDoB
    }()
    
    //Textfield: Guest DoB
    fileprivate var guestDoBTextfield: UITextField = {
        let guestDoBTextfield = UITextField()
        let attr = [NSForegroundColorAttributeName: Theme.placeHolderColor,
                    NSFontAttributeName: Theme.shared.normalFontSize]
        let text = "Ngày sinh (Vd: 29/02/1990)"
        
        guestDoBTextfield.attributedPlaceholder =
            NSAttributedString(string: text, attributes: attr)
        
        return guestDoBTextfield
    }()
    
    //Line: Guest DoB
    private var cachedLineGuestDoB: UILabel = {
        let cachedLine = UILabel()
        
        cachedLine.backgroundColor = Theme.placeHolderColor
        cachedLine.alpha = Theme.smallAlpha
        
        return cachedLine
    }()
    
    //Hidden guest placeholder name label
    private var placeHolderGuestNameLabel: UILabel = {
        let placeHolderLabel = UILabel()
        
        placeHolderLabel.textColor = Theme.subColor
        placeHolderLabel.alpha = 0
        placeHolderLabel.font = Theme.shared.lessFontSize
        
        return placeHolderLabel
    }()
    
    //Hidden guest placeholder family label
    private var placeHolderGuestFamilyLabel: UILabel = {
        let placeHolderLabel = UILabel()
        
        placeHolderLabel.textColor = Theme.subColor
        placeHolderLabel.alpha = 0
        placeHolderLabel.font = Theme.shared.lessFontSize
        
        return placeHolderLabel
    }()
    
    //Hidden guest placeholder Sex label
    private var placeHolderGuestSexLabel: UILabel = {
        let placeHolderLabel = UILabel()
        
        placeHolderLabel.textColor = Theme.subColor
        placeHolderLabel.alpha = 0
        placeHolderLabel.font = Theme.shared.lessFontSize
        
        return placeHolderLabel
    }()
    
    //Hidden guest placeholder DoB label
    private var placeHolderGuestDoBLabel: UILabel = {
        let placeHolderLabel = UILabel()
        
        placeHolderLabel.textColor = Theme.subColor
        placeHolderLabel.alpha = 0
        placeHolderLabel.font = Theme.shared.lessFontSize
        
        return placeHolderLabel
    }()
    
    //Button: Continue
    private var continueButton: UIButton = {
        let continueButton = UIButton()
        
        continueButton.titleLabel?.font = Theme.shared.largeFontSize
        continueButton.setTitleColor(Theme.defaultColor, for: UIControlState.normal)
        continueButton.backgroundColor = Theme.shared.buttonContinueColor
        continueButton.border(radius: 5, width: 0, color: UIColor.clear)
        
        return continueButton
    }()
    
    //View: Control for keyboard
    fileprivate var viewKeyboardControl: UIView = {
        let viewKeyboardControl = UIView()
        
        viewKeyboardControl.isHidden = true
        viewKeyboardControl.backgroundColor = Theme.shared.viewControlKeyboardBackground
        
        return viewKeyboardControl
    }()
    
    //Button: Prev
    private var prevButton: UIButton = {
        let prevButton = UIButton()
        
        prevButton.setTitle("<", for: UIControlState.normal)
        prevButton.setTitleColor(Theme.shared.buttonControlColor, for: UIControlState.normal)
        prevButton.titleLabel?.font = Theme.shared.boldExtraFontSize
        return prevButton
    }()
    
    //Button: Next
    private var nextButton: UIButton = {
        let nextButton = UIButton()
        
        nextButton.setTitle(">", for: UIControlState.normal)
        nextButton.setTitleColor(Theme.shared.buttonControlColor, for: UIControlState.normal)
        nextButton.titleLabel?.font = Theme.shared.boldExtraFontSize
        
        return nextButton
    }()
    
    //Button: Hoan tat
    private var succesButton: UIButton = {
        let successButton = UIButton()
        
        successButton.setTitle("Hoàn tất", for: UIControlState.normal)
        successButton.setTitleColor(Theme.shared.successButtonColor, for: UIControlState.normal)
        successButton.titleLabel?.font = Theme.shared.boldLargeFontSize
        
        return successButton
    }()
    
    //Picker: Sex
    fileprivate var viewBoundPicker: UIView = {
        let viewBoundPicker = UIView()
        
        viewBoundPicker.backgroundColor = Theme.shared.viewBoundPickerBackground
        viewBoundPicker.isHidden = true
        
        return viewBoundPicker
    }()
    
    private lazy var pickerSexSelection: UIPickerView = {
        let pickerSexSelection = UIPickerView(frame: CGRect.zero)
        
        pickerSexSelection.delegate = self
        pickerSexSelection.dataSource = self
        
        return pickerSexSelection
    }()
    
    //MARK:
    //MARK: ViewdidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        setupForMainView()
        getKeyBoardNotification()
        setTextfieldDelegate()
        //Title
        setupForViewBoundTypeGuest()
        setupForTypeGuestLabel()
        //Main
        setupForViewStoreInfomation()
        //Guest Name
        setupForViewBoundGuestName()
        setupForGuestNameTextfield()
        setupForCachedLineGuestName()
        //Guest Family
        setupForViewBoundGuestFamily()
        setupForGuestFamilyTextfield()
        setupForCachedLineGuestFamily()
        //Guest Sex
        setupForViewBoundGuestSex()
        setupForGuestSexButton()
        setupForCachedLineGuestSex()
        //Guest DoB
        setupForViewBoundGuestDoB()
        setupForGuestDoBTextfield()
        setupForCachedLineGuestDoB()
        //Hidden label
        setupForHiddenLabelGuestName()
        setupForHiddenLabelGuestFamily()
        setupForHiddenLabelGuestDoB()
        setupForHiddenLabelGuestSex()
        //Continue button
        setupForButtonContinue()
        //View control keyboard
        setupForViewControlKeyboard()
        setupForPrevButtonControl()
        setupForNextButtonControl()
        setupForSuccessButtonControl()
        giveActionForButton()
        //Picker view
        setupForViewBoundPicker()
        setupForPickerGender()
        //Textfield did edit change
        setActionForTextfield()
        //Set Data
        setData()
    }
    
    //MARK: - Set Data
    func setData() {
        typeGuestLabel.text = "HÀNH KHÁCH NGƯỜI LỚN"
        placeHolderGuestNameLabel.text = "Tên đệm và tên (Vd: Thi Ngoc)"
        placeHolderGuestFamilyLabel.text = "Họ (Vd: Nguyen)"
        placeHolderGuestSexLabel.text = "Danh xưng"
        placeHolderGuestDoBLabel.text = "Ngày sinh (Vd: 29/02/1990)"
        continueButton.setTitle("TIẾP TỤC", for: UIControlState.normal)
    }
    
    //MARK: - Setup for textfield
    private func setActionForTextfield() {
        //Guest Name
        guestNameTextfield.addTarget(self, action: #selector(GuestInformationScreenController.checkForGuestNameTextfield_EditChanged), for: UIControlEvents.editingChanged)
        guestNameTextfield.addTarget(self, action: #selector(GuestInformationScreenController.setSelectedIndexFor_GuestName), for: UIControlEvents.touchDown)
        //Guest Family
        guestFamilyTextfield.addTarget(self, action: #selector(GuestInformationScreenController.checkForGuestFamilyTextfield_EditChanged), for: UIControlEvents.editingChanged)
        guestFamilyTextfield.addTarget(self, action: #selector(GuestInformationScreenController.setSelectedIndexFor_GuestFamily), for: UIControlEvents.touchDown)
        //Guest Sex
        guestSexTextfield.addTarget(self, action: #selector(GuestInformationScreenController.checkForGuestSexTextfield_EditChanged), for: UIControlEvents.editingDidBegin)
        guestSexTextfield.addTarget(self, action: #selector(GuestInformationScreenController.checkForGuestSexTextfield_EditChanged), for: UIControlEvents.editingChanged)
        guestSexTextfield.addTarget(self, action: #selector(GuestInformationScreenController.checkForGuestSexTextfield_EditChanged), for: UIControlEvents.touchDown)
        guestSexTextfield.addTarget(self, action: #selector(GuestInformationScreenController.setSelectedIndexFor_GuestSex), for: UIControlEvents.touchDown)
        //Guest DoB
        guestDoBTextfield.addTarget(self, action: #selector(GuestInformationScreenController.checkForGuestDoBTextfield_EditChanged), for: UIControlEvents.editingChanged)
        guestDoBTextfield.addTarget(self, action: #selector(GuestInformationScreenController.setSelectedIndexFor_GuestDoB), for: UIControlEvents.touchDown)
        
    }
    
    func checkForGuestNameTextfield_EditChanged() {
        viewBoundPicker.isHidden = true
        if guestNameTextfield.text != "" {
            animationMoveForEditTextfield(object: guestNameTextfield, isAction: true)
        } else {
            animationMoveForEditTextfield(object: guestNameTextfield, isAction: false)
        }
    }
    
    func checkForGuestFamilyTextfield_EditChanged() {
        viewBoundPicker.isHidden = true
        if guestFamilyTextfield.text != "" {
            animationMoveForEditTextfield(object: guestFamilyTextfield, isAction: true)
        } else {
            animationMoveForEditTextfield(object: guestFamilyTextfield, isAction: false)
        }
       
    }
    
    func checkForGuestDoBTextfield_EditChanged() {
        viewBoundPicker.isHidden = true
        if guestDoBTextfield.text != "" {
            animationMoveForEditTextfield(object: guestDoBTextfield, isAction: true)
        } else {
            animationMoveForEditTextfield(object: guestDoBTextfield, isAction: false)
        }
    }
    
    func checkForGuestSexTextfield_EditChanged() {
        hideKeyboard()
        viewBoundPicker.isHidden = false
        viewKeyboardControl.isHidden = false
        bottomOfViewControlKeyboard.constraint.update(inset: viewBoundPicker.frame.height)
    }
    
    //Touch down for each textfield
    func setSelectedIndexFor_GuestName() {
        selectedIndex = 1
        print(selectedIndex)
    }
    
    func setSelectedIndexFor_GuestFamily() {
        selectedIndex = 2
        print(selectedIndex)
    }
    
    func setSelectedIndexFor_GuestSex() {
        selectedIndex = 3
        print(selectedIndex)
    }
    
    func setSelectedIndexFor_GuestDoB() {
        selectedIndex = 4
        print(selectedIndex)
    }
    
    fileprivate func animationMoveForEditTextfield(object: UITextField, isAction: Bool) {
        if isAction == true {
            UIView.animate(withDuration: 0.4, animations: {
                if object == self.guestNameTextfield {
                    self.placeHolderGuestNameLabel.alpha = Theme.shared.alphaForButtonLikePlaceHolder
                    self.placeHolderGuestNameLabel.layer.transform = CATransform3DMakeTranslation(0,-5,0)
                }
                if object == self.guestFamilyTextfield {
                    self.placeHolderGuestFamilyLabel.alpha = Theme.shared.alphaForButtonLikePlaceHolder
                    self.placeHolderGuestFamilyLabel.layer.transform = CATransform3DMakeTranslation(0,-5,0)
                }
                if object == self.guestDoBTextfield {
                    self.placeHolderGuestDoBLabel.alpha = Theme.shared.alphaForButtonLikePlaceHolder
                    self.placeHolderGuestDoBLabel.layer.transform = CATransform3DMakeTranslation(0,-5,0)
                }
                if object == self.guestSexTextfield {
                    self.placeHolderGuestSexLabel.alpha = Theme.shared.alphaForButtonLikePlaceHolder
                    self.placeHolderGuestSexLabel.layer.transform = CATransform3DMakeTranslation(0,-5,0)
                }
            })
        } else {
            UIView.animate(withDuration: 0, animations: {
                if object == self.guestNameTextfield {
                    self.placeHolderGuestNameLabel.layer.transform = CATransform3DIdentity
                }
                if object == self.guestFamilyTextfield {
                    self.placeHolderGuestFamilyLabel.layer.transform = CATransform3DIdentity
                }
                if object == self.guestDoBTextfield {
                    self.placeHolderGuestDoBLabel.layer.transform = CATransform3DIdentity
                }
                if object == self.guestSexTextfield {
                    self.placeHolderGuestSexLabel.layer.transform = CATransform3DIdentity
                }
            }, completion: { (finished) in
                if object == self.guestNameTextfield {
                    self.placeHolderGuestNameLabel.alpha = 0
                }
                if object == self.guestFamilyTextfield {
                    self.placeHolderGuestFamilyLabel.alpha = 0
                }
                if object == self.guestDoBTextfield {
                    self.placeHolderGuestDoBLabel.alpha = 0
                }
                if object == self.guestSexTextfield {
                    self.placeHolderGuestSexLabel.alpha = 0
                }
            })
        }
    }
    
    //MARK:
    //MARK: Add action for prev,next,success button
    private func giveActionForButton() {
        prevButton.addTarget(self, action: #selector(GuestInformationScreenController.prevButton_Pressed), for: UIControlEvents.touchUpInside)
        nextButton.addTarget(self, action: #selector(GuestInformationScreenController.nextButton_Pressed), for: UIControlEvents.touchUpInside)
        succesButton.addTarget(self, action: #selector(GuestInformationScreenController.successButton_Pressed), for: UIControlEvents.touchUpInside)
    }
    
    func prevButton_Pressed() {
        selectedIndex = selectedIndex - 1
        if selectedIndex < 1 {
            selectedIndex = 1
        }
        print(selectedIndex)
        checkSelectedIndex(index: selectedIndex)
    }
    
    func nextButton_Pressed() {
        selectedIndex = selectedIndex + 1
        if selectedIndex > 4 {
            selectedIndex = 4
        }
        print(selectedIndex)
        checkSelectedIndex(index: selectedIndex)
    }
    
    func successButton_Pressed() {
        selectedIndex = 0
        viewKeyboardControl.isHidden = true
        viewBoundPicker.isHidden = true
        hideKeyboard()
    }
    
    private func checkSelectedIndex(index: Int) {
        switch index {
        case 1:
            guestNameTextfield.becomeFirstResponder()
            break
        case 2:
            guestFamilyTextfield.becomeFirstResponder()
            break
        case 3:
            guestSexTextfield.becomeFirstResponder()
            viewBoundPicker.isHidden = false
            guestSexTextfield.resignFirstResponder()
            bottomOfViewControlKeyboard.constraint.update(inset: viewBoundPicker.frame.height)
            break
        case 4:
            guestDoBTextfield.becomeFirstResponder()
            break
        default:
            break
        }
    }
    
    //MARK:
    //MARK: Autolayout for elements
    private func setupForMainView() {
        view.addSubview(mainView)
        mainView.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(50)
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
    
    private func setupForViewBoundTypeGuest() {
        mainView.addSubview(viewBoundTypeGuest)
        viewBoundTypeGuest.snp.makeConstraints { (make) in
            make.top.equalTo(self.mainView)
            make.left.equalTo(self.mainView)
            make.right.equalTo(self.mainView)
            make.height.equalTo(self.mainView).dividedBy(11)
        }
    }
    
    private func setupForTypeGuestLabel() {
        viewBoundTypeGuest.addSubview(typeGuestLabel)
        typeGuestLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.viewBoundTypeGuest)
            make.left.equalTo(self.viewBoundTypeGuest).offset(15)
            make.height.equalTo(self.viewBoundTypeGuest)
        }
    }
    
    private func setupForViewStoreInfomation() {
        view.addSubview(informationView)
        informationView.snp.makeConstraints { (make) in
            make.top.equalTo(self.viewBoundTypeGuest.snp.bottom).offset(2)
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
    
    //Guest name
    private func setupForViewBoundGuestName() {
        informationView.addSubview(viewBoundGuestName)
        viewBoundGuestName.snp.makeConstraints { (make) in
            make.top.equalTo(self.informationView).offset(5)
            make.left.equalTo(self.informationView)
            make.right.equalTo(self.informationView)
            make.height.equalTo(self.informationView).dividedBy(12)
        }
    }
    
    private func setupForGuestNameTextfield() {
        viewBoundGuestName.addSubview(guestNameTextfield)
        guestNameTextfield.snp.makeConstraints { (make) in
            make.bottom.equalTo(self.viewBoundGuestName)
            make.left.equalTo(self.viewBoundGuestName).offset(20)
            make.right.equalTo(self.viewBoundGuestName).offset(-20)
            make.height.equalTo(self.viewBoundGuestName).dividedBy(1.5)
        }
    }
    
    private func setupForCachedLineGuestName() {
        viewBoundGuestName.addSubview(cachedLineGuestName)
        cachedLineGuestName.snp.makeConstraints { (make) in
            make.bottom.equalTo(self.viewBoundGuestName)
            make.left.equalTo(self.guestNameTextfield)
            make.right.equalTo(self.guestNameTextfield)
            make.height.equalTo(1)
        }
    }
    
    //Guest family
    private func setupForViewBoundGuestFamily() {
        informationView.addSubview(viewBoundGuestFamily)
        viewBoundGuestFamily.snp.makeConstraints { (make) in
            make.top.equalTo(self.viewBoundGuestName.snp.bottom)
            make.left.equalTo(self.informationView)
            make.right.equalTo(self.informationView)
            make.height.equalTo(self.viewBoundGuestName)
        }
    }
    
    private func setupForGuestFamilyTextfield() {
        viewBoundGuestFamily.addSubview(guestFamilyTextfield)
        guestFamilyTextfield.snp.makeConstraints { (make) in
            make.bottom.equalTo(self.viewBoundGuestFamily)
            make.left.equalTo(self.viewBoundGuestFamily).offset(20)
            make.right.equalTo(self.viewBoundGuestFamily).offset(-20)
            make.height.equalTo(self.viewBoundGuestFamily).dividedBy(1.5)
        }
    }
    
    private func setupForCachedLineGuestFamily() {
        viewBoundGuestFamily.addSubview(cachedLineGuestFamily)
        cachedLineGuestFamily.snp.makeConstraints { (make) in
            make.bottom.equalTo(self.viewBoundGuestFamily)
            make.left.equalTo(self.guestFamilyTextfield)
            make.right.equalTo(self.guestFamilyTextfield)
            make.height.equalTo(1)
        }
    }
    
    //Guest Sex
    private func setupForViewBoundGuestSex() {
        informationView.addSubview(viewBoundGuestSex)
        viewBoundGuestSex.snp.makeConstraints { (make) in
            make.top.equalTo(self.viewBoundGuestFamily.snp.bottom)
            make.left.equalTo(self.informationView)
            make.right.equalTo(self.informationView)
            make.height.equalTo(self.viewBoundGuestFamily)
        }
    }
    
    private func setupForGuestSexButton() {
        viewBoundGuestSex.addSubview(guestSexTextfield)
        guestSexTextfield.snp.makeConstraints { (make) in
            make.bottom.equalTo(self.viewBoundGuestSex)
            make.left.equalTo(self.viewBoundGuestSex).offset(20)
            make.right.equalTo(self.viewBoundGuestSex).offset(-20)
            make.height.equalTo(self.viewBoundGuestSex).dividedBy(1.5)
        }
    }
    
    private func setupForCachedLineGuestSex() {
        viewBoundGuestSex.addSubview(cachedLineGuestSex)
        cachedLineGuestSex.snp.makeConstraints { (make) in
            make.bottom.equalTo(self.viewBoundGuestSex)
            make.left.equalTo(self.guestSexTextfield)
            make.right.equalTo(self.guestSexTextfield)
            make.height.equalTo(1)
        }
    }
    
    //Guest DoB
    private func setupForViewBoundGuestDoB() {
        informationView.addSubview(viewBoundGuestDoB)
        viewBoundGuestDoB.snp.makeConstraints { (make) in
            make.top.equalTo(self.viewBoundGuestSex.snp.bottom)
            make.left.equalTo(self.informationView)
            make.right.equalTo(self.informationView)
            make.height.equalTo(self.viewBoundGuestSex)
        }
    }
    
    private func setupForGuestDoBTextfield() {
        viewBoundGuestDoB.addSubview(guestDoBTextfield)
        guestDoBTextfield.snp.makeConstraints { (make) in
            make.bottom.equalTo(self.viewBoundGuestDoB)
            make.left.equalTo(self.viewBoundGuestDoB).offset(20)
            make.right.equalTo(self.viewBoundGuestDoB).offset(-20)
            make.height.equalTo(self.viewBoundGuestDoB).dividedBy(1.5)
        }
    }
    
    private func setupForCachedLineGuestDoB() {
        viewBoundGuestDoB.addSubview(cachedLineGuestDoB)
        cachedLineGuestDoB.snp.makeConstraints { (make) in
            make.bottom.equalTo(self.viewBoundGuestDoB)
            make.left.equalTo(self.guestDoBTextfield)
            make.right.equalTo(self.guestDoBTextfield)
            make.height.equalTo(1)
        }
    }
    
    //Button continue
    private func setupForButtonContinue() {
        view.addSubview(continueButton)
        continueButton.snp.makeConstraints { (make) in
            make.top.equalTo(viewBoundGuestDoB.snp.bottom).offset(20)
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
            make.height.equalTo(self.viewBoundGuestDoB).dividedBy(1.3)
        }
    }
    
    //Hidden label when textfield is editing
    private func setupForHiddenLabelGuestName() {
        viewBoundGuestName.addSubview(placeHolderGuestNameLabel)
        placeHolderGuestNameLabel.snp.makeConstraints { (make) in
            make.bottom.equalTo(self.guestNameTextfield.snp.top).offset(15)
            make.left.equalTo(self.guestNameTextfield)
            make.right.equalTo(self.guestNameTextfield)
            make.height.equalTo(self.guestNameTextfield).dividedBy(1.2)
        }
    }
    
    private func setupForHiddenLabelGuestFamily() {
        viewBoundGuestFamily.addSubview(placeHolderGuestFamilyLabel)
        placeHolderGuestFamilyLabel.snp.makeConstraints { (make) in
            make.bottom.equalTo(self.guestFamilyTextfield.snp.top).offset(15)
            make.left.equalTo(self.guestFamilyTextfield)
            make.right.equalTo(self.guestFamilyTextfield)
            make.height.equalTo(self.guestFamilyTextfield).dividedBy(1.2)
        }
    }
    
    private func setupForHiddenLabelGuestDoB() {
        viewBoundGuestDoB.addSubview(placeHolderGuestDoBLabel)
        placeHolderGuestDoBLabel.snp.makeConstraints { (make) in
            make.bottom.equalTo(self.guestDoBTextfield.snp.top).offset(15)
            make.left.equalTo(self.guestDoBTextfield)
            make.right.equalTo(self.guestDoBTextfield)
            make.height.equalTo(self.guestDoBTextfield).dividedBy(1.2)
        }
    }
    
    private func setupForHiddenLabelGuestSex() {
        viewBoundGuestSex.addSubview(placeHolderGuestSexLabel)
        placeHolderGuestSexLabel.snp.makeConstraints { (make) in
            make.bottom.equalTo(self.guestSexTextfield.snp.top).offset(15)
            make.left.equalTo(self.guestSexTextfield)
            make.right.equalTo(self.guestSexTextfield)
            make.height.equalTo(self.guestSexTextfield).dividedBy(1.2)
        }
    }
    
    //View control keyboard
    private func setupForViewControlKeyboard() {
        informationView.addSubview(viewKeyboardControl)
        viewKeyboardControl.snp.makeConstraints { (make) in
            bottomOfViewControlKeyboard = make.bottom.equalTo(self.informationView)
            make.left.equalTo(self.informationView)
            make.right.equalTo(self.informationView)
            make.height.equalTo(self.informationView).dividedBy(14)
        }
    }
    
    private func setupForPrevButtonControl() {
        viewKeyboardControl.addSubview(prevButton)
        prevButton.snp.makeConstraints { (make) in
            make.top.equalTo(self.viewKeyboardControl)
            make.bottom.equalTo(self.viewKeyboardControl)
            make.left.equalTo(self.viewKeyboardControl).offset(15)
        }
    }
    
    private func setupForNextButtonControl() {
        viewKeyboardControl.addSubview(nextButton)
        nextButton.snp.makeConstraints { (make) in
            make.top.equalTo(self.viewKeyboardControl)
            make.bottom.equalTo(self.viewKeyboardControl)
            make.left.equalTo(self.prevButton.snp.right).offset(15)
        }
    }
    
    private func setupForSuccessButtonControl() {
        viewKeyboardControl.addSubview(succesButton)
        succesButton.snp.makeConstraints { (make) in
            make.top.equalTo(self.viewKeyboardControl)
            make.bottom.equalTo(self.viewKeyboardControl)
            make.right.equalTo(self.viewKeyboardControl).offset(-20)
        }
    }
    
    private func setupForViewBoundPicker() {
        informationView.addSubview(viewBoundPicker)
        viewBoundPicker.snp.makeConstraints { (make) in
            make.bottom.equalTo(self.informationView)
            make.left.equalTo(self.informationView)
            make.right.equalTo(self.informationView)
            make.height.equalTo(self.informationView).dividedBy(2.3)
        }
    }
    
    private func setupForPickerGender() {
        viewBoundPicker.addSubview(pickerSexSelection)
        pickerSexSelection.snp.makeConstraints { (make) in
            make.centerX.equalTo(self.viewBoundPicker.snp.centerX)
            make.centerY.equalTo(self.viewBoundPicker.snp.centerY)
            make.height.equalTo(self.viewBoundPicker).dividedBy(1.7)
            make.width.equalTo(self.viewBoundPicker)
        }
    }
}

//MARK:
//MARK: Extension to get Keyboard
extension GuestInformationScreenController: UITextFieldDelegate {
    fileprivate func setTextfieldDelegate() {
        guestNameTextfield.delegate = self
        guestFamilyTextfield.delegate = self
        guestDoBTextfield.delegate = self
        guestSexTextfield.delegate = self
    }
    fileprivate func hideKeyboard() {
        guestNameTextfield.resignFirstResponder()
        guestFamilyTextfield.resignFirstResponder()
        guestDoBTextfield.resignFirstResponder()
        guestSexTextfield.resignFirstResponder()
    }
    
    fileprivate func getKeyBoardNotification() {
        NotificationCenter.default.addObserver(self, selector: #selector(GuestInformationScreenController.keyboardWasShown(_:)), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
    }
    
    func keyboardWasShown(_ notification: NSNotification) {
        let info = notification.userInfo!
        let keyboardFrame: CGRect = (info[UIKeyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
        if guestNameTextfield.isEditing == true ||
            guestFamilyTextfield.isEditing == true ||
            guestDoBTextfield.isEditing == true {
            UIView.animate(withDuration: 0.1, animations: { () -> Void in
                self.bottomOfViewControlKeyboard.constraint.update(inset: keyboardFrame.size.height)
                self.viewKeyboardControl.isHidden = false
                self.viewBoundPicker.isHidden = true
                self.loadViewIfNeeded()
            })
        }
    }
}

//MARK:
//MARK: Picker sex extension
extension GuestInformationScreenController: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return arraySex.count
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let labelShowGender = UILabel()
        
        labelShowGender.textColor = Theme.subColor
        labelShowGender.font = Theme.shared.extremeFontSize
        labelShowGender.textAlignment = .center
        labelShowGender.text = arraySex[row]
        return labelShowGender
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 40
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch row {
        case 0:
            guestSexTextfield.text = ""
            animationMoveForEditTextfield(object: guestSexTextfield, isAction: false)
            break
        case 1:
            guestSexTextfield.text = "Ông"
            animationMoveForEditTextfield(object: guestSexTextfield, isAction: true)
            break
        case 2:
            guestSexTextfield.text = "Bà"
            animationMoveForEditTextfield(object: guestSexTextfield, isAction: true)
            break
        case 3:
            guestSexTextfield.text = "Cô"
            animationMoveForEditTextfield(object: guestSexTextfield, isAction: true)
            break
        default:
            break
        }
    }
}
