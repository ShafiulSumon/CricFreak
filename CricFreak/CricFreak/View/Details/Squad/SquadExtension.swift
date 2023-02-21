//
//  SquadExtension.swift
//  CricFreak
//
//  Created by Admin on 21/2/23.
//

import Foundation
import UIKit
import SDWebImage

extension SquadVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return min(teamA.count, teamB.count)
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.squadCell, for: indexPath) as! SquadTVC
        
        cell.imgA.layer.cornerRadius = 20
        cell.imgB.layer.cornerRadius = 20
        
        cell.labelA.text = teamA[indexPath.row].name
        cell.labelB.text = teamB[indexPath.row].name
        
        cell.imgA.sd_setImage(with: URL(string: teamA[indexPath.row].img))
        cell.imgB.sd_setImage(with: URL(string: teamB[indexPath.row].img))
        
        return cell
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.squadCell) as! SquadTVC
        cell.layer.cornerRadius = 10
        cell.backgroundColor = .lightGray
        cell.labelA.text = teamData?.localteamName
        cell.labelB.text = teamData?.visitorteamName
        
        if(teamData?.leagueID == 3) {
            var x = CountryFlags.shared.countryFlagImg[teamData?.localteamName ?? ""]
            var y = CountryFlags.shared.countryFlagImg[teamData?.visitorteamName ?? ""]
            if(teamData?.localteamName == "Ireland") {
                x = CountryFlags.shared.countryFlagImg["Republic of Ireland"]
            }
            if(teamData?.visitorteamName == "Ireland") {
                y = CountryFlags.shared.countryFlagImg["Republic of Ireland"]
            }
            cell.imgA.sd_setImage(with: URL(string: x ?? ""))
            cell.imgB.sd_setImage(with: URL(string: y ?? ""))
        }
        else {
            cell.imgA.sd_setImage(with: URL(string: teamData?.localteamImg ?? ""))
            cell.imgB.sd_setImage(with: URL(string: teamData?.visitorteamImg ?? ""))
        }
        
        return cell
    }
}
