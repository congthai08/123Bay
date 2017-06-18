//
//  ExtensionFindFlightController.swift
//  123bay
//
//  Created by Os on 5/27/17.
//  Copyright © 2017 123bay. All rights reserved.
//

import UIKit

extension FindFlightController: UITableViewDelegate, UITableViewDataSource {
    //MARK: - Number items
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayTitle.count
    }
    
    //MARK: - Setup View for cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.item == 0 || indexPath.item == 1 || indexPath.item == 5 {
            let cell = tableView.dequeueReusableCell(withIdentifier: cellFindFlightTextId, for: indexPath) as! FindFlightTextCell
            
            cell.labelTitle.text = arrayTitle[indexPath.item]
            cell.imageIcon.image = UIImage(named: arrayNameIcon[indexPath.item])
            cell.selectionStyle = .none
            
            if indexPath.item == 0 {
                cell.place = userInfoTicket.departure
            } else if indexPath.item == 1 {
                cell.place = userInfoTicket.destination
            } else {
                cell.place = userInfoTicket.typeClass
            }
            
            return cell
        } else if indexPath.item == 2 {
            let cell = tableView.dequeueReusableCell(withIdentifier: cellFindFlightDateId, for: indexPath) as! FindFlightDateCell
            
            cell.labelTitle.text = arrayTitle[indexPath.item]
            cell.imageIcon.image = UIImage(named: arrayNameIcon[indexPath.item])
            cell.dateTravel = userInfoTicket.dateDepart
            cell.selectionStyle = .none
            
            return cell
            
        } else if indexPath.item == 3 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: cellFindFlightSwitchId, for: indexPath) as? FindFlightSwitchCell else { return UITableViewCell() }
            
            cell.findFlight = self
            cell.labelTitle.text = arrayTitle[indexPath.item]
            cell.imageIcon.image = UIImage(named: arrayNameIcon[indexPath.item])
            cell.roundTicket = userInfoTicket.roundTicket
            cell.selectionStyle = .none
            
            if isSwitchOn {
                cell.switchTicket.isOn = true
            } else {
                cell.switchTicket.isOn = false
            }
            
            return cell
            
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: cellFindFlightPersonId, for: indexPath) as? FindFlightPersonCell else { return UITableViewCell() }
            
            cell.labelTitle.text = arrayTitle[indexPath.item]
            cell.imageIcon.image = UIImage(named: arrayNameIcon[indexPath.item])
            cell.selectionStyle = .none
            cell.numberPasseger = userInfoTicket.numberPasseger
            
            return cell
            
        }
        
    }
    
    //MARK: - Setup size for items
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let heightCollectionViewCell = multipierCollectinViewCell * view.frame.height
        
        if indexPath.item == 3 && isSwitchOn {
            return heightCollectionViewCell * 2
        } else if indexPath.item == 3 && !isSwitchOn {
            return heightCollectionViewCell
        }
        
        return heightCollectionViewCell
    }
    
    //MARK: - Setup line spacing for 2 items
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    //MARK: - Select Cell
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.showDetailFindFlightController(index: indexPath.item)
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.item == 3 {
            (cell as! FindFlightSwitchCell).watchFrameChanges()
        }
    }
    
    func tableView(_ tableView: UITableView, didEndDisplaying cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.item == 3 {
            (cell as! FindFlightSwitchCell).igonreFrameChange()
        }
    }
}
