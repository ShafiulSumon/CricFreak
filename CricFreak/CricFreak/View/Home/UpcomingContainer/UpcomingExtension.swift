//
//  UpcomingExtension.swift
//  CricFreak
//
//  Created by Admin on 15/2/23.
//

import Foundation
import UIKit

extension UpcomingContainerVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.upcomingNib, for: indexPath) as! UpcomingTblCell
        
        cell.stackView.layer.cornerRadius = 10
        cell.TeamAimg.layer.cornerRadius = 25
        cell.TeamBimg.layer.cornerRadius = 25
        
        cell.LabelOne.text = "New Zealand tour of India"
        cell.LabelTwo.text = "Starts at 2023-03-20"
        cell.LabelThree.text = "Delhi Stadium"
        cell.TeamA.text = "Argentina"
        cell.TeamB.text = "Brazil"
        
        return cell
    }
}
