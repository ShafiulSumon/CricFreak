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
    let newsViewModel = NewsViewModel()
    var upcomingData: EasyRecentModel!
    var newsData: NewsModel?
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: collectionView.bounds.width * 0.9, height: collectionView.bounds.height * 0.95)
        layout.scrollDirection = .horizontal
        collectionView.collectionViewLayout = layout
        
        
        upcomingContainerViewModel.populateUpcomingTable()
        newsViewModel.getNews()
        
        upcomingContainerViewModel.observable.binding() { [weak self] response in
            DispatchQueue.main.async {
                self?.upcomingData = Adapter.shared.convertToEasyForRecentTable(from: response)
                self?.collectionView.reloadData()
            }
        }
        
        newsViewModel.observable.binding() { [weak self] res in
            DispatchQueue.main.async {
                self?.newsData = res
                self?.tableView.reloadData()
            }
        }
    }
}
