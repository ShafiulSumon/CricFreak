//
//  HomeContainerVC.swift
//  CricFreak
//
//  Created by Admin on 15/2/23.
//

import UIKit

class HomeContainerVC: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var topConstraints: NSLayoutConstraint!
    
    
    let upcomingContainerViewModel = UpcomingContainerViewModel()
    var upcomingData: EasyRecentModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: collectionView.bounds.width * 0.9, height: collectionView.bounds.height * 0.85)
        layout.scrollDirection = .horizontal
        collectionView.collectionViewLayout = layout
        
        
        upcomingContainerViewModel.populateUpcomingTable()
        
        upcomingContainerViewModel.observable.binding() { [weak self] response in
            DispatchQueue.main.async {
                self?.upcomingData = Adapter.shared.convertToEasyForRecentTable(from: response)
                self?.collectionView.reloadData()
            }
        }
    }
}
