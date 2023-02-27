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
    
    var timer: Timer?
    
    override func prepareForReuse() {
        super.prepareForReuse()
        timer?.invalidate()
        timer = nil
        LabelTwo.text = "Not available"
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func startTimer(for targetTime: Date) {
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true, block: { [weak self] timer in
            guard let self = self else { return }
            let remainingTime = targetTime.timeIntervalSinceNow
            if remainingTime > 0 {
                let formatter = DateComponentsFormatter()
                formatter.allowedUnits = [.hour, .minute, .second]
                formatter.unitsStyle = .abbreviated
                self.LabelTwo.text = (formatter.string(from: remainingTime) ?? "0") + " to go"
            } else {
                self.timer?.invalidate()
                self.timer = nil
                self.LabelTwo.text = "Match started"
            }
        })
    }
}
