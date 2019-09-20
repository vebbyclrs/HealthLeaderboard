//
//  1stTableViewCell.swift
//  HealthLeaderboard
//
//  Created by Vebby Clarissa on 19/09/19.
//  Copyright © 2019 Personal. All rights reserved.
//

import UIKit

class FirstWinnerCustomCell: UITableViewCell {

    @IBOutlet var firstImage: UIImageView!
    @IBOutlet var firstName: UILabel!
    @IBOutlet var firstSteps: UILabel!
    @IBOutlet var secondImage: UIImageView!
    @IBOutlet var secondName: UILabel!
    @IBOutlet var secondSteps: UILabel!
    
    @IBOutlet var baseView1st: UIView!
    @IBOutlet var baseView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setBaseView()
        // Initialization code
    }
    
    func setBaseView() {
//        self.heightAnchor.constraint(equalToConstant: 64)
        baseView.giveShadow()
        baseView.backgroundColor = .white
        baseView.layer.cornerRadius = 5
        
        baseView1st.giveShadow()
        baseView1st.backgroundColor = .white
        baseView1st.layer.cornerRadius = 5
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
