//
//  HomeContainerExtension.swift
//  CricFreak
//
//  Created by Admin on 16/2/23.
//

import Foundation
import UIKit
import SDWebImage

extension HomeContainerVC: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return upcomingData?.data.count ?? 0
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.collCell, for: indexPath) as! TopCollCell
        
        cell.bgView.layer.cornerRadius = 15
        cell.teamAimg.layer.cornerRadius = 20
        cell.teamBimg.layer.cornerRadius = 20
        
        cell.LabelOne.text = upcomingData.data[indexPath.row].stage
        cell.notify.isHidden = false
        cell.teamA.text = upcomingData.data[indexPath.row].localteamCode
        cell.teamB.text = upcomingData.data[indexPath.row].visitorteamCode
        cell.runA.text = "116-6(50)"
        cell.runB.text = "120-2(23.3)"
        cell.runA.isHidden = true
        cell.runB.isHidden = true
        cell.time.text = "10:10 AM"
        cell.date.text = upcomingData.data[indexPath.row].matchDate
        cell.LabelRes.text = upcomingData.data[indexPath.row].venue
        
        if(upcomingData.data[indexPath.row].leagueID == 3) {
            var x = CountryFlags.shared.countryFlagImg[upcomingData.data[indexPath.row].localteamName]
            var y = CountryFlags.shared.countryFlagImg[upcomingData.data[indexPath.row].visitorteamName]
            if(upcomingData.data[indexPath.row].localteamName == "Ireland") {
                x = CountryFlags.shared.countryFlagImg["Republic of Ireland"]
            }
            if(upcomingData.data[indexPath.row].visitorteamName == "Ireland") {
                y = CountryFlags.shared.countryFlagImg["Republic of Ireland"]
            }
            cell.teamAimg.sd_setImage(with: URL(string: x ?? ""))
            cell.teamBimg.sd_setImage(with: URL(string: y ?? ""))
        }
        else {
            cell.teamAimg.sd_setImage(with: URL(string: upcomingData.data[indexPath.row].localteamImg))
            cell.teamBimg.sd_setImage(with: URL(string: upcomingData.data[indexPath.row].visitorteamImg))
        }
        
        return cell
    }
}
