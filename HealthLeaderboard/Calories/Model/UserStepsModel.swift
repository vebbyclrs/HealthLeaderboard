//
//  UserStepsModel.swift
//  HealthLeaderboard
//
//  Created by Vebby Clarissa on 19/09/19.
//  Copyright © 2019 Personal. All rights reserved.
//

import Foundation
import UIKit

class UserStepsModel {
    let name : String
    let steps : Double
    let userImage : UIImage
    var isMe : Bool = false
    
    init(name:String, userImage: UIImage, steps: Double?) {
        self.name = name
        self.steps = steps ?? 0
        self.userImage = userImage
    }
    
    
}
