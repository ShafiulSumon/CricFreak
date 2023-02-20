//
//  ScoreboardTVC.swift
//  CricFreak
//
//  Created by Admin on 20/2/23.
//

import UIKit

class ScoreboardTVC: UITableViewCell {

    @IBOutlet weak var label_a: UILabel!
    @IBOutlet weak var label_b: UILabel!
    @IBOutlet weak var label_c: UILabel!
    @IBOutlet weak var label_d: UILabel!
    @IBOutlet weak var label_e: UILabel!
    @IBOutlet weak var label_f: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
}
