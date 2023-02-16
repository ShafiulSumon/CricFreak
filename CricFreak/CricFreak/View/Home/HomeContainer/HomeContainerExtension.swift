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
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        // Set the initial state of the cell
        cell.alpha = 0
        cell.transform = CGAffineTransform(translationX: 0, y: -50)
        
        // Animate the cell to its final state
        UIView.animate(withDuration: 0.5, delay: 0.1 * Double(indexPath.item), options: [.curveEaseInOut], animations: {
            cell.alpha = 1
            cell.transform = .identity
        }, completion: nil)
    }
}

extension HomeContainerVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 30
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let y = scrollView.contentOffset.y
        if y > 0 {
            UIView.animate(withDuration: 0.4) {
                self.collectionView.alpha = 0
                self.topConstraints.constant = -(self.collectionView.bounds.size.height)
                self.view.layoutIfNeeded()
            }
        } else {
            UIView.animate(withDuration: 0.4) {
                self.topConstraints.constant = 0
                self.collectionView.alpha = 1
                self.view.layoutIfNeeded()
            }
        }
    }
}
