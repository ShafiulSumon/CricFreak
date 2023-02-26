//
//  UpcomingContainerVC.swift
//  CricFreak
//
//  Created by Admin on 15/2/23.
//

import UIKit

class UpcomingContainerVC: UIViewController {
    
//MARK: - Variables
    var upcomingContainerViewModel = UpcomingContainerViewModel()
    var upcomingData: EasyRecentModel!
    var refreshControl = UIRefreshControl()
    
//MARK: - Outlets
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
//MARK: - Did Load
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        NetworkManager.shared.monitorNetwork(viewController: self)
        
        refreshControl.addTarget(self, action: #selector(refreshTable), for: UIControl.Event.valueChanged)
        tableView.addSubview(refreshControl)
        
        let cellNib = UINib(nibName: Constants.UpcomingTblCell, bundle: nil)
        tableView.register(cellNib, forCellReuseIdentifier: Constants.upcomingNib)
        
        upcomingContainerViewModel.populateUpcomingTable()
        activityIndicator.startAnimating()
        upcomingContainerViewModel.observable.binding() { [weak self] response in
            DispatchQueue.main.async {
                self?.upcomingData = Adapter.shared.convertToEasyForRecentTable(from: response)
                self?.activityIndicator.stopAnimating()
                self?.tableView.reloadData()
            }
        }
    }
    
//MARK: - All Functions
    @objc func refreshTable() {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            self.activityIndicator.startAnimating()
            self.upcomingContainerViewModel.populateUpcomingTable()
            self.refreshControl.endRefreshing()
        }
    }
}
