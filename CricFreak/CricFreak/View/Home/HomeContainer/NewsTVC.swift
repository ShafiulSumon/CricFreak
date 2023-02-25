//
//  NewsTVC.swift
//  CricFreak
//
//  Created by Admin on 25/2/23.
//

import UIKit

class NewsTVC: UITableViewCell {

    
    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var imgField: UIImageView!
    @IBOutlet weak var headlines: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
