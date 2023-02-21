//
//  ScoreboardVC.swift
//  CricFreak
//
//  Created by Admin on 19/2/23.
//

import UIKit

class ScoreboardVC: UIViewController {

    var data: ScoreboardData?
    var teamOneBat: [EasyScoreboardModel] = []
    var teamOneBowl: [EasyScoreboardModel] = []
    var teamTwoBat: [EasyScoreboardModel] = []
    var teamTwoBowl: [EasyScoreboardModel] = []
    var tableDataBat: [EasyScoreboardModel] = []
    var tableDataBowl: [EasyScoreboardModel] = []
    
    @IBOutlet weak var segmentControl: UISegmentedControl!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        let cellNib = UINib(nibName: Constants.ScoreboardTVC, bundle: nil)
        tableView.register(cellNib, forCellReuseIdentifier: Constants.ScoreTblCell)
        tableView.register(cellNib, forHeaderFooterViewReuseIdentifier: Constants.ScoreTblCell)
        
        setTitleForSegmentControl()
        segmentControl.selectedSegmentIndex = 0
        
        ScoreboardViewModel.shared.observable.binding() { [weak self] res in
            DispatchQueue.main.async {
                self?.data = res?.data
                //dump(self?.data)
                self?.setTitleForSegmentControl()
                self?.makeSeparateArray()
                self?.renderTableData(id: 0)
                self?.tableView.reloadData()
            }
        }
    }
    
    @IBAction func changeTeam(_ sender: UISegmentedControl) {
        renderTableData(id: sender.selectedSegmentIndex)
    }
    
    func setTitleForSegmentControl() {
        segmentControl.setTitle((data?.localteam?.code) ?? "A", forSegmentAt: 0)
        segmentControl.setTitle((data?.visitorteam?.code) ?? "B", forSegmentAt: 1)
    }
    
    func makeSeparateArray() {
        for val in (data?.batting ?? []) {
            
            var x = EasyScoreboardModel()
            x.flag = 0
            if(val.bowler == nil && val.catchstump == nil && val.batsmanout == nil && val.runoutby == nil) {
                x.flag = 1
            }
            x.teamID = val.teamID ?? 0
            x.name = val.batsman?.fullname ?? "Unknown"
            x.runORover = val.score ?? -1
            x.bowlORmedians = val.ball ?? -1
            x.fourORrun = val.fourX ?? -1
            x.sixORwicket = val.sixX ?? -1
            x.srORer = val.rate ?? -1
            
            if((val.scoreboard?.rawValue) == "S1") {
                teamOneBat.append(x)
            }
            else {
                teamTwoBat.append(x)
            }
        }
        
        for val in (data?.bowling ?? []) {
            
            var x = EasyScoreboardModel()
            x.flag = 0
            x.teamID = -1
            x.name = val.bowler?.fullname ?? "Unknown"
            x.runORover = Int(val.overs ?? -1)
            x.bowlORmedians = val.medians ?? -1
            x.fourORrun = val.runs ?? -1
            x.sixORwicket = val.wickets ?? -1
            x.srORer = Int(val.rate ?? -1)
            
            if((val.scoreboard?.rawValue) == "S1") {
                teamOneBowl.append(x)
            }
            else {
                teamTwoBowl.append(x)
            }
        }
    }
    
    func renderTableData(id: Int) {
        if id == 0 {
            if(teamOneBat.count != 0 && (data?.localteam?.id == teamOneBat[0].teamID)) {
                tableDataBat = teamOneBat
                tableDataBowl = teamOneBowl
            }
            else {
                tableDataBat = teamTwoBat
                tableDataBowl = teamTwoBowl
            }
        }
        else {
            if(teamOneBat.count != 0 && (data?.visitorteam?.id == teamOneBat[0].teamID)) {
                tableDataBat = teamOneBat
                tableDataBowl = teamOneBowl
            }
            else {
                tableDataBat = teamTwoBat
                tableDataBowl = teamTwoBowl
            }
        }
        tableView.reloadData()
    }
}
