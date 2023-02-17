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
        return upcomingData?.data.count ?? 0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.upcomingNib, for: indexPath) as! UpcomingTblCell
        
        cell.stackView.layer.cornerRadius = 10
        cell.TeamAimg.layer.cornerRadius = 20
        cell.TeamBimg.layer.cornerRadius = 20
        
        cell.LabelOne.text = upcomingData.data[indexPath.row].stage
        cell.LabelTwo.text = upcomingData.data[indexPath.row].matchDate
        cell.TeamA.text = upcomingData.data[indexPath.row].localteamCode
        cell.TeamB.text = upcomingData.data[indexPath.row].visitorteamCode
        
        if(upcomingData.data[indexPath.row].leagueID == 3) {
            var x = CountryFlags.shared.countryFlagImg[upcomingData.data[indexPath.row].localteamName]
            var y = CountryFlags.shared.countryFlagImg[upcomingData.data[indexPath.row].visitorteamName]
            if(upcomingData.data[indexPath.row].localteamName == "Ireland") {
                x = CountryFlags.shared.countryFlagImg["Republic of Ireland"]
            }
            if(upcomingData.data[indexPath.row].visitorteamName == "Ireland") {
                y = CountryFlags.shared.countryFlagImg["Republic of Ireland"]
            }
            cell.TeamAimg.sd_setImage(with: URL(string: x ?? ""))
            cell.TeamBimg.sd_setImage(with: URL(string: y ?? ""))
        }
        else {
            cell.TeamAimg.sd_setImage(with: URL(string: upcomingData.data[indexPath.row].localteamImg))
            cell.TeamBimg.sd_setImage(with: URL(string: upcomingData.data[indexPath.row].visitorteamImg))
        }

        cell.LabelThree.text = upcomingData.data[indexPath.row].venue
                
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        // Set the initial state of the cell
        cell.alpha = 0
        cell.transform = CGAffineTransform(translationX: 0, y: 50)
        
        // Animate the cell to its final state
        UIView.animate(withDuration: 0.07, delay: 0.07 * Double(indexPath.row), options: [.curveEaseOut], animations: {
            cell.alpha = 1
            cell.transform = .identity
        }, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Details", bundle: nil)
        if let detailsVC = storyboard.instantiateViewController(withIdentifier: Constants.DetailsVC) as? DetailsVC {
            detailsVC.loadViewIfNeeded()
            self.navigationController?.pushViewController(detailsVC, animated: true)
        }
        upcomingContainerViewModel.setData(with: upcomingData.data[indexPath.row])
    }
}
