//
//  1stTableViewCell.swift
//  HealthLeaderboard
//
//  Created by Vebby Clarissa on 19/09/19.
//  Copyright © 2019 Personal. All rights reserved.
//

import UIKit

class FirstWinnerCustomCell: UITableViewCell {

    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var stepsLabel: UILabel!
    @IBOutlet var userImage: UIImageView!
    @IBOutlet var baseView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setBaseView()
        // Initialization code
    }
    
    func setBaseView() {
        self.heightAnchor.constraint(equalToConstant: 64)
//        baseView.giveShadow(x: 0, y: 2, opacity: 0.5, blur: 2, shadowColor: nil)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
