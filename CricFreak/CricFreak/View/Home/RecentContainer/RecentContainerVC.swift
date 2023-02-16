//
//  RecentContainerVC.swift
//  CricFreak
//
//  Created by Admin on 15/2/23.
//

import UIKit

class RecentContainerVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    let recentContainerViewModel = RecentContainerViewModel()
    var recentData: EasyRecentModel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        
        let cellNib = UINib(nibName: Constants.RecentTblCell, bundle: nil)
        tableView.register(cellNib, forCellReuseIdentifier: Constants.recentNib)
        
        //print(UpcomingMatchURL.getURL())
        
        recentContainerViewModel.populateRecentTable()
        
        recentContainerViewModel.observable.binding() { [weak self] response in
            DispatchQueue.main.async {
                self?.recentData = Adapter.shared.convertToEasyForRecentTable(from: response)
                self?.tableView.reloadData()
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == Constants.goToDetailsPage {
            
        }
    }
}
