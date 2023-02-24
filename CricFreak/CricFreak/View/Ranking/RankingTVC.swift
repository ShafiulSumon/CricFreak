//
//  RankingTVC.swift
//  CricFreak
//
//  Created by Admin on 24/2/23.
//

import UIKit

class RankingTVC: UITableViewCell {

    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var flag: UIImageView!
    @IBOutlet weak var countryName: UILabel!
    @IBOutlet weak var ratings: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
