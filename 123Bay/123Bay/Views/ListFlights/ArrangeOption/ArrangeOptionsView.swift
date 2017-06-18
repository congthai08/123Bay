//
//  ArrangeOptionsView.swift
//  123bay
//
//  Created by Huỳnh Công Thái on 6/6/17.
//  Copyright © 2017 123bay. All rights reserved.
//

import UIKit
import SnapKit

/*
    This class display tableview which have contanted
    about an arrange list.
*/
class ArrangeOtionsView: BaseUIView {
    
    // MARK: Define Variable
    static let arrangeOptionsCellId: String = "ArrangeOptionsTableViewCell"
    
    // MARK: Define controls
    private var titleLabel: UILabel = {
        let label: UILabel = UILabel()
        
        label.text = "  SẮP XẾP THEO"
        label.font = UIFont.boldFont(Dimension.shared.subTitleFontSize)
        label.textColor = Theme.shared.sourceAndDestinationColor
        
        return label
    }()
    
    private lazy var contentTableView: UITableView = {
        let tableView: UITableView = UITableView(frame: .zero, style: .plain)
        
        tableView.register(
            ArrangeOptionsTableViewCell.self,
            forCellReuseIdentifier: arrangeOptionsCellId
        )
        tableView.separatorStyle = .none
        tableView.delegate = self
        tableView.dataSource = self
        
        return tableView
    }()
    
    private var doneButton: UIButton = {
        let button: UIButton = UIButton()
        
        button.setTitle("ĐÓNG", for: .normal)
        button.setTitleColor(Theme.defaultColor, for: .normal)
        button.backgroundColor = Theme.shared.backgroundButtonColor
        button.layer.cornerRadius = 5
        
        return button
    }()
    
    //MARK: Setup layout
    private func setupTitleLabel() {
        self.addSubview(self.titleLabel)
        
        self.titleLabel.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.left.equalToSuperview().offset(Dimension.normalMargin)
            make.right.equalToSuperview().offset(Dimension.normalMarginInverse)
            make.height.equalTo(Dimension.shared.subTitleFontSize * 4)
        }
    }
    
    private func drawLineTitleLabel() {
        let path = UIBezierPath()
        let lineLayer = CAShapeLayer()
        
        path.move(to: CGPoint(x: 0, y: self.titleLabel.frame.height))
        path.addLine(to: CGPoint(x: self.titleLabel.frame.width, y: self.titleLabel.frame.height))
        lineLayer.path = path.cgPath
        lineLayer.lineWidth = 1
        lineLayer.strokeColor = Theme.shared.lineColor.cgColor
        self.titleLabel.layer.addSublayer(lineLayer)
    }
    
    private func setupContentTableView() {
        self.addSubview(self.contentTableView)
        
        self.contentTableView.snp.makeConstraints { (make) in
            make.top.equalTo(self.titleLabel.snp.bottom).offset(Dimension.smallMargin)
            make.left.equalToSuperview().offset(Dimension.normalMargin)
            make.right.equalToSuperview().offset(Dimension.normalMarginInverse)
            make.bottom.equalTo(self.doneButton.snp.top)
        }
    }
    
    private func setupDoneButton() {
        self.addSubview(self.doneButton)
        self.doneButton.snp.makeConstraints { (make) in
            make.left.right.equalTo(self.titleLabel)
            make.bottom.equalToSuperview().offset(Dimension.normalMarginInverse)
            make.height.equalTo(Dimension.shared.titleFontSize * 3)
        }
    }
    
    func addTargetForButton(_ target: Any?, selector: Selector){
        self.doneButton.addTarget(target, action: selector, for: .touchUpInside)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        drawLineTitleLabel()
    }
    
    override func setupView() {
        self.backgroundColor = Theme.defaultColor
        self.setupTitleLabel()
        self.setupDoneButton()
        self.setupContentTableView()
    }
    
    func setValue() {
        
    }
}

extension ArrangeOtionsView: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: ArrangeOtionsView.arrangeOptionsCellId,
            for: indexPath
        ) as! ArrangeOptionsTableViewCell
        cell.textLabel?.text = "●  Sắp sếp theo"
        return cell
    }
}
