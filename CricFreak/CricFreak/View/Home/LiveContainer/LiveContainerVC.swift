//
//  LiveContainerVC.swift
//  CricFreak
//
//  Created by Admin on 15/2/23.
//

import UIKit

class LiveContainerVC: UIViewController {

//MARK: - Outlets
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
//MARK: - Did Load
    override func viewDidLoad() {
        super.viewDidLoad()
        NetworkManager.shared.monitorNetwork(viewController: self)
    }
    
//MARK: - Action Buttons
    @IBAction func tryAgainBtnTapped(_ sender: UIButton) {
        activityIndicator.startAnimating()
        DispatchQueue.main.asyncAfter(deadline: .now()+2) {
            self.activityIndicator.stopAnimating()
        }
    }
    
}
