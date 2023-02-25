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
        cell.live.layer.cornerRadius = 5
        cell.live.isHidden = false
        cell.notify.isHidden = false
        cell.teamA.text = upcomingData.data[indexPath.row].localteamCode
        cell.teamB.text = upcomingData.data[indexPath.row].visitorteamCode
        cell.runA.text = "116-6(50)"
        cell.runB.text = "120-2(23.3)"
        cell.runA.isHidden = true
        cell.runB.isHidden = true
        cell.time.text = upcomingData.data[indexPath.row].matchTime
        //cell.time.text = DateManager.shared.localTime(startIndex: 11, offset: 5, originalString: upcomingData.data[indexPath.row].matchDate)
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
        UIView.animate(withDuration: 0.1, delay: 0.05 * Double(indexPath.item), options: [.curveEaseInOut], animations: {
            cell.alpha = 1
            cell.transform = .identity
        }, completion: nil)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
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

extension HomeContainerVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Top Newses"
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 25
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (newsData?.articles?.count) ?? 0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.newsCell, for: indexPath) as! NewsTVC
        
        cell.bgView.layer.cornerRadius = 10
        cell.bgView.layer.masksToBounds = true
        
        cell.imgField.sd_setImage(with: URL(string: newsData?.articles?[indexPath.row].urlToImage ?? ""), placeholderImage: UIImage(named: "newspaper"))
        cell.headlines.text = newsData?.articles?[indexPath.row].title ?? "No headlines"
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let storyboard = UIStoryboard(name: "Home", bundle: nil)
        if let webPageVC = storyboard.instantiateViewController(withIdentifier: Constants.WebKitVC) as? WebKitVC {
            webPageVC.forURL = newsData?.articles?[indexPath.row].url ?? ""
            webPageVC.loadViewIfNeeded()
            self.navigationController?.pushViewController(webPageVC, animated: true)
        }
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
