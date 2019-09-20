//
//  OtherRankCustomCell.swift
//  HealthLeaderboard
//
//  Created by Vebby Clarissa on 20/09/19.
//  Copyright © 2019 Personal. All rights reserved.
//

import UIKit

class OtherRankCustomCell: UITableViewCell {

    @IBOutlet var rankAndNameLabel: UILabel!
    @IBOutlet var stepsLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
