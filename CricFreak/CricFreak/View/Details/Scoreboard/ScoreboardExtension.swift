//
//  ScoreboardExtension.swift
//  CricFreak
//
//  Created by Admin on 20/2/23.
//

import Foundation
import UIKit

extension ScoreboardVC: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(section == 0) {
            return tableDataBat.count
        }
        else {
            return tableDataBowl.count
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.ScoreTblCell, for: indexPath) as! ScoreboardTVC
        
        cell.backgroundColor = .white
        if(indexPath.section == 0) {
            cell.label_a.text = tableDataBat[indexPath.row].name
            cell.label_b.text = String(tableDataBat[indexPath.row].runORover)
            cell.label_c.text = String(tableDataBat[indexPath.row].bowlORmedians)
            cell.label_d.text = String(tableDataBat[indexPath.row].fourORrun)
            cell.label_e.text = String(tableDataBat[indexPath.row].sixORwicket)
            cell.label_f.text = String(tableDataBat[indexPath.row].srORer)
            if(tableDataBat[indexPath.row].flag == 1) {
                cell.backgroundColor = UIColor(red: 229/255, green: 255/255, blue: 231/255, alpha: 0.8)
            }
        }
        else {
            cell.label_a.text = tableDataBowl[indexPath.row].name
            cell.label_b.text = String(tableDataBowl[indexPath.row].runORover)
            cell.label_c.text = String(tableDataBowl[indexPath.row].bowlORmedians)
            cell.label_d.text = String(tableDataBowl[indexPath.row].fourORrun)
            cell.label_e.text = String(tableDataBowl[indexPath.row].sixORwicket)
            cell.label_f.text = String(tableDataBowl[indexPath.row].srORer)
        }
        
        return cell
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.ScoreTblCell) as! ScoreboardTVC
        
        if(section == 0) {
            cell.label_a.text = "Batter"
            cell.label_b.text = "R"
            cell.label_c.text = "B"
            cell.label_d.text = "4s"
            cell.label_e.text = "6s"
            cell.label_f.text = "SR"
        }
        else {
            cell.label_a.text = "Bowler"
            cell.label_b.text = "O"
            cell.label_c.text = "M"
            cell.label_d.text = "R"
            cell.label_e.text = "W"
            cell.label_f.text = "ER"
        }
        
        cell.backgroundColor = .lightGray
        cell.layer.cornerRadius = 5
        
        return cell
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
}
