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
        cell.TeamAimg.layer.cornerRadius = 5
        cell.TeamBimg.layer.cornerRadius = 5
        
        cell.LabelOne.text = upcomingData.data[indexPath.row].stage
        
        let remTime = DateManager.shared.daysBetween(currDate: upcomingData.data[indexPath.row].matchDate)
        if(remTime == "0") {
            let seconds = DateManager.shared.remainingTime(matchTime: upcomingData.data[indexPath.row].originalDateTime)
            
            let hour = upcomingData.data[indexPath.row].matchTime.prefix(2)
            let minute = upcomingData.data[indexPath.row].matchTime.suffix(2)
            let title = upcomingData.data[indexPath.row].localteamCode + " vs " + upcomingData.data[indexPath.row].visitorteamCode
            NotificationManager.shared.checkForPermission(title: title, hour: Int(hour) ?? 0, minute: Int(minute) ?? 0)
            
            cell.startTimer(for: Date().addingTimeInterval(TimeInterval(seconds < 0 ? 0 : seconds)))
            
        }
        else {
            cell.LabelTwo.text = remTime + " days to go"
        }
//        cell.startTimer(for: Date().addingTimeInterval(TimeInterval(10)))
        
        
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
        cell.alpha = 0
        cell.transform = CGAffineTransform(translationX: 0, y: 50)
        
        UIView.animate(withDuration: 0.02, delay: 0.02 * Double(indexPath.row), options: [.curveEaseOut], animations: {
            cell.alpha = 1
            cell.transform = .identity
        }, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Details", bundle: nil)
        if let detailsVC = storyboard.instantiateViewController(withIdentifier: Constants.DetailsVC) as? DetailsVC {
            detailsVC.data = upcomingData.data[indexPath.row]
            detailsVC.fixtureId = upcomingData.data[indexPath.row].id
            InfoViewModel.shared.getInfo(fixtureId: upcomingData.data[indexPath.row].id)
            ScoreboardViewModel.shared.getScore(fixtureId: upcomingData.data[indexPath.row].id)
            ScoreboardViewModel.shared.team[upcomingData.data[indexPath.row].localteamId] = upcomingData.data[indexPath.row].localteamName
            ScoreboardViewModel.shared.team[upcomingData.data[indexPath.row].visitorteamId] = upcomingData.data[indexPath.row].visitorteamName
            ScoreboardViewModel.shared.teamName.append(upcomingData.data[indexPath.row].localteamName)
            ScoreboardViewModel.shared.teamName.append(upcomingData.data[indexPath.row].visitorteamName)
            SquadViewModel.shared.getSquad(fixtureId: upcomingData.data[indexPath.row].id, data: upcomingData.data[indexPath.row])
            detailsVC.loadViewIfNeeded()
            self.navigationController?.pushViewController(detailsVC, animated: true)
        }
        upcomingContainerViewModel.setData(with: upcomingData.data[indexPath.row])
    }
}
