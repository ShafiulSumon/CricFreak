//
//  HomeVC.swift
//  CricFreak
//
//  Created by Admin on 14/2/23.
//

import UIKit

class HomeVC: UIViewController {
    
//    override var preferredStatusBarStyle: UIStatusBarStyle {
//        return .lightContent // set the status bar style to light content
//    }
    
    override func viewWillAppear(_ animated: Bool) {
        UIApplication.shared.statusBarStyle = .lightContent        
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
