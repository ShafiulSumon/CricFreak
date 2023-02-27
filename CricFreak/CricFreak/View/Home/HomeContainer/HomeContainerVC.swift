//
//  HomeContainerVC.swift
//  CricFreak
//
//  Created by Admin on 15/2/23.
//

import UIKit

class HomeContainerVC: UIViewController {
    
//MARK: - Variables
    let upcomingContainerViewModel = UpcomingContainerViewModel()
    let newsViewModel = NewsViewModel()
    var upcomingData: EasyRecentModel!
    var newsData: NewsModel?
    var refreshControl = UIRefreshControl()

//MARK: - Outlets
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var topConstraints: NSLayoutConstraint!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
//MARK: - Will Appear
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = true
    }
    
//MARK: - Did Load
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        NetworkManager.shared.monitorNetwork(viewController: self)
        
        refreshControl.addTarget(self, action: #selector(refreshTable), for: UIControl.Event.valueChanged)
        tableView.addSubview(refreshControl)
        
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: collectionView.bounds.width * 0.9, height: collectionView.bounds.height * 0.95)
        layout.scrollDirection = .horizontal
        collectionView.collectionViewLayout = layout
        
        
        upcomingContainerViewModel.populateUpcomingTable()
        newsViewModel.getNews()
        activityIndicator.startAnimating()
        upcomingContainerViewModel.observable.binding() { [weak self] response in
            DispatchQueue.main.async {
                self?.upcomingData = Adapter.shared.convertToEasyForRecentTable(from: response)
                self?.collectionView.reloadData()
            }
        }
        
        newsViewModel.observable.binding() { [weak self] res in
            DispatchQueue.main.async {
                self?.activityIndicator.stopAnimating()
                self?.newsData = res
                self?.tableView.reloadData()
            }
        }        
    }
    
//MARK: - All Functions
    @objc func refreshTable() {
        NetworkManager.shared.monitorNetwork(viewController: self)
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            self.refreshControl.endRefreshing()
            self.activityIndicator.startAnimating()
            self.newsViewModel.getNews()
        }
    }
}
