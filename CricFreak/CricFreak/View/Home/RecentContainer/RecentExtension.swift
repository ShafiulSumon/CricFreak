//
//  RecentExtension.swift
//  CricFreak
//
//  Created by Admin on 15/2/23.
//

import Foundation
import UIKit
import SDWebImage

extension RecentContainerVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recentData?.data.count ?? 0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.recentNib, for: indexPath) as! RecentTblCell
        cell.stackView.layer.cornerRadius = 10
        cell.stackView.layer.masksToBounds = true
        cell.teamAimg.layer.cornerRadius = 20
        cell.teamBimg.layer.cornerRadius = 20
        cell.live.alpha = 0
        
        cell.labelOne.text = recentData.data[indexPath.row].stage
        cell.labelTwo.text = recentData.data[indexPath.row].round + " at " + recentData.data[indexPath.row].venue + " [" + recentData.data[indexPath.row].matchDate + "]"
        
        
        if(recentData.data[indexPath.row].leagueID == 3) {
            var x = CountryFlags.shared.countryFlagImg[recentData.data[indexPath.row].localteamName]
            var y = CountryFlags.shared.countryFlagImg[recentData.data[indexPath.row].visitorteamName]
            if(recentData.data[indexPath.row].localteamName == "Ireland") {
                x = CountryFlags.shared.countryFlagImg["Republic of Ireland"]
            }
            if(recentData.data[indexPath.row].visitorteamName == "Ireland") {
                y = CountryFlags.shared.countryFlagImg["Republic of Ireland"]
            }
            cell.teamAimg.sd_setImage(with: URL(string: x ?? ""))
            cell.teamBimg.sd_setImage(with: URL(string: y ?? ""))
        }
        else {
            cell.teamAimg.sd_setImage(with: URL(string: recentData.data[indexPath.row].localteamImg))
            cell.teamBimg.sd_setImage(with: URL(string: recentData.data[indexPath.row].visitorteamImg))
        }
        
        cell.teamA.text = recentData.data[indexPath.row].localteamCode
        cell.teamB.text = recentData.data[indexPath.row].visitorteamCode
        cell.runA.text = recentData.data[indexPath.row].localteamRun + recentData.data[indexPath.row].localteamWicket + "(" + recentData.data[indexPath.row].localteamOver + ")"
        cell.runB.text = recentData.data[indexPath.row].visitorteamRun + recentData.data[indexPath.row].visitorteamWicket + "(" + recentData.data[indexPath.row].visitorteamOver + ")"
        cell.labelResult.text = recentData.data[indexPath.row].note
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        // Set the initial state of the cell
        cell.alpha = 0
        cell.transform = CGAffineTransform(translationX: 0, y: 50)
        
        // Animate the cell to its final state
        UIView.animate(withDuration: 0.2, delay: 0.07 * Double(indexPath.row), options: [.curveEaseOut], animations: {
            cell.alpha = 1
            cell.transform = .identity
        }, completion: nil)
    }
}
