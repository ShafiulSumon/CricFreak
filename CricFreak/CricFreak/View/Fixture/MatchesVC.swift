//
//  MatchesVC.swift
//  CricFreak
//
//  Created by Admin on 14/2/23.
//

import UIKit

class MatchesVC: UIViewController {

    var data: LeagueModel?
    var matchesViewModel = MatchesViewModel()
    var refreshControl = UIRefreshControl()
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    
    override func viewWillAppear(_ animated: Bool) {
        UIApplication.shared.statusBarStyle = .lightContent
        navigationController?.isNavigationBarHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        refreshControl.addTarget(self, action: #selector(refreshTable), for: UIControl.Event.valueChanged)
        tableView.addSubview(refreshControl)
        
        activityIndicator.startAnimating()
        matchesViewModel.getLeague()
        matchesViewModel.observable.binding() { [weak self] res in
            DispatchQueue.main.async {
                self?.data = res
                self?.activityIndicator.stopAnimating()
                self?.tableView.reloadData()
            }
        }
    }
    
    @objc func refreshTable() {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            self.refreshControl.endRefreshing()
            self.activityIndicator.startAnimating()
            self.matchesViewModel.getLeague()
        }
    }
}

extension MatchesVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        3
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.leagueCell, for: indexPath) as! MatchTVC
        
        cell.bgView.layer.cornerRadius = 10
        
        cell.img.sd_setImage(with: URL(string: data?.data?[indexPath.row].imagePath ?? ""))
        cell.title.text = data?.data?[indexPath.row].name ?? ""
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "All Leagues"
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let storyboard = UIStoryboard(name: "Matches", bundle: nil)
        if let fixtureListVC = storyboard.instantiateViewController(withIdentifier: Constants.FixtureListVC) as? FixtureListVC {
            FixtureListViewModel.shared.getData(leagueId: data?.data?[indexPath.row].id ?? 0)
            fixtureListVC.loadViewIfNeeded()
            fixtureListVC.activityIndicator.startAnimating()
            navigationController?.pushViewController(fixtureListVC, animated: true)
        }
    }
}
