//
//  DetailsVC.swift
//  CricFreak
//
//  Created by Admin on 17/2/23.
//

import UIKit
import SDWebImage

class DetailsVC: UIViewController {
    
//MARK: - Outlets
    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var teamAimg: UIImageView!
    @IBOutlet weak var teamBimg: UIImageView!
    @IBOutlet weak var topConstraints: NSLayoutConstraint!
    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var labelOne: UILabel!
    @IBOutlet weak var teamA: UILabel!
    @IBOutlet weak var runA: UILabel!
    @IBOutlet weak var teamB: UILabel!
    @IBOutlet weak var runB: UILabel!
    @IBOutlet weak var labelTwo: UILabel!
    
    
    
//MARK: - Variables
    var detailsViewModel = DetailsViewModel()
    
//MARK: - Default functions
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = false
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        topView.layer.cornerRadius = 20
        topView.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        topView.clipsToBounds = true
        topConstraints.constant = topView.bounds.height/3.5
        bgView.layer.cornerRadius = 20
        
        print(topView.bounds.height)
        print(topConstraints.constant)

        
        detailsViewModel.receiveFixtureId()
        
        detailsViewModel.observable.binding() { [weak self] data in
            guard let data = data else { return }
//            if(data.leagueID == 3) {
//                var x = CountryFlags.shared.countryFlagImg[data.localteamName]
//                var y = CountryFlags.shared.countryFlagImg[data.visitorteamName]
//                if(data.localteamName == "Ireland") {
//                    x = CountryFlags.shared.countryFlagImg["Republic of Ireland"]
//                }
//                if(data.visitorteamName == "Ireland") {
//                    y = CountryFlags.shared.countryFlagImg["Republic of Ireland"]
//                }
//                self?.teamAimg.sd_setImage(with: URL(string: x ?? ""))
//                self?.teamBimg.sd_setImage(with: URL(string: y ?? ""))
//            }
//            else {
//                self?.teamAimg.sd_setImage(with: URL(string: data.localteamImg))
//                self?.teamBimg.sd_setImage(with: URL(string: data.visitorteamImg))
//            }
        }
        
    }
}
