//
//  HomeVC.swift
//  CricFreak
//
//  Created by Admin on 14/2/23.
//

import UIKit

class HomeVC: UIViewController {
    
//MARK: - Outlets
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
    }
    
//MARK: - Button Actions
    @IBAction func didChangeSegmentedValue(_ sender: UISegmentedControl) {
        if(sender.selectedSegmentIndex == 0) {

        }
        else if(sender.selectedSegmentIndex == 1) {
            
        }
        else if(sender.selectedSegmentIndex == 2) {
            
        }
        else if(sender.selectedSegmentIndex == 3){
            
        }
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
    
}
