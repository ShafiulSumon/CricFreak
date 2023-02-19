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
    @IBOutlet weak var segmentControl: UISegmentedControl!
    @IBOutlet weak var InfoContainer: UIView!
    @IBOutlet weak var ScoreboardContainer: UIView!
    @IBOutlet weak var SquadContainer: UIView!
    @IBOutlet weak var NetworkContainer: UIView!
    
    
//MARK: - Variables
    var fixtureId: Int!
    
//MARK: - Default functions
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = false
        
        DetailsViewModel.shared.receiveFixtureData()
        DetailsViewModel.shared.observable.binding() { [weak self] data in
            guard let data = data else { return }
            self?.fixtureId = data.id
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        designTopView()
        selectContainer(segmentIndex: 0)
    }
    
    
    @IBAction func segmentControl(_ sender: UISegmentedControl) {
        selectContainer(segmentIndex: sender.selectedSegmentIndex)
    }
    
    func selectContainer(segmentIndex: Int) {
        InfoContainer.isHidden = true
        ScoreboardContainer.isHidden = true
        SquadContainer.isHidden = true
        NetworkContainer.isHidden = true
        
        if segmentIndex == -1 {
            NetworkContainer.isHidden = false
        }
        else if segmentIndex == 0 {
            InfoContainer.isHidden = false
        }
        else if segmentIndex == 1 {
            ScoreboardContainer.isHidden = false
        }
        else if segmentIndex == 2 {
            SquadContainer.isHidden = false
        }
    }
    
    func designTopView() {
        topView.layer.cornerRadius = 20
        topView.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        topView.clipsToBounds = true
        topConstraints.constant = topView.bounds.height/3.5
        bgView.layer.cornerRadius = 20
    }
    
}
