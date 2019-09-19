//
//  UIImage + Rounded Frame.swift
//  HealthLeaderboard
//
//  Created by Vebby Clarissa on 19/09/19.
//  Copyright © 2019 Personal. All rights reserved.
//

import Foundation
import UIKit

extension UIImageView {
    func circleFrame(borderColor : CGColor , borderWidth : CGFloat) {
        makeRounded( cornerRadius: self.frame.size.width/2 )
        giveBorder(borderColor: borderColor ,borderWidth: borderWidth)
    }
    
    func roundedFrame (cornerRadius : CGFloat , borderColor: CGColor , borderWidth : CGFloat) {
        makeRounded( cornerRadius: cornerRadius)
        giveBorder(borderColor: borderColor ,borderWidth: borderWidth)
    }
    
    func makeRounded(cornerRadius : CGFloat ) {
        self.layer.masksToBounds = false
        self.layer.cornerRadius = cornerRadius
        self.clipsToBounds = true
    }
    func giveBorder(borderColor : CGColor, borderWidth : CGFloat) {
        self.layer.borderColor = borderColor
        self.layer.borderWidth = borderWidth
    }
}
