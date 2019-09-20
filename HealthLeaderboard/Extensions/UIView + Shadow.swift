//
//  UIView + Shadow.swift
//  HealthLeaderboard
//
//  Created by Vebby Clarissa on 19/09/19.
//  Copyright © 2019 Personal. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    
    func giveShadow() {
        let rect = CGRect(x: 0, y: 5, width: frame.width, height: frame.height)
        layer.shadowPath = UIBezierPath(roundedRect: rect, cornerRadius: layer.cornerRadius).cgPath
        layer.shadowOpacity = 0.5
        layer.shadowRadius = 2
        layer.shadowColor = UIColor.black.cgColor
    }
}
