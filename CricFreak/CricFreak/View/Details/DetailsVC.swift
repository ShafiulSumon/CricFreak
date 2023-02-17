//
//  DetailsVC.swift
//  CricFreak
//
//  Created by Admin on 17/2/23.
//

import UIKit

class DetailsVC: UIViewController {

    @IBOutlet weak var msg: UILabel!
    
    var detailsViewModel = DetailsViewModel()
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = false
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        detailsViewModel.receiveFixtureId()
        
        detailsViewModel.observable.binding() { [weak self] id in
            DispatchQueue.main.async {
                self?.msg.text = "fixture id: \(id!)" 
            }
        }
        
    }
}
