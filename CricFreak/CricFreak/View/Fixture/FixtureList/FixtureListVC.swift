//
//  FixtureListVC.swift
//  CricFreak
//
//  Created by Admin on 24/2/23.
//

import UIKit

class FixtureListVC: UIViewController {
    
//MARK: - Variables
    var data: EasyRecentModel?
    var refreshControl = UIRefreshControl()

//MARK: - Outlets
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
//MARK: - Will Appear
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = false
    }
    
//MARK: - Did Load
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        NetworkManager.shared.monitorNetwork(viewController: self)
        
        refreshControl.addTarget(self, action: #selector(refreshTable), for: UIControl.Event.valueChanged)
        tableView.addSubview(refreshControl)
        
        FixtureListViewModel.shared.observable.binding() { [weak self] res in
            DispatchQueue.main.async {
                self?.data = Adapter.shared.convertToEasyForRecentTable(from: res)
                self?.activityIndicator.stopAnimating()
                self?.tableView.reloadData()
            }
        }
    }
    
//MARK: - All Functions
    @objc func refreshTable() {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            self.refreshControl.endRefreshing()
            self.activityIndicator.startAnimating()
            self.activityIndicator.stopAnimating()
        }
    }

}

//MARK: - Table Extension
extension FixtureListVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data?.data.count ?? 0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.fixtureListCell, for: indexPath) as! FixtureListTVC
        
        cell.bgView.layer.cornerRadius = 10
        cell.teamAimg.layer.cornerRadius = 20
        cell.teamBimg.layer.cornerRadius = 20
        
        cell.title.text = data?.data[indexPath.row].stage
        cell.teamAname.text = data?.data[indexPath.row].localteamCode
        cell.teamBname.text = data?.data[indexPath.row].visitorteamCode
        
        if(data?.data[indexPath.row].leagueID == 3) {
            var x = CountryFlags.shared.countryFlagImg[data?.data[indexPath.row].localteamName ?? ""]
            var y = CountryFlags.shared.countryFlagImg[data?.data[indexPath.row].visitorteamName ?? ""]
            if(data?.data[indexPath.row].localteamName == "Ireland") {
                x = CountryFlags.shared.countryFlagImg["Republic of Ireland"]
            }
            if(data?.data[indexPath.row].visitorteamName == "Ireland") {
                y = CountryFlags.shared.countryFlagImg["Republic of Ireland"]
            }
            cell.teamAimg.sd_setImage(with: URL(string: x ?? ""))
            cell.teamBimg.sd_setImage(with: URL(string: y ?? ""))
        }
        else {
            cell.teamAimg.sd_setImage(with: URL(string: data?.data[indexPath.row].localteamImg ?? ""))
            cell.teamBimg.sd_setImage(with: URL(string: data?.data[indexPath.row].visitorteamImg ?? ""))
        }
        
        cell.bellBtn.isHidden = true
        cell.date.text = "Time: " + (data?.data[indexPath.row].matchTime ?? "Unknown")
        cell.place.text = "Date: " + (data?.data[indexPath.row].matchDate ?? "Unknown")
        cell.note.text = data?.data[indexPath.row].venue
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
