//
//  SquadTVC.swift
//  CricFreak
//
//  Created by Admin on 21/2/23.
//

import UIKit

class SquadTVC: UITableViewCell {

    
    @IBOutlet weak var imgA: UIImageView!
    @IBOutlet weak var imgB: UIImageView!
    @IBOutlet weak var labelA: UILabel!
    @IBOutlet weak var labelB: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
