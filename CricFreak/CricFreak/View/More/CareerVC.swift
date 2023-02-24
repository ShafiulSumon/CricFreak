//
//  CareerVC.swift
//  CricFreak
//
//  Created by Admin on 23/2/23.
//

import UIKit

class CareerVC: UIViewController {

//MARK: - Variables
    var data: CareerModel? = CareerModel()
    var calculatedData: [EasyCareerModel] = Array(repeating: EasyCareerModel(), count: 3)
    
//MARK: - Outlets
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var flag: UIImageView!
    @IBOutlet weak var playerImg: UIImageView!
    @IBOutlet weak var playerName: UILabel!
    @IBOutlet weak var country: UILabel!
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        topView.layer.cornerRadius = 25
        topView.layer.maskedCorners = [.layerMaxXMaxYCorner]
        topView.clipsToBounds = true
        flag.layer.borderWidth = 1
        
        tableView.delegate = self
        tableView.dataSource = self
        
        let cellNib1 = UINib(nibName: Constants.XibOne, bundle: nil)
        let cellNib2 = UINib(nibName: Constants.XibTwo, bundle: nil)
        tableView.register(cellNib1, forHeaderFooterViewReuseIdentifier: Constants.XibOne)
        tableView.register(cellNib2, forHeaderFooterViewReuseIdentifier: Constants.XibTwo)
        
        reloadTopView()
                
        CareerViewModel.shared.observable.binding() { [weak self] res in
            DispatchQueue.main.async {
                self?.data = res
                self?.reloadTopView()
                self?.makeCalculation()
                self?.tableView.reloadData()
            }
        }
        
    }
    
    func reloadTopView() {
        playerImg.sd_setImage(with: URL(string: data?.data?.imagePath ?? ""))
        flag.sd_setImage(with: URL(string: data?.data?.country?.imagePath ?? ""))
        playerName.text = data?.data?.fullname ?? "Unknown"
        country.text = data?.data?.country?.name ?? "Unknown"
    }
    
    func makeCalculation() {
        calculateBattingData()
        calculateBowlingData()
    }
    
    func calculateBattingData() {
        for i in 0...2 {
            var type = ""
            if(i == 0) {
                type = "T20I"
            }
            else if(i == 1) {
                type = "ODI"
            }
            else {
                type = "T20"
            }
            calculatedData[i].batting_matches = getAllMatches(type,1)
            calculatedData[i].batting_innings = getAllInnings(type,1)
            calculatedData[i].batting_runs = getAllRuns(type,1)
            calculatedData[i].batting_balls = getAllBalls(type,1)
            calculatedData[i].batting_highest = getHighest(type,1)
            calculatedData[i].batting_notOut = getNotOut(type,1)
            calculatedData[i].batting_fours = getFours(type,1)
            calculatedData[i].batting_sixes = getSixes(type,1)
            calculatedData[i].batting_hundreds = getHundreds(type,1)
            calculatedData[i].batting_fifty = getFifty(type,1)
            
            if(calculatedData[i].batting_balls == 0) {
                calculatedData[i].batting_sr = -1
            }
            else {
                calculatedData[i].batting_sr = Double(Double(calculatedData[i].batting_runs)/Double(calculatedData[i].batting_balls)) * 100.0
            }
            
            let diff = calculatedData[i].batting_matches - calculatedData[i].batting_notOut
            if(diff == 0) {
                calculatedData[i].batting_avg = -1
            }
            else {
                calculatedData[i].batting_avg = Double(calculatedData[i].batting_runs/diff)
            }
        }
    }
    
    func calculateBowlingData() {
        for i in 0...2 {
            var type = ""
            if(i == 0) {
                type = "T20I"
            }
            else if(i == 1) {
                type = "ODI"
            }
            else {
                type = "T20"
            }
            calculatedData[i].bowling_matches = getAllMatches(type,0)
            calculatedData[i].bowling_innings = getAllInnings(type,0)
            calculatedData[i].bowling_balls = getAllRuns(type,0)
            calculatedData[i].bowling_runs = getAllBalls(type,0)
            calculatedData[i].bowling_maidens = getNotOut(type,0)
            calculatedData[i].bowling_wickets = getFours(type,0)
            calculatedData[i].bowling_fourW = getSixes(type,0)
            calculatedData[i].bowling_fiveW = getFifty(type,0)
            calculatedData[i].bowling_tenW = getHundreds(type,0)
            
            if(calculatedData[i].bowling_wickets == 0) {
                calculatedData[i].bowling_avg = -1
            }
            else {
                calculatedData[i].bowling_avg = Double(calculatedData[i].bowling_runs/calculatedData[i].bowling_wickets)
            }
            
            if(calculatedData[i].bowling_balls == 0) {
                calculatedData[i].bowling_eco = -1
            }
            else {
                calculatedData[i].bowling_eco = Double(calculatedData[i].bowling_runs*6)/Double(calculatedData[i].bowling_balls)
            }
            
            if(calculatedData[i].bowling_wickets == 0) {
                calculatedData[i].bowling_sr = -1
            }
            else {
                calculatedData[i].bowling_sr = Double(calculatedData[i].bowling_balls)/Double(calculatedData[i].bowling_wickets)
            }
        }
    }
    
    func getAllMatches( _ flag: String, _ bat: Int) -> Int {
        var total = 0.0
        for item in (data?.data?.career ?? []) {
            if(item.type == flag) {
                if(bat == 1) {
                    total += item.batting?["matches"] ?? 0.0
                }
                else {
                    total += item.bowling?["matches"] ?? 0.0
                }
            }
        }
        return Int(total)
    }
    
    func getAllInnings( _ flag: String, _ bat: Int) -> Int {
        var total = 0.0
        for item in (data?.data?.career ?? []) {
            if(item.type == flag) {
                if(bat == 1) {
                    total += item.batting?["innings"] ?? 0.0
                }
                else {
                    total += item.bowling?["innings"] ?? 0.0
                }
                
            }
        }
        return Int(total)
    }
    
    func getAllRuns( _ flag: String, _ bat: Int) -> Int {
        var total = 0.0
        for item in (data?.data?.career ?? []) {
            if(item.type == flag) {
                if(bat == 1) {
                    total += item.batting?["runs_scored"] ?? 0.0
                }
                else {
                    total += item.bowling?["runs"] ?? 0.0
                }
            }
        }
        return Int(total)
    }
    
    func getAllBalls( _ flag: String, _ bat: Int) -> Int {
        var total = 0.0
        for item in (data?.data?.career ?? []) {
            if(item.type == flag) {
                if(bat == 1) {
                    total += item.batting?["balls_faced"] ?? 0.0
                }
                else {
                    var over = item.bowling?["overs"] ?? 0
                    var balls = (Int(floor(over))*6) + (Int(over*10)%10)
                    total += Double(balls)
                }
            }
        }
        return Int(total)
    }
    
    func getHighest( _ flag: String, _ bat: Int) -> Int {
        var mx = 0.0
        for item in (data?.data?.career ?? []) {
            if(item.type == flag) {
                if(bat == 1) {
                    mx = max(mx, item.batting?["matches"] ?? 0.0)
                }
                else {
                    
                }
            }
        }
        return Int(mx)
    }
    
    func getNotOut( _ flag: String, _ bat: Int) -> Int {
        var total = 0.0
        for item in (data?.data?.career ?? []) {
            if(item.type == flag) {
                if(bat == 1) {
                    total += item.batting?["not_outs"] ?? 0.0
                }
                else { // maidens
                    total += item.bowling?["medians"] ?? 0.0
                }
            }
        }
        return Int(total)
    }
    
    func getFours( _ flag: String, _ bat: Int) -> Int {
        var total = 0.0
        for item in (data?.data?.career ?? []) {
            if(item.type == flag) {
                if(bat == 1) {
                    total += item.batting?["four_x"] ?? 0.0
                }
                else { // wickets
                    total += item.bowling?["wickets"] ?? 0.0
                }
            }
        }
        return Int(total)
    }
    
    func getSixes( _ flag: String, _ bat: Int) -> Int {
        var total = 0.0
        for item in (data?.data?.career ?? []) {
            if(item.type == flag) {
                if(bat == 1) {
                    total += item.batting?["six_x"] ?? 0.0
                }
                else { // 4w
                    total += item.bowling?["four_wickets"] ?? 0.0
                }
            }
        }
        return Int(total)
    }
    
    func getHundreds( _ flag: String, _ bat: Int) -> Int {
        var total = 0.0
        for item in (data?.data?.career ?? []) {
            if(item.type == flag) {
                if(bat == 1) {
                    total += item.batting?["hundreds"] ?? 0.0
                }
                else { // 10w
                    total += item.bowling?["hundreds"] ?? 0.0
                }
            }
        }
        return Int(total)
    }
    
    func getFifty( _ flag: String, _ bat: Int) -> Int {
        var total = 0.0
        for item in (data?.data?.career ?? []) {
            if(item.type == flag) {
                if(bat == 1) {
                    total += item.batting?["fifties"] ?? 0.0
                }
                else { // 5w
                    total += item.bowling?["five_wickets"] ?? 0.0
                }
            }
        }
        return Int(total)
    }
    
    
    
}
