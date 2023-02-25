//
//  InfoVC.swift
//  CricFreak
//
//  Created by Admin on 19/2/23.
//

import UIKit

class InfoVC: UIViewController {
    var data: InfoData?
    var fixtureId: Int?
    
    @IBOutlet weak var tableView: UITableView!
 
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        InfoViewModel.shared.observable.binding() { [weak self] res in
            DispatchQueue.main.async {
                self?.data = res?.data
                self?.tableView.reloadData()
            }
        }
    }
}

extension InfoVC: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(section == 0) {
            return 8
        }
        else {
            return 3
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.InfoCell, for: indexPath) as! InfoTVC
        
        if(indexPath.section == 0) {
            if(indexPath.row == 0) {
                cell.labelOne.text = "Match"
                cell.labelTwo.text = data?.round ?? "N/A"
            }
            else if(indexPath.row == 1) {
                cell.labelOne.text = "Series"
                cell.labelTwo.text = data?.stage?.name ?? "N/A"
            }
            else if(indexPath.row == 2) {
                cell.labelOne.text = "Date"
                if let date = data?.startingAt {
                    cell.labelTwo.text = String(date.prefix(10))
                }
                else {
                    cell.labelTwo.text = "Unknown"
                }
            }
            else if(indexPath.row == 3) {
                cell.labelOne.text = "Time"
                if let time = data?.startingAt {
//                    let startIndex = date.index(date.startIndex, offsetBy: 11)
//                    let endIndex = date.index(date.startIndex, offsetBy: 16)
//                    let substr = String(date[startIndex..<endIndex])
                    cell.labelTwo.text = DateManager.shared.localTime(startIndex: 11, offset: 5, originalString: time)
                }
                else {
                    cell.labelTwo.text = "Unknown"
                }
            }
            else if(indexPath.row == 4) {
                cell.labelOne.text = "Toss"
                cell.labelTwo.text = (data?.tosswon?.name) != nil ? "\((data?.tosswon?.name)!) won the toss" : "N/A"
            }
            else if(indexPath.row == 5) {
                cell.labelOne.text = "Umpire"
                cell.labelTwo.text = "First: \(data?.firstumpire?.fullname ?? "N/A"), Second: \(data?.secondumpire?.fullname ?? "N/A")"
            }
            else if(indexPath.row == 6) {
                cell.labelOne.text = "3rd umpire"
                cell.labelTwo.text = data?.tvumpire?.fullname ?? "N/A"
            }
            else if(indexPath.row == 7) {
                cell.labelOne.text = "Referee"
                cell.labelTwo.text = data?.referee?.fullname ?? "N/A"
            }
        }
        else {
            if(indexPath.row == 0) {
                cell.labelOne.text = "Stadium"
                cell.labelTwo.text = data?.venue?.name ?? "Unknown"
            }
            else if(indexPath.row == 1) {
                cell.labelOne.text = "City"
                cell.labelTwo.text = data?.venue?.city ?? "Unknown"
            }
            else if(indexPath.row == 2) {
                cell.labelOne.text = "Capacity"
                cell.labelTwo.text = String(data?.venue?.capacity ?? -1)
            }
        }
        
        return cell
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if(section == 0) {
            return "Info"
        }
        else {
            return "Venue Guide"
        }
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
