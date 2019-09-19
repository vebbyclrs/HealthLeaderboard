//
//  ViewController.swift
//  HealthKitActivity
//
//  Created by Vebby Clarissa on 17/09/19.
//  Copyright © 2019 Personal. All rights reserved.
//

import UIKit
import HealthKit

class ViewController: UIViewController {
    
    let hkHandler = HealthKitHandler()
    var user : UserStepsModel?
    var usersArray = UsersData()
    var leaderboard : [UserStepsModel]? = nil
    
    
    @IBOutlet var userBanner: UIView!
    @IBOutlet var userImage: UIImageView!
    @IBOutlet var lbTable: UITableView!
    @IBOutlet var userRank: UILabel!
    @IBOutlet var userSteps: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if HKHealthStore.isHealthDataAvailable() {
            // Add code to use HealthKit here. Like process the data etc
            hkHandler.requestPermission()
            setView()
        }
        // Do any additional setup after loading the view.
    }
    
    func setView() {
        hkHandler.getTodayStepData { (stepCount) in
            self.user = UserStepsModel(name: "Vebby Clarissa",
                                       userImage: UIImage(named: "ownerImage")!,
                                       steps: stepCount)
            self.user?.isMe = true
            self.usersArray.userData.append(self.user!)
            self.leaderboard = self.usersArray.userData.sorted(by: { $0.steps > $1.steps })
            self.findMeInLeaderboard()
        }
        userBanner.giveShadow(x: 0, y: 5, opacity: 0.5, blur: 5, shadowColor: nil)
        userImage.circleFrame(borderColor: UIColor.white.cgColor, borderWidth: 4)
    }
    
    func findMeInLeaderboard() {
        guard let leaderboardd = self.leaderboard else {return}
        
        for (no,val) in leaderboardd.enumerated() {
            print (no,val.name,val.steps)
            if val.isMe {
                self.userRank.text = String(no+1)
                self.userSteps.text = String(Int(self.user!.steps))
                self.userImage.image = self.user!.userImage
            }
        }
    }
    
}

//extension UIViewController : UITableViewDelegate, UITableViewDataSource{
//    
//    enum Section{
//        static let firstWinner = 0
//        static let secondWinner = 1
//        static let other = 2
//    }
//    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        if section != Section.other {
//            return 1
//        } else {
//            <#code#>
//        }
//    }
//    
//    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        <#code#>
//    }
//    
//    
//}



