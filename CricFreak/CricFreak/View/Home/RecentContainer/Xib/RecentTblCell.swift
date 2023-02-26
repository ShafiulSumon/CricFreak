//
//  RecentTblCell.swift
//  CricFreak
//
//  Created by Admin on 15/2/23.
//

import UIKit

class RecentTblCell: UITableViewCell {

    
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var labelOne: UILabel!
    @IBOutlet weak var labelTwo: UILabel!
    @IBOutlet weak var teamAimg: UIImageView!
    @IBOutlet weak var teamA: UILabel!
    @IBOutlet weak var runA: UILabel!
    @IBOutlet weak var teamBimg: UIImageView!
    @IBOutlet weak var teamB: UILabel!
    @IBOutlet weak var runB: UILabel!
    @IBOutlet weak var labelResult: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}
