//
//  RecentContainerVC.swift
//  CricFreak
//
//  Created by Admin on 15/2/23.
//

import UIKit

class RecentContainerVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    let recentContainerViewModel = RecentContainerViewModel()
    var recentData: EasyRecentModel!
    var refreshControl = UIRefreshControl()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        
        refreshControl.addTarget(self, action: #selector(refreshTable), for: UIControl.Event.valueChanged)
        tableView.addSubview(refreshControl)
        
        let cellNib = UINib(nibName: Constants.RecentTblCell, bundle: nil)
        tableView.register(cellNib, forCellReuseIdentifier: Constants.recentNib)
        
        //print(UpcomingMatchURL.getURL())
        
        recentContainerViewModel.populateRecentTable()
        activityIndicator.startAnimating()
        recentContainerViewModel.observable.binding() { [weak self] response in
            DispatchQueue.main.async {
                self?.recentData = Adapter.shared.convertToEasyForRecentTable(from: response)
                self?.activityIndicator.stopAnimating()
                self?.tableView.reloadData()
            }
        }
    }
    
    @objc func refreshTable() {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            self.activityIndicator.startAnimating()
            self.recentContainerViewModel.populateRecentTable()
            self.refreshControl.endRefreshing()
        }
    }
}
