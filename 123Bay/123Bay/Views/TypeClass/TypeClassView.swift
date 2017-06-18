//
//  TypeClassView.swift
//  123bay
//
//  Created by Os on 5/31/17.
//  Copyright © 2017 123bay. All rights reserved.
//

import Foundation
import UIKit

/*
 This class display view for Type Class
 Content TableView and Button
 */
class TypeClassView: BaseUIView {
    
    //MARK: Create Variable
    
    var typeClassController: TypeClassController?
    let arrayTitleTypeClass = ["Tiết kiệm", "Phổ thông", "Thương gia"]
    fileprivate let cellTableViewTypeClassId = "cellTableViewTypeClassId"
    fileprivate let multipilerTableViewCell: CGFloat = 0.22
    
    //MARK: Create Object
    lazy var tableViewTypeClass: UITableView = {
        let tableView = UITableView()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.showsVerticalScrollIndicator = false
        tableView.register(TypeClassCell.self, forCellReuseIdentifier: "cellTableViewTypeClassId")
        tableView.separatorColor = UIColor.clear
        tableView.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        return tableView
        
    }()
    
    var buttonDone: UIButton = {
        let button = UIButton()
        
        button.backgroundColor = UIColor.rgbColor(red: 249, green: 109, blue: 32, alpha: 1)
        button.setTitle("Hoàn tất", for: UIControlState.normal)
        button.layer.cornerRadius = 5
        button.layer.masksToBounds = true
        return button
    }()
    
    //MARK: Initialize function
    override func setupView() {
        super.setupView()
        self.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        setupViewTableView()
        setupViewButtonDone()
        
        let indexPath = IndexPath(row: 0, section: 0)
        tableViewTypeClass.selectRow(at: indexPath, animated: true, scrollPosition: UITableViewScrollPosition(rawValue: 0)!)
    }
    
    func selectRow(index: Int) {
        let indexPath = IndexPath(row: index, section: 0)
        tableViewTypeClass.selectRow(at: indexPath, animated: true, scrollPosition: UITableViewScrollPosition(rawValue: 0)!)
    }
    
    //MARK: function setupView
    func setupViewTableView() {
        addSubview(tableViewTypeClass)
        tableViewTypeClass.snp.makeConstraints { (make) in
            make.width.equalToSuperview()
            make.height.equalToSuperview()
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
    
    func setupViewButtonDone() {
        addSubview(buttonDone)
        buttonDone.snp.makeConstraints { (make) in
            make.width.equalToSuperview().multipliedBy(0.8)
            make.height.equalToSuperview().multipliedBy(0.2)
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().offset(-15)
        }
    }
    
    //MARK: Other function
    
    
}

//MARK: - Extension TypeClassView
extension TypeClassView: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayTitleTypeClass.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellTableViewTypeClassId, for: indexPath) as! TypeClassCell
        cell.selectionStyle = .none
        cell.labelTitle.text = arrayTitleTypeClass[indexPath.item]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return (multipilerTableViewCell * self.frame.height)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        typeClassController?.hide()
    }
}

