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
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    let upcomingContainerViewModel = UpcomingContainerViewModel()
    let newsViewModel = NewsViewModel()
    var upcomingData: EasyRecentModel!
    var newsData: NewsModel?
    var refreshControl = UIRefreshControl()
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
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
        
        checkForPermission()
    }
    
    @objc func refreshTable() {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            self.refreshControl.endRefreshing()
            self.activityIndicator.startAnimating()
            self.newsViewModel.getNews()
        }
    }
    
    func checkForPermission() {
        let center = UNUserNotificationCenter.current()
        center.getNotificationSettings() { settings in
            switch settings.authorizationStatus {
            case .authorized :
                self.dispatchNotification()
            case .notDetermined :
                center.requestAuthorization(options: [.alert, .sound]) { didAllow, error in
                    if didAllow {
                        self.dispatchNotification()
                    }
                }
            default:
                return
            }
        }
    }
    
    func dispatchNotification() {
        let identifier = "First"
        let title = "The match will start soon"
        let body = "Don't miss it"
        let hour = 10
        let minute = 08
        let isDaily = false
        
        let center = UNUserNotificationCenter.current()
        
        let content = UNMutableNotificationContent()
        content.title = title
        content.body = body
        content.sound = .default
        
        let calendar = Calendar.current
        var dateComponent = DateComponents(calendar: calendar, timeZone: TimeZone.current)
        dateComponent.hour = hour
        dateComponent.minute = minute
        
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponent, repeats: isDaily)
        let request = UNNotificationRequest(identifier: identifier, content: content, trigger: trigger)
        
        center.removePendingNotificationRequests(withIdentifiers: [identifier])
        center.add(request)
        
    }
    
}
