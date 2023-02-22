//
//  SquadVC.swift
//  CricFreak
//
//  Created by Admin on 19/2/23.
//

import UIKit

class SquadVC: UIViewController {
    
    var data: SquadData?
    var teamData: RecentTableData?
    var teamA: [EasySquadModel] = []
    var teamB: [EasySquadModel] = []
        
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nibCell = UINib(nibName: Constants.SquadTVC, bundle: nil)
        tableView.register(nibCell, forCellReuseIdentifier: Constants.squadCell)
        tableView.register(nibCell, forHeaderFooterViewReuseIdentifier: Constants.squadCell)
        
        tableView.delegate = self
        tableView.dataSource = self
        
        SquadViewModel.shared.teamObservable.binding() { [weak self] team in
            SquadViewModel.shared.observable.binding() { [weak self] res in
                self?.teamData = team
                self?.data = res?.data
                self?.separateData()
                DispatchQueue.main.async {
                    self?.tableView.reloadData()
                }
            }
        }
        
        
    }
    
    func separateData() {
        for val in (data?.lineup ?? []) {
            var x = EasySquadModel()
            x.name = val.fullname ?? "Unknown"
            x.img = val.imagePath ?? "https://cdn.sportmonks.com/images/cricket/placeholder.png"
            if(val.lineup?.wicketkeeper ?? false) {
                x.cORw = "(wc)"
            }
            else if(val.lineup?.captain ?? false) {
                x.cORw = "(c)"
            }
            if(val.lineup?.teamID == teamData?.localteamId) {
                teamA.append(x)
            }
            else {
                teamB.append(x)
            }
        }
    }
}
