//
//  UpcomingTblCell.swift
//  CricFreak
//
//  Created by Admin on 15/2/23.
//

import UIKit

class UpcomingTblCell: UITableViewCell {

    @IBOutlet weak var stackView: UIStackView!
    
    @IBOutlet weak var LabelOne: UILabel!
    @IBOutlet weak var LabelTwo: UILabel!
    
    @IBOutlet weak var LabelThree: UILabel!
    
    @IBOutlet weak var TeamA: UILabel!
    
    @IBOutlet weak var TeamB: UILabel!
    
    @IBOutlet weak var TeamAimg: UIImageView!
    
    @IBOutlet weak var TeamBimg: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
