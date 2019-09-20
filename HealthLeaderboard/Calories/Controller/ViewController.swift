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
    var leaderboard : [UserStepsModel]? = nil {
        didSet {
            lbTable.reloadData()
        }
    }
    
    
    @IBOutlet var userBanner: UIView!
    @IBOutlet var userImage: UIImageView!
    @IBOutlet var lbTable: UITableView!
    @IBOutlet var userRank: UILabel!
    @IBOutlet var userSteps: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lbTable.delegate = self
        lbTable.dataSource = self
        if HKHealthStore.isHealthDataAvailable() {
            // Add code to use HealthKit here. Like process the data etc
            hkHandler.requestPermission()
            setView()
        }
        // Do any additional setup after loading the view.
    }
    
    func setView() {
        registerNib()
        
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

extension ViewController : UITableViewDelegate, UITableViewDataSource{
    
    enum Section{
        static let winner = 0
        static let other = 1
    }
    
    func registerNib() {
        lbTable.register(UINib(nibName: "FirstWinnerCustomCell", bundle: nil), forCellReuseIdentifier: "firstWinnerCustomCell")
        lbTable.register(UINib(nibName: "OtherRankCustomCell", bundle: nil), forCellReuseIdentifier: "defaultCell")
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section != Section.other {
            return 1
        } else {
            return self.usersArray.userData.count-2
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section != Section.other {
            return 180
        
        } else {
            return 44
        }
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == Section.winner {
            let cell = tableView.dequeueReusableCell(withIdentifier: "firstWinnerCustomCell") as! FirstWinnerCustomCell
            if let lb = leaderboard {
                cell.firstName.text = lb[0].name
                cell.firstImage.image = lb[0].userImage
                cell.firstSteps.text = "\(Int(lb[0].steps).description) steps"
                
                cell.secondName.text = lb[1].name
                cell.secondImage.image = lb[1].userImage
                cell.secondSteps.text = "\(Int(lb[1].steps).description) steps"
            }
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "defaultCell", for: indexPath) as! OtherRankCustomCell
            if let lb = leaderboard {
                let rank = indexPath.row+2
                cell.rankAndNameLabel.text = "\(rank+1). \(lb[rank].name)"
                cell.stepsLabel.text = "\(Int(lb[rank].steps).description) steps"
                    
//                cell.textLabel?.text = "\(rank+1). \(lb[rank].name)"
//                cell.detailTextLabel?.text = lb[rank].steps.description
            }
            return cell
        }
    }
    
    
}



