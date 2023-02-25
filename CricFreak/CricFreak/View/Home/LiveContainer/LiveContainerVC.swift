//
//  LiveContainerVC.swift
//  CricFreak
//
//  Created by Admin on 15/2/23.
//

import UIKit

class LiveContainerVC: UIViewController {

    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func tryAgainBtnTapped(_ sender: UIButton) {
        activityIndicator.startAnimating()
        DispatchQueue.main.asyncAfter(deadline: .now()+2) {
            self.activityIndicator.stopAnimating()
        }
    }
    
}
