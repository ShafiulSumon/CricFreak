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
        UIApplication.shared.statusBarStyle = .lightContent
    }

//MARK: - ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpSegmentControl()
        selectContainer(segmentIndex: -1)
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
        homeContainer.alpha = 0
        liveContainer.alpha = 0
        upcomingContainer.alpha = 0
        recentContainer.alpha = 0
        NetworkErrorContainer.alpha = 0
        
        if segmentIndex == -1 {
            NetworkErrorContainer.alpha = 1
        }
        else if segmentIndex == 0 {
            homeContainer.alpha = 1
        }
        else if segmentIndex == 1 {
            liveContainer.alpha = 1
        }
        else if segmentIndex == 2 {
            upcomingContainer.alpha = 1
        }
        else if segmentIndex == 3 {
            recentContainer.alpha = 1
        }
    }
    
}
