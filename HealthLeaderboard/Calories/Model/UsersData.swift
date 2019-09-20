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
        var user = UserStepsModel(name: "Annisa Nabila", userImage: UIImage(named: "userImage1")!, steps: 876)
        userData.append(user)
        user = UserStepsModel(name: "Idris", userImage: UIImage(named: "userImage2")!, steps: 234)
        userData.append(user)
        user = UserStepsModel(name: "Ayu Ananda", userImage: UIImage(named: "userImage3")!, steps: 673)
        userData.append(user)
        user = UserStepsModel(name: "Jonathan Gafar", userImage: UIImage(named: "userImage4")!, steps: 90)
        userData.append(user)
        user = UserStepsModel(name: "Rian Ade Putra", userImage: UIImage(named: "userImage5")!, steps: 323)
        userData.append(user)
        user = UserStepsModel(name: "Liu Chandra", userImage: UIImage(named: "userImage6")!, steps: 2346)
        userData.append(user)
        user = UserStepsModel(name: "Yuva", userImage: UIImage(named: "userImage7")!, steps: 432)
        userData.append(user)
        user = UserStepsModel(name: "Bong Ismail", userImage: UIImage(named: "userImage8")!, steps: 122)
        userData.append(user)
    }
}
