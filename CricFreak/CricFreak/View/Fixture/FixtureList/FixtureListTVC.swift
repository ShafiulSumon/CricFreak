//
//  FixtureListTVC.swift
//  CricFreak
//
//  Created by Admin on 24/2/23.
//

import UIKit

class FixtureListTVC: UITableViewCell {

    
    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var title: UILabel!
    
    @IBOutlet weak var bellBtn: UIButton!
    
    @IBOutlet weak var teamAimg: UIImageView!
    
    @IBOutlet weak var teamBimg: UIImageView!
    
    @IBOutlet weak var teamAname: UILabel!
    
    @IBOutlet weak var teamBname: UILabel!
    
    @IBOutlet weak var date: UILabel!
    
    @IBOutlet weak var place: UILabel!
    
    @IBOutlet weak var note: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
