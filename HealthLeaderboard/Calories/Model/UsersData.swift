//
//  UserData.swift
//  HealthLeaderboard
//
//  Created by Vebby Clarissa on 19/09/19.
//  Copyright © 2019 Personal. All rights reserved.
//

import Foundation
import UIKit

class UsersData {
    var userData = [UserStepsModel]()
    
    init() {
        var user = UserStepsModel(name: "Annisa Nabila", userImage: UIImage(named: "userImage1")!, steps: 5600)
        userData.append(user)
        user = UserStepsModel(name: "Idris", userImage: UIImage(named: "userImage2")!, steps: 4300)
        userData.append(user)
        user = UserStepsModel(name: "Ayu Ananda", userImage: UIImage(named: "userImage3")!, steps: 4304)
        userData.append(user)
        user = UserStepsModel(name: "Jonathan Gafar", userImage: UIImage(named: "userImage4")!, steps: 6532)
        userData.append(user)
        user = UserStepsModel(name: "Rian Ade Putra", userImage: UIImage(named: "userImage5")!, steps: 3223)
        userData.append(user)
        user = UserStepsModel(name: "Liu Chandra", userImage: UIImage(named: "userImage6")!, steps: 9843)
        userData.append(user)
        user = UserStepsModel(name: "Yuva", userImage: UIImage(named: "userImage7")!, steps: 7644)
        userData.append(user)
        user = UserStepsModel(name: "Bong Ismail", userImage: UIImage(named: "userImage8")!, steps: 5437)
        userData.append(user)
    }
}
