//
//  UpcomingContainerVC.swift
//  CricFreak
//
//  Created by Admin on 15/2/23.
//

import UIKit

class UpcomingContainerVC: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        let cellNib = UINib(nibName: Constants.UpcomingTblCell, bundle: nil)
        tableView.register(cellNib, forCellReuseIdentifier: Constants.upcomingNib)
    }
}
