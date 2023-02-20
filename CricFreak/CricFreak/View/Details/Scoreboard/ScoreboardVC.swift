//
//  ScoreboardVC.swift
//  CricFreak
//
//  Created by Admin on 19/2/23.
//

import UIKit

class ScoreboardVC: UIViewController {

    var data: ScoreboardData?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ScoreboardViewModel.shared.observable.binding() { [weak self] res in
            DispatchQueue.main.async {
                self?.data = res?.data
            }
        }
    }
}
