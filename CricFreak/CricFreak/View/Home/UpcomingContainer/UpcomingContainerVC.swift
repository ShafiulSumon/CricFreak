//
//  UpcomingContainerVC.swift
//  CricFreak
//
//  Created by Admin on 15/2/23.
//

import UIKit

class UpcomingContainerVC: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var upcomingContainerViewModel = UpcomingContainerViewModel()
    var upcomingData: EasyRecentModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        let cellNib = UINib(nibName: Constants.UpcomingTblCell, bundle: nil)
        tableView.register(cellNib, forCellReuseIdentifier: Constants.upcomingNib)
        
        upcomingContainerViewModel.populateUpcomingTable()
        
        upcomingContainerViewModel.observable.binding() { [weak self] response in
            DispatchQueue.main.async {
                self?.upcomingData = Adapter.shared.convertToEasyForRecentTable(from: response)
                self?.tableView.reloadData()
            }
        }
    }
}
