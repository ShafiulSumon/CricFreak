//
//  UpcomingContainerVC.swift
//  CricFreak
//
//  Created by Admin on 15/2/23.
//

import UIKit

class UpcomingContainerVC: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    var upcomingContainerViewModel = UpcomingContainerViewModel()
    var upcomingData: EasyRecentModel!
    var refreshControl = UIRefreshControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
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
    
    @objc func refreshTable() {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            self.activityIndicator.startAnimating()
            self.upcomingContainerViewModel.populateUpcomingTable()
            self.refreshControl.endRefreshing()
        }
    }
    
    func remainingTime(matchTime: String) -> TimeInterval {
        let dateString = matchTime
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSSSS'Z'"
        dateFormatter.timeZone = TimeZone(identifier: "UTC")
        guard let date = dateFormatter.date(from: dateString) else {
            fatalError("Invalid date format")
        }

        let currentDate = Date() // current date
        let timeInterval = date.timeIntervalSince(currentDate)
        
        return timeInterval
    }
}
