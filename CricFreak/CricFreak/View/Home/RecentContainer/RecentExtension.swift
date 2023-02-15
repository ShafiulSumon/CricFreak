//
//  RecentExtension.swift
//  CricFreak
//
//  Created by Admin on 15/2/23.
//

import Foundation
import UIKit

extension RecentContainerVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.recentNib, for: indexPath) as! RecentTblCell
        cell.stackView.layer.cornerRadius = 10
        cell.stackView.layer.masksToBounds = true
        cell.teamAimg.layer.cornerRadius = 20
        cell.teamBimg.layer.cornerRadius = 20
        
        cell.labelOne.text = "India Tour of New Zealand"
        cell.labelTwo.text = "3rd ODI at Delhi Stadium"
        cell.teamAimg.image = UIImage(named: "argentina-flag")
        cell.teamBimg.image = UIImage(named: "brazil-flag")
        cell.teamA.text = "IND"
        cell.teamB.text = "NZ"
        cell.runA.text = "200-8(20)"
        cell.runB.text = "203-2(15.2)"
        cell.labelResult.text = "New Zealand won by 8 wickets"
        
        return cell
    }
}
