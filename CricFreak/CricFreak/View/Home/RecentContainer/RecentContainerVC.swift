//
//  RecentContainerVC.swift
//  CricFreak
//
//  Created by Admin on 15/2/23.
//

import UIKit

class RecentContainerVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        
        let cellNib = UINib(nibName: Constants.RecentTblCell, bundle: nil)
        tableView.register(cellNib, forCellReuseIdentifier: Constants.recentNib)
    }
}
