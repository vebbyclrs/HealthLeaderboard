//
//  SecondWinnerCustomCell.swift
//  HealthLeaderboard
//
//  Created by Vebby Clarissa on 20/09/19.
//  Copyright © 2019 Personal. All rights reserved.
//

import UIKit

class SecondWinnerCustomCell: UITableViewCell {

    @IBOutlet var baseView: UIView!
    @IBOutlet var userImage: UIImageView!
    @IBOutlet var nameLb: UILabel!
    @IBOutlet var stepsLb: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setBaseView()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    func setBaseView() {
        baseView.giveShadow(x: 0, y: 2, opacity: 0.5, blur: 4, shadowColor: nil)
    }
    
}
