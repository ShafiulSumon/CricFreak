//
//  CareerExtension.swift
//  CricFreak
//
//  Created by Admin on 23/2/23.
//

import Foundation
import UIKit
import SDWebImage

extension CareerVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let cell1 = tableView.dequeueReusableHeaderFooterView(withIdentifier: Constants.XibOne) as! XibOne
        let cell2 = tableView.dequeueReusableHeaderFooterView(withIdentifier: Constants.XibTwo) as! XibTwo

        if section == 0 {
            cell1.title.text = "Personal Info"
            cell1.desc.text = ""

            return cell1
        }
        else if section == 1 {
            cell2.title.text = "Batting Info"
            cell2.tTweenty.text = "T20"
            cell2.odi.text = "ODI"
            cell2.domestic.text = "Domestic"
            
            return cell2
        }
        else {
            cell2.title.text = "Bowling Info"
            cell2.tTweenty.text = "T20"
            cell2.odi.text = "ODI"
            cell2.domestic.text = "Domestic"
            
            return cell2
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 25
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 6
        }
        else if section == 1 {
            return 12
        }
        else {
            return 12
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell1 = tableView.dequeueReusableCell(withIdentifier: Constants.careerCellOne, for: indexPath) as! CareerTVC_one
        
        let cell2 = tableView.dequeueReusableCell(withIdentifier: Constants.careerCellTwo, for: indexPath) as! CareerTVC_two
        
        if(indexPath.section == 0) {
            if(indexPath.row == 0) {
                cell1.title.text = "Fullname"
                cell1.desc.text = data?.data?.fullname ?? "Unknown"
            }
            else if(indexPath.row == 1) {
                cell1.title.text = "Born"
                cell1.desc.text = data?.data?.dateofbirth ?? "YYYY-MM-dd"
            }
            else if(indexPath.row == 2) {
                cell1.title.text = "Gender"
                var _gender = "Other"
                if let gender = data?.data?.gender {
                    if(gender == "m") {
                        _gender = "Male"
                    }
                    else {
                        _gender = "Female"
                    }
                }
                cell1.desc.text = _gender
            }
            else if(indexPath.row == 3) {
                cell1.title.text = "Role"
                cell1.desc.text = data?.data?.position?.name ?? "Unknown"
            }
            else if(indexPath.row == 4) {
                cell1.title.text = "Batting style"
                cell1.desc.text = data?.data?.battingstyle ?? "Unknown"
            }
            else {
                cell1.title.text = "Bowling style"
                cell1.desc.text = data?.data?.bowlingstyle ?? "Unknown"
            }
            cell1.cellBg.layer.cornerRadius = 5
            return cell1
        }
        
        else if(indexPath.section == 1) {
            if(indexPath.row == 0) {
                cell2.title.text = "Matches"
                cell2.tTweenty.text = String(calculatedData[0].batting_matches)
                cell2.odi.text = String(calculatedData[1].batting_matches)
                cell2.domestic.text = String(calculatedData[2].batting_matches)
            }
            else if(indexPath.row == 1) {
                cell2.title.text = "Innings"
                cell2.tTweenty.text = String(calculatedData[0].batting_innings)
                cell2.odi.text = String(calculatedData[1].batting_innings)
                cell2.domestic.text = String(calculatedData[2].batting_innings)
            }
            else if(indexPath.row == 2) {
                cell2.title.text = "Run"
                cell2.tTweenty.text = String(calculatedData[0].batting_runs)
                cell2.odi.text = String(calculatedData[1].batting_runs)
                cell2.domestic.text = String(calculatedData[2].batting_runs)
            }
            else if(indexPath.row == 3) {
                cell2.title.text = "Balls"
                cell2.tTweenty.text = String(calculatedData[0].batting_balls)
                cell2.odi.text = String(calculatedData[1].batting_balls)
                cell2.domestic.text = String(calculatedData[2].batting_balls)
            }
            else if(indexPath.row == 4) {
                cell2.title.text = "Highest score"
                cell2.tTweenty.text = String(calculatedData[0].batting_highest)
                cell2.odi.text = String(calculatedData[1].batting_highest)
                cell2.domestic.text = String(calculatedData[2].batting_highest)
            }
            else if(indexPath.row == 5) {
                cell2.title.text = "Average"
                cell2.tTweenty.text = String(format: "%.2f", calculatedData[0].batting_avg)
                cell2.odi.text = String(format: "%.2f", calculatedData[1].batting_avg)
                cell2.domestic.text = String(format: "%.2f", calculatedData[2].batting_avg)
            }
            else if(indexPath.row == 6) {
                cell2.title.text = "SR"
                cell2.tTweenty.text = String(format: "%.2f", calculatedData[0].batting_sr)
                cell2.odi.text = String(format: "%.2f", calculatedData[1].batting_sr)
                cell2.domestic.text = String(format: "%.2f", calculatedData[2].batting_sr)
            }
            else if(indexPath.row == 7) {
                cell2.title.text = "Not out"
                cell2.tTweenty.text = String(calculatedData[0].batting_notOut)
                cell2.odi.text = String(calculatedData[1].batting_notOut)
                cell2.domestic.text = String(calculatedData[2].batting_notOut)
            }
            else if(indexPath.row == 8) {
                cell2.title.text = "Fours"
                cell2.tTweenty.text = String(calculatedData[0].batting_fours)
                cell2.odi.text = String(calculatedData[1].batting_fours)
                cell2.domestic.text = String(calculatedData[2].batting_fours)
            }
            else if(indexPath.row == 9) {
                cell2.title.text = "Sixes"
                cell2.tTweenty.text = String(calculatedData[0].batting_sixes)
                cell2.odi.text = String(calculatedData[1].batting_sixes)
                cell2.domestic.text = String(calculatedData[2].batting_sixes)
            }
            else if(indexPath.row == 10) {
                cell2.title.text = "100s"
                cell2.tTweenty.text = String(calculatedData[0].batting_hundreds)
                cell2.odi.text = String(calculatedData[1].batting_hundreds)
                cell2.domestic.text = String(calculatedData[2].batting_hundreds)
            }
            else {
                cell2.title.text = "50s"
                cell2.tTweenty.text = String(calculatedData[0].batting_fifty)
                cell2.odi.text = String(calculatedData[1].batting_fifty)
                cell2.domestic.text = String(calculatedData[2].batting_fifty)
            }
            
            cell2.cellBg.layer.cornerRadius = 5
            return cell2
        }
        
        else {
            if(indexPath.row == 0) {
                cell2.title.text = "Matches"
                cell2.tTweenty.text = String(calculatedData[0].bowling_matches)
                cell2.odi.text = String(calculatedData[1].bowling_matches)
                cell2.domestic.text = String(calculatedData[2].bowling_matches)
            }
            else if(indexPath.row == 1) {
                cell2.title.text = "Innings"
                cell2.tTweenty.text = String(calculatedData[0].bowling_innings)
                cell2.odi.text = String(calculatedData[1].bowling_innings)
                cell2.domestic.text = String(calculatedData[2].bowling_innings)
            }
            else if(indexPath.row == 2) {
                cell2.title.text = "Balls"
                cell2.tTweenty.text = String(calculatedData[0].bowling_balls)
                cell2.odi.text = String(calculatedData[1].bowling_balls)
                cell2.domestic.text = String(calculatedData[2].bowling_balls)
            }
            else if(indexPath.row == 3) {
                cell2.title.text = "Runs"
                cell2.tTweenty.text = String(calculatedData[0].bowling_runs)
                cell2.odi.text = String(calculatedData[1].bowling_runs)
                cell2.domestic.text = String(calculatedData[2].bowling_runs)
            }
            else if(indexPath.row == 4) {
                cell2.title.text = "Maidens"
                cell2.tTweenty.text = String(calculatedData[0].bowling_maidens)
                cell2.odi.text = String(calculatedData[1].bowling_maidens)
                cell2.domestic.text = String(calculatedData[2].bowling_maidens)
            }
            else if(indexPath.row == 5) {
                cell2.title.text = "Wickets"
                cell2.tTweenty.text = String(calculatedData[0].bowling_wickets)
                cell2.odi.text = String(calculatedData[1].bowling_wickets)
                cell2.domestic.text = String(calculatedData[2].bowling_wickets)
            }
            else if(indexPath.row == 6) {
                cell2.title.text = "Average"
                cell2.tTweenty.text = String(format: "%.2f", calculatedData[0].bowling_avg)
                cell2.odi.text = String(format: "%.2f", calculatedData[1].bowling_avg)
                cell2.domestic.text = String(format: "%.2f", calculatedData[2].bowling_avg)
            }
            else if(indexPath.row == 7) {
                cell2.title.text = "Economy"
                cell2.tTweenty.text = String(format: "%.2f", calculatedData[0].bowling_eco)
                cell2.odi.text = String(format: "%.2f", calculatedData[1].bowling_eco)
                cell2.domestic.text = String(format: "%.2f", calculatedData[2].bowling_eco)
            }
            else if(indexPath.row == 8) {
                cell2.title.text = "SR"
                cell2.tTweenty.text = String(format: "%.2f", calculatedData[0].bowling_sr)
                cell2.odi.text = String(format: "%.2f", calculatedData[1].bowling_sr)
                cell2.domestic.text = String(format: "%.2f", calculatedData[2].bowling_sr)
            }
            else if(indexPath.row == 9) {
                cell2.title.text = "4W"
                cell2.tTweenty.text = String(calculatedData[0].bowling_fourW)
                cell2.odi.text = String(calculatedData[1].bowling_fourW)
                cell2.domestic.text = String(calculatedData[2].bowling_fourW)
            }
            else if(indexPath.row == 10) {
                cell2.title.text = "5W"
                cell2.tTweenty.text = String(calculatedData[0].bowling_fiveW)
                cell2.odi.text = String(calculatedData[1].bowling_fiveW)
                cell2.domestic.text = String(calculatedData[2].bowling_fiveW)
            }
            else {
                cell2.title.text = "10W"
                cell2.tTweenty.text = String(calculatedData[0].bowling_tenW)
                cell2.odi.text = String(calculatedData[1].bowling_tenW)
                cell2.domestic.text = String(calculatedData[2].bowling_tenW)
            }
            cell2.cellBg.layer.cornerRadius = 5
            return cell2
        }
        
    }
    
    
}
