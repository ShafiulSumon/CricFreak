//
//  HomeVC.swift
//  CricFreak
//
//  Created by Admin on 14/2/23.
//

import UIKit

class HomeVC: UIViewController {
    
//MARK: - Outlets
    
    @IBOutlet weak var NetworkErrorContainer: UIView!
    @IBOutlet weak var recentContainer: UIView!
    @IBOutlet weak var upcomingContainer: UIView!
    @IBOutlet weak var liveContainer: UIView!
    @IBOutlet weak var homeContainer: UIView!
    @IBOutlet weak var segmentControl: UISegmentedControl!
    @IBOutlet weak var topView: UIView!
    
//MARK: - WillAppear
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = true
        UIApplication.shared.statusBarStyle = .lightContent
        //UIApplication.shared.win
    }

//MARK: - ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpSegmentControl()
        selectContainer(segmentIndex: 0)
    }
    
//MARK: - Button Actions
    @IBAction func didChangeSegmentedValue(_ sender: UISegmentedControl) {
        selectContainer(segmentIndex: sender.selectedSegmentIndex)
    }
    
//MARK: - All functions
    func setUpSegmentControl() {
        segmentControl.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.lightGray], for: .normal)
        segmentControl.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.white], for: .selected)
        
        let unselectedBackgroundImage = UIImage.imageWithColor(color: .clear, size: CGSize(width: 1, height: 32))
        segmentControl.setBackgroundImage(unselectedBackgroundImage, for: .normal, barMetrics: .default)

        let selectedBackgroundImage = UIImage.imageWithColor(color: UIColor(named: "customBlue")!, size: CGSize(width: 1, height: 32)).imageWithBorder(width: 0, color: .blue, position: .bottom)
        segmentControl.setBackgroundImage(selectedBackgroundImage, for: .selected, barMetrics: .default)
    }
    
    func selectContainer(segmentIndex: Int) {
        homeContainer.isHidden = true
        liveContainer.isHidden = true
        upcomingContainer.isHidden = true
        recentContainer.isHidden = true
        NetworkErrorContainer.isHidden = true
        
        if segmentIndex == -1 {
            NetworkErrorContainer.isHidden = false
        }
        else if segmentIndex == 0 {
            homeContainer.isHidden = false
        }
        else if segmentIndex == 1 {
            liveContainer.isHidden = false
        }
        else if segmentIndex == 2 {
            upcomingContainer.isHidden = false
        }
        else if segmentIndex == 3 {
            recentContainer.isHidden = false
        }
    }
    
}
